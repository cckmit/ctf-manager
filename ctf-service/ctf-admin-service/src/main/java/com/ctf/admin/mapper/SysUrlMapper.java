package com.ctf.admin.mapper;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.ctf.admin.entity.SysUrl;

/**
 * 接口信息的数据持久接口层
 * 
 * 
 */
public interface SysUrlMapper {

	/**
	 * 查询接口分页或导出数据
	 * 
	 * @param paramMap 参数Map
	 * @return
	 */
	List<LinkedHashMap<String, Object>> querySysUrl(Map<String, Object> paramMap);

	/**
	 * 查询是否已存在此接口
	 * 
	 * @param url URL
	 * @return
	 */
	Integer getSysUrlByUrl(String url);

	/**
	 * 新增接口
	 * 
	 * @param sysUrl 接口对象
	 * @return
	 */
	int insertSysUrl(SysUrl sysUrl);

	/**
	 * 编辑接口
	 * 
	 * @param sysUrl 接口对象
	 * @return
	 */
	int updateSysUrl(SysUrl sysUrl);

	/**
	 * 删除接口
	 * 
	 * @param id 接口ID
	 * @return
	 */
	int deleteSysUrl(Long[] id);

	/**
	 * 根据接口ID删除接口与角色关联信息
	 * 
	 * @param urlId 接口ID
	 * @return
	 */
	int deleteUrlRole(Long urlId);

	/**
	 * 将接口授权给角色
	 * 
	 * @param id     接口与角色关联ID
	 * @param urlId  接口ID
	 * @param roleId 角色ID
	 * @return
	 */
	void insertUrlIdRoleId(Long id, Long urlId, Long roleId);

	/**
	 * 根据接口ID查询对应的角色ID
	 * 
	 * @param urlId 接口ID
	 * @return
	 */
	List<String> queryRoleIdByUrlId(Long urlId);

	/**
	 * 查询角色编码对应的接口
	 * 
	 * @param roleCode 角色编码
	 * @return
	 */
	List<String> queryRoleUrl(String roleCode);

}
