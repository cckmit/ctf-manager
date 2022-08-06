package com.ctf.admin.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ctf.admin.entity.SysUser;
import com.ctf.admin.mapper.SysRoleMapper;
import com.ctf.admin.mapper.SysUserMapper;
import com.ctf.admin.service.SysUserService;
import com.ctf.component.commons.result.PaginationBuilder;
import com.ctf.component.commons.utils.CollectionUtils;
import com.ctf.component.commons.utils.CurrentUserUtils;
import com.ctf.component.commons.utils.SequenceGenerator;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

/**
 * 用户信息的业务逻辑实现层
 *
 *
 */
@Service
@Transactional
public class SysUserServiceImpl implements SysUserService {

	private final Logger logger = LoggerFactory.getLogger(getClass());
	private static final BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
	private static SequenceGenerator sequenceGenerator = new SequenceGenerator();

	@Autowired
	private SysUserMapper sysUserMapper;
	@Autowired
	private SysRoleMapper sysRoleMapper;

	/**
	 * 查询用户分页
	 */
	@Override
	public Map<String, Object> querySysUser(Integer currentPage, Integer pageSize, String username, String status, String sorter) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("username", username);
		paramMap.put("tenantCode", CurrentUserUtils.getOAuth2AuthenticationDetailsInfo().get("tenantCode"));// 当前用户的租户编码
		if (StringUtils.isNotBlank(status)) {
			String[] statusArray = status.split(",");
			paramMap.put("statusList", (Short[]) ConvertUtils.convert(statusArray, Short.class));
		}
		if (StringUtils.isNotBlank(sorter)) {
			String sort = sorter.substring(0, sorter.lastIndexOf('_'));
			String sequence = "ascend".equals(sorter.substring(sorter.lastIndexOf('_') + 1)) ? "ASC" : "DESC";
			paramMap.put("sort", sort);
			paramMap.put("sequence", sequence);
		} else {
			paramMap.put("sort", "createTime");
			paramMap.put("sequence", "DESC");
		}
		Page<Object> page = PageHelper.startPage(currentPage, pageSize);
		List<LinkedHashMap<String, Object>> resultList = sysUserMapper.querySysUser(paramMap);

		String roleData = sysRoleMapper.queryRoleData("sysuser", CurrentUserUtils.getOAuth2AuthenticationDetailsInfo().get("name"));
		String[] roleDataArray = roleData == null ? null : roleData.split(",");
		if (roleDataArray != null && roleDataArray.length > 0) {// 处理数据权限
			return PaginationBuilder.buildResult(CollectionUtils.convertFilterList(resultList, roleDataArray), page.getTotal(), currentPage, pageSize);
		} else {
			return PaginationBuilder.buildResult(resultList, page.getTotal(), currentPage, pageSize);
		}
	}

	/**
	 * 根据参数查询用户列表
	 */
	public List<LinkedHashMap<String, Object>> querySysUser(Map<String, Object> paramMap) {
		return sysUserMapper.querySysUser(paramMap);
	}

	/**
	 * 查询用户的导出数据列表
	 */
	@Override
	public List<LinkedHashMap<String, Object>> querySysUserForExcel(Map<String, Object> paramMap) {
		if (paramMap.get("status") != null && StringUtils.isNotBlank(paramMap.get("status").toString())) {
			String[] statusArray = paramMap.get("status").toString().split(",");
			paramMap.put("statusList", (Short[]) ConvertUtils.convert(statusArray, Short.class));
		}
		List<LinkedHashMap<String, Object>> resultList = new ArrayList<>();
		List<LinkedHashMap<String, Object>> dataList = sysUserMapper.querySysUser(paramMap);
		if (!org.apache.commons.collections.CollectionUtils.isEmpty(dataList)) {
			dataList.forEach(map -> {
				LinkedHashMap<String, Object> entity = new LinkedHashMap<>();
				for (Entry<String, Object> entry : map.entrySet()) {
					String key = entry.getKey();
					Object value = entry.getValue();
					if ("status".equals(key)) {
						value = Short.valueOf(value.toString()) == 1 ? "正常" : "禁用";
					}
					entity.put(key, value);
				}
				resultList.add(entity);
			});
		}
		return resultList;
	}

	/**
	 * 根据用户ID查询用户名的数据列表
	 */
	@Override
	public List<LinkedHashMap<String, Object>> queryUsername(Long[] id) {
		return sysUserMapper.queryUsername(id);
	}

	/**
	 * 根据用户名查询用户ID的数据列表
	 */
	@Override
	public List<Long> querySysUserId(String[] username) {
		return sysUserMapper.querySysUserId(username);
	}

	/**
	 * 新增用户
	 */
	@Override
	public void insertSysUser(SysUser sysUser) {
		Integer existing = sysUserMapper.getSysUserByIdentification(sysUser.getUsername().trim(), sysUser.getEmail().trim(), sysUser.getMobile().trim());
		if (existing != null && existing > 0) {
			throw new IllegalArgumentException("用户名或邮箱或手机号已存在");
		}
		long userId = sequenceGenerator.nextId();
		sysUser.setId(userId);
		sysUser.setPassword(encoder.encode(sysUser.getPassword()));
		sysUser.setTenantCode(CurrentUserUtils.getOAuth2AuthenticationDetailsInfo().get("tenantCode"));// 当前用户的租户编码
		sysUserMapper.insertSysUser(sysUser);
		for (int i = 0; i < sysUser.getRoleId().length; i++) {
			sysRoleMapper.insertSysRoleUser(sequenceGenerator.nextId(), sysUser.getRoleId()[i], userId);
		}
		logger.info("用户已新增： {}", sysUser.getUsername());
	}

	/**
	 * 将对应的角色授予用户
	 */
	@Override
	public void insertRoleIdUserId(Long[] roleId, Long userId) {
		Set<Long> roleIdSet = new HashSet<>();
		for (int x = 0; x < roleId.length; x++) {
			roleIdSet.add(roleId[x]);
		}
		sysRoleMapper.deleteSysRoleUser(userId, null);
		Iterator<Long> iterator = roleIdSet.iterator();
		while (iterator.hasNext()) {
			Long roleIdData = iterator.next();
			sysRoleMapper.insertSysRoleUser(sequenceGenerator.nextId(), roleIdData, userId);
		}
	}

	/**
	 * 编辑用户
	 */
	@Override
	public void updateSysUser(SysUser sysUser) {
		Integer existing = sysUserMapper.getSysUserByIdEmailMobile(sysUser.getId(), sysUser.getEmail().trim(), sysUser.getMobile().trim());
		if (existing != null && existing > 0) {
			throw new IllegalArgumentException("邮箱或手机号已存在");
		}
		if (StringUtils.isNotBlank(sysUser.getPassword())) {
			sysUser.setPassword(encoder.encode(sysUser.getPassword()));
		}
		sysUserMapper.updateSysUser(sysUser);
		sysRoleMapper.deleteSysRoleUser(sysUser.getId(), null);
		for (int i = 0; i < sysUser.getRoleId().length; i++) {
			sysRoleMapper.insertSysRoleUser(sequenceGenerator.nextId(), sysUser.getRoleId()[i], sysUser.getId());
		}
		logger.info("用户已编辑： {}", sysUser.getUsername());
	}

	/**
	 * 删除用户
	 */
	@Override
	public void deleteSysUser(Long[] id) {
		if (ArrayUtils.contains(id, 1L)) {
			throw new IllegalArgumentException("系统管理员不能删除");
		}
		sysUserMapper.deleteSysUser(id);
	}

}
