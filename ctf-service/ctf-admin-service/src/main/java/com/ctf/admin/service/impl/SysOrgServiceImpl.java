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

import com.ctf.admin.entity.SysOrg;
import com.ctf.admin.mapper.SysOrgMapper;
import com.ctf.admin.mapper.SysRoleMapper;
import com.ctf.admin.mapper.SysUserMapper;
import com.ctf.admin.service.SysDictService;
import com.ctf.admin.service.SysOrgService;
import com.ctf.component.commons.result.PaginationBuilder;
import com.ctf.component.commons.utils.CollectionUtils;
import com.ctf.component.commons.utils.CurrentUserUtils;
import com.ctf.component.commons.utils.RecursiveListUtils;
import com.ctf.component.commons.utils.SequenceGenerator;

/**
 * 机构信息的业务逻辑实现层
 *
 *
 */
@Service
@Transactional
public class SysOrgServiceImpl implements SysOrgService {

	private final Logger logger = LoggerFactory.getLogger(getClass());
	private static SequenceGenerator sequenceGenerator = new SequenceGenerator();

	@Autowired
	private SysOrgMapper sysOrgMapper;
	@Autowired
	private SysRoleMapper sysRoleMapper;
	@Autowired
	private SysDictService sysDictService;
	@Autowired
	private SysUserMapper sysUserMapper;

	/**
	 * 查询机构的数据分页
	 */
	@Override
	public Map<String, Object> querySysOrg(Integer currentPage, Integer pageSize, String orgName, String orgType, String orgDescription) {
		List<LinkedHashMap<String, Object>> resultList = new ArrayList<>();
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("orgName", orgName);
		paramMap.put("orgType", orgType);
		paramMap.put("orgDescription", orgDescription);
		paramMap.put("tenantCode", CurrentUserUtils.getOAuth2AuthenticationDetailsInfo().get("tenantCode"));// 当前用户的租户编码

		List<LinkedHashMap<String, Object>> totalList = sysOrgMapper.querySysOrg(paramMap);
		String roleData = sysRoleMapper.queryRoleData("sysorg", CurrentUserUtils.getOAuth2AuthenticationDetailsInfo().get("name"));
		String[] roleDataArray = roleData == null ? null : roleData.split(",");
		if (roleDataArray != null && roleDataArray.length > 0) {// 处理数据权限
			totalList = CollectionUtils.convertFilterList(totalList, roleDataArray);
		}

		if (StringUtils.isBlank(orgType) && StringUtils.isBlank(orgName) && StringUtils.isBlank(orgDescription)) {
			resultList = RecursiveListUtils.queryRecursiveList(totalList);
		} else {
			resultList.addAll(totalList);
		}
		return PaginationBuilder.buildResult(resultList, (long) resultList.size(), currentPage, pageSize);
	}

	/**
	 * 根据参数查询机构列表
	 */
	public List<LinkedHashMap<String, Object>> querySysOrg(Map<String, Object> paramMap) {
		return sysOrgMapper.querySysOrg(paramMap);
	}

	/**
	 * 查询机构的树数据
	 */
	@Override
	public LinkedHashMap<String, Object> querySysOrgTree() {
		LinkedHashMap<String, Object> resultMap = new LinkedHashMap<>();
		List<LinkedHashMap<String, Object>> totalList = sysOrgMapper.querySysOrgTree(CurrentUserUtils.getOAuth2AuthenticationDetailsInfo().get("tenantCode"));// 当前用户的租户编码
		List<LinkedHashMap<String, Object>> resultList = RecursiveListUtils.queryRecursiveList(totalList);
		resultMap.put("list", resultList);
		return resultMap;
	}

	/**
	 * 查询机构类型的下拉框数据
	 */
	@Override
	public LinkedHashMap<String, Object> queryOrgType() {
		LinkedHashMap<String, Object> resultMap = new LinkedHashMap<>();
		List<LinkedHashMap<String, Object>> resultList = sysDictService.queryDictByDictType("org");
		resultMap.put("list", resultList);
		return resultMap;
	}

	/**
	 * 查询机构用户的树数据
	 */
	@Override
	public List<LinkedHashMap<String, Object>> queryOrgUserTree(Long roleId, Short assign) {
		List<LinkedHashMap<String, Object>> totalList = sysOrgMapper.queryOrgUserTree(CurrentUserUtils.getOAuth2AuthenticationDetailsInfo().get("tenantCode"));// 当前用户的租户编码

		// 获取机构和其包含的用户
		List<Long> orgIdList = sysOrgMapper.queryOrgId();
		Map<Long, String> orgUserMap = new HashMap<>();
		for (int i = 0; i < orgIdList.size(); i++) {
			Long orgId = orgIdList.get(i);
			List<Long> userIdList = sysUserMapper.queryUserIdByOrgId(orgId, roleId, assign);
			orgUserMap.put(orgId, StringUtils.join(userIdList.toArray(), ","));
		}

		// 获取用户名和昵称，以用户名作为键
		List<LinkedHashMap<String, Object>> usernameNicknameList = sysUserMapper.queryUsernameNickname();
		Map<String, String> usernameNicknameMap = new HashMap<>();
		for (int i = 0; i < usernameNicknameList.size(); i++) {
			String usernameNicknameKey = null;
			String usernameNicknameValue = null;
			for (Entry<String, Object> entry : usernameNicknameList.get(i).entrySet()) {
				String key = entry.getKey();
				Object value = entry.getValue();
				if (key.equals("value")) {
					usernameNicknameKey = value.toString();
				}
				if (key.equals("label")) {
					usernameNicknameValue = value.toString();
				}
			}
			usernameNicknameMap.put(usernameNicknameKey, usernameNicknameValue);
		}

		return RecursiveListUtils.queryOrgUserRecursiveList(totalList, orgUserMap, usernameNicknameMap);
	}

	/**
	 * 查询机构的导出数据列表
	 */
	@Override
	public List<LinkedHashMap<String, Object>> querySysOrgForExcel(Map<String, Object> paramMap) {
		return sysOrgMapper.querySysOrg(paramMap);
	}

	/**
	 * 新增机构
	 */
	@Override
	public void insertSysOrg(SysOrg sysOrg) {
		sysOrg.setId(sequenceGenerator.nextId());
		sysOrg.setTenantCode(CurrentUserUtils.getOAuth2AuthenticationDetailsInfo().get("tenantCode"));// 当前用户的租户编码
		sysOrgMapper.insertSysOrg(sysOrg);
		logger.info("机构已新增： {}", sysOrg.getOrgName());
	}

	/**
	 * 编辑机构
	 */
	@Override
	public void updateSysOrg(SysOrg sysOrg) {
		if (sysOrg.getId().longValue() == sysOrg.getParentId().longValue()) {
			throw new IllegalArgumentException("当前节点不能作为自身的父节点");
		}
		sysOrgMapper.updateSysOrg(sysOrg);
		logger.info("机构已编辑： {}", sysOrg.getOrgName());
	}

	/**
	 * 删除机构
	 */
	@Override
	public void deleteSysOrg(Long[] id) {
		Set<Long> ids = new HashSet<>();
		for (int i = 0; i < id.length; i++) {
			ids.add(id[i]);
			getRecursiveIds(id[i], ids);
		}
		sysOrgMapper.deleteSysOrg(ids.stream().toArray(Long[]::new));
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
		List<LinkedHashMap<String, Object>> list = sysOrgMapper.querySysOrg(paramMap);
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
