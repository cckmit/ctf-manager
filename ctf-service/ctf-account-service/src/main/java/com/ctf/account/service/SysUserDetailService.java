package com.ctf.account.service;

import java.util.LinkedHashMap;
import java.util.List;

import com.ctf.account.entity.SysUserDetail;

/**
 * 用户详细信息的业务逻辑接口层
 *
 *
 */
public interface SysUserDetailService {

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
	 *
	 * @return
	 */
	List<String> queryRoleMenuButton(String username, String mobile);

	/**
	 * 新增用户
	 *
	 * @param sysUser 用户对象
	 */
	void insertSysUser(SysUserDetail sysUser);

	/**
	 * 编辑用户详细信息
	 *
	 * @param sysUser 用户对象
	 */
	void updateSysUserDetail(SysUserDetail sysUser);

	/**
	 * 根据字段编辑用户信息
	 *
	 * @param fieldValue 修改的字段值
	 * @param field      修改的字段
	 * @param id         用户ID
	 */
	void updateSysUserInfo(String fieldValue, String field, Long id);

	/**
	 * 修改用户密码
	 *
	 * @param password    原密码
	 * @param newPassword 新密码
	 * @param id          用户ID
	 */
	void updatePassword(String password, String newPassword, Long id);

	/**
	 * 找回密码
	 *
	 * @param email       邮箱
	 * @param charCaptcha 验证码字符
	 */
	void retrievePassword(String email, String charCaptcha);

	/**
	 * 比对验证码
	 *
	 * @param charCaptcha 验证码字符
	 */
	void compareCaptcha(String charCaptcha);

}
