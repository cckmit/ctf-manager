package com.ctf.admin.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ctf.admin.entity.SysDict;
import com.ctf.admin.mapper.SysDictMapper;
import com.ctf.admin.mapper.SysRoleMapper;
import com.ctf.admin.service.SysDictService;
import com.ctf.component.commons.result.PaginationBuilder;
import com.ctf.component.commons.utils.CollectionUtils;
import com.ctf.component.commons.utils.CurrentUserUtils;
import com.ctf.component.commons.utils.RecursiveListUtils;
import com.ctf.component.commons.utils.SequenceGenerator;

/**
 * 字典信息的业务逻辑实现层
 *
 *
 */
@Service
@Transactional
public class SysDictServiceImpl implements SysDictService {

	private final Logger logger = LoggerFactory.getLogger(getClass());
	private static SequenceGenerator sequenceGenerator = new SequenceGenerator();

	@Autowired
	private SysDictMapper sysDictMapper;
	@Autowired
	private SysRoleMapper sysRoleMapper;

	/**
	 * 查询字典的数据分页
	 */
	@Override
	public Map<String, Object> querySysDict(Integer currentPage, Integer pageSize, String dictType, String dictName, String dictValue) {
		List<LinkedHashMap<String, Object>> resultList = new ArrayList<>();
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("dictType", dictType);
		paramMap.put("dictName", dictName);
		paramMap.put("dictValue", dictValue);
		paramMap.put("tenantCode", CurrentUserUtils.getOAuth2AuthenticationDetailsInfo().get("tenantCode"));// 当前用户的租户编码

		List<LinkedHashMap<String, Object>> totalList = sysDictMapper.querySysDict(paramMap);
		String roleData = sysRoleMapper.queryRoleData("sysdict", CurrentUserUtils.getOAuth2AuthenticationDetailsInfo().get("name"));
		String[] roleDataArray = roleData == null ? null : roleData.split(",");
		if (roleDataArray != null && roleDataArray.length > 0) {// 处理数据权限
			totalList = CollectionUtils.convertFilterList(totalList, roleDataArray);
		}

		if (StringUtils.isBlank(dictType) && StringUtils.isBlank(dictName) && StringUtils.isBlank(dictValue)) {
			resultList = RecursiveListUtils.queryRecursiveList(totalList);
		} else {
			resultList.addAll(totalList);
		}
		return PaginationBuilder.buildResult(resultList, (long) resultList.size(), currentPage, pageSize);
	}

	/**
	 * 查询字典的树数据
	 */
	@Override
	public LinkedHashMap<String, Object> querySysDictTree() {
		LinkedHashMap<String, Object> resultMap = new LinkedHashMap<>();
		List<LinkedHashMap<String, Object>> totalList = sysDictMapper.querySysDictTree(CurrentUserUtils.getOAuth2AuthenticationDetailsInfo().get("tenantCode"));// 当前用户的租户编码
		List<LinkedHashMap<String, Object>> resultList = RecursiveListUtils.queryRecursiveList(totalList);
		resultMap.put("list", resultList);
		return resultMap;
	}

	/**
	 * 查询字典的导出数据列表
	 */
	@Override
	public List<LinkedHashMap<String, Object>> querySysDictForExcel(Map<String, Object> paramMap) {
		return sysDictMapper.querySysDict(paramMap);
	}

	/**
	 * 根据字典类型查询下拉框数据列表
	 */
	@Override
	public List<LinkedHashMap<String, Object>> queryDictByDictType(String dictType) {
		return sysDictMapper.queryDictByDictType(dictType);
	}

	/**
	 * 根据字典类型查询多选框数据列表
	 */
	@Override
	public List<LinkedHashMap<String, Object>> queryDictByDictTypeCheckbox(String dictType) {
		return sysDictMapper.queryDictByDictTypeCheckbox(dictType);
	}

	/**
	 * 新增字典
	 */
	@Override
	public void insertSysDict(SysDict sysDict) {
		if (sysDict.getParentId() == 0L) {
			Integer existing = sysDictMapper.getSysDictByDictType(sysDict.getDictType().trim());
			if (existing != null && existing > 0) {
				throw new IllegalArgumentException("字典类型已存在");
			}
		}
		validateDict(sysDict);
		sysDict.setId(sequenceGenerator.nextId());
		sysDict.setTenantCode(CurrentUserUtils.getOAuth2AuthenticationDetailsInfo().get("tenantCode"));// 当前用户的租户编码
		sysDictMapper.insertSysDict(sysDict);
		logger.info("字典已新增： {}", sysDict.getDictType());
	}

	/**
	 * 编辑字典
	 */
	@Override
	public void updateSysDict(SysDict sysDict) {
		if (sysDict.getId().longValue() == sysDict.getParentId().longValue()) {
			throw new IllegalArgumentException("当前节点不能作为自身的父节点");
		}
		validateDict(sysDict);
		sysDictMapper.updateSysDict(sysDict);
		logger.info("字典已编辑： {}", sysDict.getDictType());
	}

	/**
	 * 验证字典类型
	 *
	 * @param sysDict 字典对象
	 */
	private void validateDict(SysDict sysDict) {
		if (sysDict.getParentId() != 0L) {
			String dictType = sysDictMapper.getDictTypeByParentId(sysDict.getParentId());
			if (!sysDict.getDictType().equals(dictType)) {
				throw new IllegalArgumentException("子节点的字典类型要跟父节点的字典类型相同");
			}
		}
	}

	/**
	 * 删除字典
	 */
	@Override
	public void deleteSysDict(Long[] id) {
		Set<Long> ids = new HashSet<>();
		for (int i = 0; i < id.length; i++) {
			ids.add(id[i]);
			getRecursiveIds(id[i], ids);
		}
		sysDictMapper.deleteSysDict(ids.stream().toArray(Long[]::new));
	}

	/**
	 * 使用递归的方式查询所有子节点的id
	 *
	 * @param id  子节点id
	 * @param ids 子节点id集
	 */
	private void getRecursiveIds(Long id, Set<Long> ids) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("parentId", id);
		List<LinkedHashMap<String, Object>> list = sysDictMapper.querySysDict(paramMap);
		for (int i = 0; i < list.size(); i++) {
			for (Entry<String, Object> entry : list.get(i).entrySet()) {
				String key = entry.getKey();
				Object value = entry.getValue();
				if (key.equals("id")) {
					ids.add(Long.valueOf(String.valueOf(value)));
					getRecursiveIds(Long.valueOf(String.valueOf(value)), ids);
				}
			}
		}
	}

}
