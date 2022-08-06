package com.ctf.admin.service;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.ctf.admin.entity.SysRole;

/**
 * 角色信息的业务逻辑接口层
 *
 *
 */
public interface SysRoleService {

	/**
	 * 查询角色分页
	 *
	 * @param currentPage 当前页数
	 * @param pageSize    每页记录数
	 * @param roleName    角色名称
	 * @param sorter      排序
	 * @return
	 */
	Map<String, Object> querySysRole(Integer currentPage, Integer pageSize, String roleName, String sorter);

	/**
	 * 查询角色名称的下拉框数据列表
	 *
	 * @param userId 用户ID
	 * @param assign 是否授权（0是未授权，1是已授权）
	 * @return
	 */
	List<LinkedHashMap<String, Object>> queryRoleName(Long userId, Short assign);

	/**
	 * 查询角色编码的下拉框数据列表
	 *
	 * @return
	 */
	List<LinkedHashMap<String, Object>> queryRoleCode();

	/**
	 * 查询角色的多选框数据列表
	 *
	 * @return
	 */
	List<LinkedHashMap<String, Object>> queryRoleNameCheckbox();

	/**
	 * 查询角色的导出数据列表
	 *
	 * @param paramMap 参数Map
	 * @return
	 */
	List<LinkedHashMap<String, Object>> querySysRoleForExcel(Map<String, Object> paramMap);

	/**
	 * 查询当前用户的过滤数据字段
	 *
	 * @param menuCode 菜单编码
	 * @param username 用户名
	 * @return
	 */
	String queryRoleData(String menuCode, String username);

	/**
	 * 新增角色
	 *
	 * @param sysRole 角色对象
	 */
	void insertSysRole(SysRole sysRole);

	/**
	 * 将对应的用户授权给角色
	 *
	 * @param roleId 角色ID
	 * @param userId 用户ID
	 */
	void insertRoleIdUserId(Long roleId, Long[][] userId);

	/**
	 * 编辑角色
	 *
	 * @param sysRole 角色对象
	 */
	void updateSysRole(SysRole sysRole);

	/**
	 * 删除角色
	 *
	 * @param id 角色ID
	 */
	void deleteSysRole(Long[] id);

}
