package com.ctf.account.mapper;

import java.util.LinkedHashMap;
import java.util.List;

import com.ctf.account.entity.SysUserDetail;

/**
 * 用户详细信息的数据持久接口层
 * 
 * 
 */
public interface SysUserDetailMapper {

	/**
	 * 查询是否已存在此用户名或邮箱或手机号
	 * 
	 * @param username 用户名
	 * @param email    邮箱
	 * @param mobile   手机号
	 * @return
	 */
	Integer getSysUserByIdentification(String username, String email, String mobile);

	/**
	 * 查询是否已存在此邮箱或手机号
	 * 
	 * @param id     用户ID
	 * @param email  邮箱
	 * @param mobile 手机号
	 * @return
	 */
	Integer getSysUserByIdEmailMobile(Long id, String email, String mobile);

	/**
	 * 查询原密码
	 * 
	 * @param id 用户ID
	 * @return
	 */
	String getPasswordById(Long id);

	/**
	 * 查询当前用户的角色
	 * 
	 * @param username 用户名
	 * @param mobile   手机号
	 * @return
	 */
	List<String> getRoleCodeBySysUser(String username, String mobile);

	/**
	 * 查询当前用户的授权菜单
	 * 
	 * @param username 用户名
	 * @param mobile   手机号
	 * @return
	 */
	List<LinkedHashMap<String, Object>> querySysMenuAuthorityTree(String username, String mobile);

	/**
	 * 查询当前用户的授权按钮隐藏项
	 * 
	 * @param username 用户名
	 * @param mobile   手机号
	 * @return
	 */
	List<String> queryRoleMenuButton(String username, String mobile);

	/**
	 * 新增用户
	 * 
	 * @param sysUserDetail 用户详细信息
	 * @return
	 */
	int insertSysUser(SysUserDetail sysUserDetail);

	/**
	 * 编辑用户详细信息
	 * 
	 * @param sysUserDetail 用户详细信息
	 * @return
	 */
	int updateSysUserDetail(SysUserDetail sysUserDetail);

	/**
	 * 根据字段编辑用户信息
	 * 
	 * @param fieldValue 修改的字段值
	 * @param field      修改的字段
	 * @param id         用户ID
	 * @return
	 */
	int updateSysUserInfo(String fieldValue, String field, Long id);

	/**
	 * 根据邮箱更新密码
	 * 
	 * @param newPassword 新密码
	 * @param email       邮箱
	 * @return
	 */
	int updatePasswordByEmail(String newPassword, String email);

}
