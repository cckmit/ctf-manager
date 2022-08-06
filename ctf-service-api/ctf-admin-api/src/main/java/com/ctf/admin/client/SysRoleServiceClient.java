package com.ctf.admin.client;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * 提供给其他微服务调用的角色微服务接口层
 *
 *
 */
@FeignClient(name = "ctf-admin-service", path = "/admin/sysrole", fallback = SysRoleServiceClientFallback.class)
public interface SysRoleServiceClient {

	/**
	 * 查询当前用户的过滤数据字段
	 *
	 * @param menuCode 菜单编码
	 * @param username 用户名
	 * @return
	 */
	@GetMapping(value = "/queryRoleData")
	String queryRoleData(@RequestParam(name = "menuCode", required = true) String menuCode, @RequestParam(name = "username", required = true) String username);

}
