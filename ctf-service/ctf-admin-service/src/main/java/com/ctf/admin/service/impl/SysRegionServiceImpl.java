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

import com.ctf.admin.entity.SysRegion;
import com.ctf.admin.mapper.SysRegionMapper;
import com.ctf.admin.mapper.SysRoleMapper;
import com.ctf.admin.service.SysDictService;
import com.ctf.admin.service.SysRegionService;
import com.ctf.component.commons.result.PaginationBuilder;
import com.ctf.component.commons.utils.CollectionUtils;
import com.ctf.component.commons.utils.CurrentUserUtils;
import com.ctf.component.commons.utils.RecursiveListUtils;
import com.ctf.component.commons.utils.SequenceGenerator;

/**
 * 区域信息的业务逻辑实现层
 *
 *
 */
@Service
@Transactional
public class SysRegionServiceImpl implements SysRegionService {

	private final Logger logger = LoggerFactory.getLogger(getClass());
	private static SequenceGenerator sequenceGenerator = new SequenceGenerator();

	@Autowired
	private SysRegionMapper sysRegionMapper;
	@Autowired
	private SysRoleMapper sysRoleMapper;
	@Autowired
	private SysDictService sysDictService;

	/**
	 * 查询区域的数据分页
	 */
	@Override
	public Map<String, Object> querySysRegion(Integer currentPage, Integer pageSize, String regionName, String regionCode, String regionType) {
		List<LinkedHashMap<String, Object>> resultList = new ArrayList<>();
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("regionName", regionName);
		paramMap.put("regionCode", regionCode);
		paramMap.put("regionType", regionType);
		paramMap.put("tenantCode", CurrentUserUtils.getOAuth2AuthenticationDetailsInfo().get("tenantCode"));// 当前用户的租户编码

		List<LinkedHashMap<String, Object>> totalList = sysRegionMapper.querySysRegion(paramMap);
		String roleData = sysRoleMapper.queryRoleData("sysregion", CurrentUserUtils.getOAuth2AuthenticationDetailsInfo().get("name"));
		String[] roleDataArray = roleData == null ? null : roleData.split(",");
		if (roleDataArray != null && roleDataArray.length > 0) {// 处理数据权限
			totalList = CollectionUtils.convertFilterList(totalList, roleDataArray);
		}

		if (StringUtils.isBlank(regionName) && StringUtils.isBlank(regionCode) && StringUtils.isBlank(regionType)) {
			resultList = RecursiveListUtils.queryRecursiveList(totalList);
		} else {
			resultList.addAll(totalList);
		}
		return PaginationBuilder.buildResult(resultList, (long) resultList.size(), currentPage, pageSize);
	}

	/**
	 * 查询区域的树数据
	 */
	@Override
	public LinkedHashMap<String, Object> querySysRegionTree() {
		LinkedHashMap<String, Object> resultMap = new LinkedHashMap<>();
		List<LinkedHashMap<String, Object>> totalList = sysRegionMapper
				.querySysRegionTree(CurrentUserUtils.getOAuth2AuthenticationDetailsInfo().get("tenantCode"));// 当前用户的租户编码
		List<LinkedHashMap<String, Object>> resultList = RecursiveListUtils.queryRecursiveList(totalList);
		resultMap.put("list", resultList);
		return resultMap;
	}

	/**
	 * 查询区域类型的下拉框数据
	 */
	@Override
	public LinkedHashMap<String, Object> queryRegionType() {
		LinkedHashMap<String, Object> resultMap = new LinkedHashMap<>();
		List<LinkedHashMap<String, Object>> resultList = sysDictService.queryDictByDictType("region");
		resultMap.put("list", resultList);
		return resultMap;
	}

	/**
	 * 查询区域的导出数据列表
	 */
	@Override
	public List<LinkedHashMap<String, Object>> querySysRegionForExcel(Map<String, Object> paramMap) {
		return sysRegionMapper.querySysRegion(paramMap);
	}

	/**
	 * 查询全部省份数据
	 */
	@Override
	public LinkedHashMap<String, Object> queryProvince() {
		LinkedHashMap<String, Object> resultMap = new LinkedHashMap<>();
		List<LinkedHashMap<String, Object>> resultList = sysRegionMapper.queryProvince();
		resultMap.put("list", resultList);
		return resultMap;
	}

	/**
	 * 根据省份代码查询对应地市数据
	 */
	@Override
	public LinkedHashMap<String, Object> queryCity(String province) {
		LinkedHashMap<String, Object> resultMap = new LinkedHashMap<>();
		List<LinkedHashMap<String, Object>> resultList = sysRegionMapper.queryCity(province);
		resultMap.put("list", resultList);
		return resultMap;
	}

	/**
	 * 新增区域
	 */
	@Override
	public void insertSysRegion(SysRegion sysRegion) {
		validateRegion(sysRegion);
		Integer existing = sysRegionMapper.getSysRegionByRegionCode(sysRegion.getRegionCode().trim());
		if (existing != null && existing > 0) {
			throw new IllegalArgumentException("区域代码已存在");
		}
		sysRegion.setId(sequenceGenerator.nextId());
		sysRegion.setTenantCode(CurrentUserUtils.getOAuth2AuthenticationDetailsInfo().get("tenantCode"));// 当前用户的租户编码
		sysRegionMapper.insertSysRegion(sysRegion);
		logger.info("区域已新增： {}", sysRegion.getRegionName());
	}

	/**
	 * 编辑区域
	 */
	@Override
	public void updateSysRegion(SysRegion sysRegion) {
		validateRegion(sysRegion);
		sysRegionMapper.updateSysRegion(sysRegion);
		logger.info("区域已编辑： {}", sysRegion.getRegionName());
	}

	/**
	 * 验证区域父子节点
	 *
	 * @param sysRegion 区域对象
	 */
	private void validateRegion(SysRegion sysRegion) {
		if (sysRegion.getRegionCode().equals(sysRegion.getParentRegionCode())) {
			throw new IllegalArgumentException("当前节点不能作为自身的父节点");
		}
	}

	/**
	 * 删除区域
	 */
	@Override
	public void deleteSysRegion(String[] regionCode) {
		Set<String> regionCodes = new HashSet<>();
		for (int i = 0; i < regionCode.length; i++) {
			regionCodes.add(regionCode[i]);
			getRecursiveRegionCodes(regionCode[i], regionCodes);
		}
		sysRegionMapper.deleteSysRegion(regionCodes.stream().toArray(String[]::new));
	}

	/**
	 * 使用递归的方式查询所有子节点的区域代码
	 *
	 * @param regionCode  子节点区域代码
	 * @param regionCodes 子节点区域代码集
	 */
	private void getRecursiveRegionCodes(String regionCode, Set<String> regionCodes) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("parentRegionCode", regionCode);
		List<LinkedHashMap<String, Object>> list = sysRegionMapper.querySysRegion(paramMap);
		for (int i = 0; i < list.size(); i++) {
			for (Entry<String, Object> entry : list.get(i).entrySet()) {
				String key = entry.getKey();
				Object value = entry.getValue();
				if (key.equals("regionCode")) {
					regionCodes.add((String) value);
					getRecursiveRegionCodes((String) value, regionCodes);
				}
			}
		}
	}

}
