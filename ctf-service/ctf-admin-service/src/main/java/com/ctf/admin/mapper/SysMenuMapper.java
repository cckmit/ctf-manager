package com.ctf.admin.mapper;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.ctf.admin.entity.SysMenu;

/**
 * 菜单信息的数据持久接口层
 *
 *
 */
public interface SysMenuMapper {

	/**
	 * 查询菜单分页或导出数据
	 *
	 * @param paramMap 参数Map
	 * @return
	 */
	List<LinkedHashMap<String, Object>> querySysMenu(Map<String, Object> paramMap);

	/**
	 * 查询菜单的树数据列表
	 *
	 * @param tenantCode 租户编码
	 * @return
	 */
	List<LinkedHashMap<String, Object>> querySysMenuTree(String tenantCode);

	/**
	 * 查询菜单编码
	 *
	 * @return
	 */
	List<String> queryMenuCode();

	/**
	 * 查询菜单包含的按钮数据列表
	 *
	 * @param menuCode 菜单编码
	 * @return
	 */
	List<String> queryMenuButton(String menuCode);

	/**
	 * 根据角色ID查询对应的菜单ID
	 *
	 * @param roleId 角色ID
	 * @return
	 */
	List<String> queryMenuIdByRoleId(Long roleId);

	/**
	 * 根据角色编码查询对应的菜单按钮
	 *
	 * @param roleCode 角色编码
	 * @return
	 */
	List<String> queryMenuButtonByRoleCode(String roleCode);

	/**
	 * 查询菜单包含的按钮
	 *
	 * @param menuCode 菜单编码
	 * @return
	 */
	List<String> queryCheckedMenuButton(String menuCode);

	/**
	 * 根据菜单编码查询对应的过滤数据字段
	 *
	 * @param paramMap 参数Map
	 * @return
	 */
	List<LinkedHashMap<String, Object>> queryDataFieldByMenuCode(Map<String, Object> paramMap);

	/**
	 * 查询是否已存在此菜单编码
	 *
	 * @param menuCode 菜单编码
	 * @return
	 */
	Integer getSysMenuByMenuCode(String menuCode);

	/**
	 * 查询是否已存在此菜单路由
	 *
	 * @param id       菜单ID
	 * @param menuPath 菜单路由
	 * @return
	 */
	Integer getSysMenuByIdMenuPath(Long id, String menuPath);

	/**
	 * 查询授权菜单的父节点ID
	 *
	 * @param id 菜单ID
	 * @return
	 */
	Set<Long> queryParentIdById(Long[] id);

	/**
	 * 新增菜单
	 *
	 * @param sysMenu 菜单对象
	 * @return
	 */
	int insertSysMenu(SysMenu sysMenu);

	/**
	 * 将对应的菜单授权给角色
	 *
	 * @param id     角色与菜单关联ID
	 * @param roleId 角色ID
	 * @param menuId 菜单ID
	 * @return
	 */
	int insertRoleIdMenuId(Long id, Long roleId, Long menuId);

	/**
	 * 将对应的菜单按钮授权给角色
	 *
	 * @param id         角色与菜单按钮关联ID
	 * @param roleCode   角色编码
	 * @param menuButton 菜单按钮
	 * @return
	 */
	int insertRoleCodeMenuButton(Long id, String roleCode, String menuButton);

	/**
	 * 将对应的过滤数据字段授权给角色
	 *
	 * @param id        角色与过滤数据关联ID
	 * @param roleCode  角色编码
	 * @param menuCode  菜单编码
	 * @param dataField 过滤数据
	 * @return
	 */
	int insertRoleCodeMenuData(Long id, String roleCode, String menuCode, String dataField);

	/**
	 * 新增菜单按钮
	 *
	 * @param id         菜单与按钮关联ID
	 * @param menuCode   菜单编码
	 * @param menuButton 按钮
	 * @return
	 */
	int insertMenuButton(Long id, String menuCode, String menuButton);

	/**
	 * 编辑菜单
	 *
	 * @param sysMenu 菜单对象
	 * @return
	 */
	int updateSysMenu(SysMenu sysMenu);

	/**
	 * 删除菜单
	 *
	 * @param id 菜单ID
	 * @return
	 */
	int deleteSysMenu(Long[] id);

	/**
	 * 根据角色ID删除角色与菜单关联信息
	 *
	 * @param roleId 角色ID
	 * @return
	 */
	int deleteRoleMenu(Long roleId);

	/**
	 * 根据角色编码删除角色与菜单按钮关联信息
	 *
	 * @param roleCode 角色编码
	 * @return
	 */
	int deleteRoleMenuButton(String roleCode);

	/**
	 * 根据角色编码、菜单编码删除角色与过滤数据关联信息
	 *
	 * @param roleCode 角色编码
	 * @param menuCode 菜单编码
	 * @return
	 */
	int deleteRoleMenuData(String roleCode, String menuCode);

	/**
	 * 根据菜单编码删除菜单与按钮关联信息
	 *
	 * @param menuCode 菜单编码
	 * @return
	 */
	int deleteButtonByMenuCode(String menuCode);

}
