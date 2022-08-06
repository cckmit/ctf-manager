package com.ctf.admin.client;

import org.springframework.stereotype.Component;

/**
 * 提供给其他微服务调用的角色微服务接口的熔断降级类
 *
 *
 */
@Component
public class SysRoleServiceClientFallback implements SysRoleServiceClient {

	/**
	 * 查询当前用户的过滤数据字段
	 */
	@Override
	public String queryRoleData(String menuCode, String username) {
		return null;
	}

}
