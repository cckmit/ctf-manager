package com.ctf.base.client;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.LinkedHashMap;
import java.util.List;

/**
 * 提供给其他微服务调用的用户微服务接口层
 *
 *
 */
@FeignClient(name = "ctf-admin-service", path = "/admin/sysuser", fallback = SysUserServiceClientFallback.class)
public interface SysUserServiceClient {

	/**
	 * 根据用户ID查询用户名的数据列表
	 *
	 * @param sysUserId 用户ID
	 * @return
	 */
	@GetMapping(value = "/queryUsernameBySysUserId")
	List<LinkedHashMap<String, Object>> queryUsernameBySysUserId(@RequestParam(name = "sysUserId", required = false) Long[] sysUserId);

	/**
	 * 根据用户名查询用户ID的数据列表
	 *
	 * @param username 用户名
	 * @return
	 */
	@GetMapping(value = "/querySysUserIdByUsername")
	List<Long> querySysUserIdByUsername(@RequestParam(name = "username", required = false) String[] username);

	/**
	 * 根据所属机构ID查询用户列表
	 *
	 * @param orgId 所属机构ID
	 * @return
	 */
	@PostMapping(value = "/querySysUserList")
	List<LinkedHashMap<String, Object>> querySysUserList(@RequestParam(name = "orgId", required = true) Long orgId);

}
