package com.ctf.admin.mapper;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.ctf.admin.entity.SysUser;

/**
 * 用户信息的数据持久接口层
 *
 *
 */
public interface SysUserMapper {

	/**
	 * 查询用户分页或导出数据
	 *
	 * @param paramMap 参数Map
	 * @return
	 */
	List<LinkedHashMap<String, Object>> querySysUser(Map<String, Object> paramMap);

	/**
	 * 根据用户ID查询用户名的数据列表
	 *
	 * @param id 用户ID
	 * @return
	 */
	List<LinkedHashMap<String, Object>> queryUsername(Long[] id);

	/**
	 * 根据用户名查询用户ID的数据列表
	 *
	 * @param username 用户名
	 * @return
	 */
	List<Long> querySysUserId(String[] username);

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
	 * 根据机构ID查询用户ID
	 *
	 * @param orgId  机构ID
	 * @param roleId 角色ID
	 * @param assign 是否分配（0是未分配，1是已分配）
	 * @return
	 */
	List<Long> queryUserIdByOrgId(Long orgId, Long roleId, Short assign);

	/**
	 * 获取用户名和昵称
	 *
	 * @return
	 */
	List<LinkedHashMap<String, Object>> queryUsernameNickname();

	/**
	 * 新增用户
	 *
	 * @param sysUser 用户对象
	 * @return
	 */
	int insertSysUser(SysUser sysUser);

	/**
	 * 编辑用户
	 *
	 * @param sysUser 用户对象
	 * @return
	 */
	int updateSysUser(SysUser sysUser);

	/**
	 * 删除用户
	 *
	 * @param id 用户ID
	 * @return
	 */
	int deleteSysUser(Long[] id);

}
