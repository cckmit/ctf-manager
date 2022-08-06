package com.ctf.auth.mapper;

import java.util.LinkedHashMap;
import java.util.List;

/**
 * 用户认证授权信息的数据持久接口层
 *
 *
 *
 */
public interface AuthMapper {

	/**
	 * 根据用户名查询当前用户信息
	 *
	 * @param username 用户名
	 * @return
	 */
	LinkedHashMap<String, Object> getSysUser(String username);

	/**
	 * 根据用户名查询用户详细信息
	 *
	 * @param username 用户名
	 * @return
	 */
	LinkedHashMap<String, String> getSysUserByUsername(String username);

	/**
	 * 根据手机号查询用户详细信息
	 *
	 * @param mobile 手机号
	 * @return
	 */
	LinkedHashMap<String, String> getSysUserByMobile(String mobile);

	/**
	 * 根据用户名查询角色编码
	 *
	 * @param username 用户名
	 * @return
	 */
	List<String> queryRoleCodeByUsername(String username);

	/**
	 * 根据手机号查询角色编码
	 *
	 * @param mobile 手机号
	 * @return
	 */
	List<String> queryRoleCodeByMobile(String mobile);

}
