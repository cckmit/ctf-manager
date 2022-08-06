package com.ctf.admin.mapper;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.ctf.admin.entity.SysRole;

/**
 * 角色信息的数据持久接口层
 * 
 * 
 */
public interface SysRoleMapper {

	/**
	 * 查询角色分页或导出数据
	 * 
	 * @param paramMap 参数Map
	 * @return
	 */
	List<LinkedHashMap<String, Object>> querySysRole(Map<String, Object> paramMap);

	/**
	 * 查询角色名称的下拉框数据列表
	 * 
	 * @param tenantCode 租户编码
	 * @param userId     用户ID
	 * @param assign     是否授权（0是未授权，1是已授权）
	 * @return
	 */
	List<LinkedHashMap<String, Object>> queryRoleName(String tenantCode, Long userId, Short assign);

	/**
	 * 查询角色编码的下拉框数据列表
	 * 
	 * @return
	 */
	List<LinkedHashMap<String, Object>> queryRoleCode();

	/**
	 * 查询角色编码数据列表
	 * 
	 * @return
	 */
	List<String> queryRoleCodeList();

	/**
	 * 查询角色的多选框数据列表
	 * 
	 * @return
	 */
	List<LinkedHashMap<String, Object>> queryRoleNameCheckbox();

	/**
	 * 查询是否已存在此角色编码
	 * 
	 * @param roleCode 角色编码
	 * @return
	 */
	Integer getSysRoleByRoleCode(String roleCode);

	/**
	 * 查询当前用户的过滤数据字段
	 * 
	 * @param menuCode 菜单编码
	 * @param username 用户名
	 * @return
	 */
	String queryRoleData(String menuCode, String username);

	/**
	 * 根据角色ID查询用户ID
	 * 
	 * @param roleId 角色ID
	 * @return
	 */
	List<Long> queryUserIdByRoleId(Long roleId);

	/**
	 * 根据用户ID查询角色ID
	 * 
	 * @param userId 用户ID
	 * @return
	 */
	List<Long> queryRoleIdByUserId(Long userId);

	/**
	 * 新增角色
	 * 
	 * @param sysRole 角色对象
	 * @return
	 */
	int insertSysRole(SysRole sysRole);

	/**
	 * 编辑角色
	 * 
	 * @param sysRole 角色对象
	 * @return
	 */
	int updateSysRole(SysRole sysRole);

	/**
	 * 删除角色
	 * 
	 * @param id 角色ID
	 * @return
	 */
	int deleteSysRole(Long[] id);

	/**
	 * 新增角色和用户关联信息
	 * 
	 * @param id     ID
	 * @param roleId 角色ID
	 * @param userId 用户ID
	 * @return
	 */
	int insertSysRoleUser(Long id, Long roleId, Long userId);

	/**
	 * 删除角色和用户关联信息
	 * 
	 * @param userId 用户ID
	 * @param roleId 角色ID
	 * @return
	 */
	int deleteSysRoleUser(Long userId, Long roleId);

}
