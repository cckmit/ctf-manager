package com.ctf.base.client;

import org.springframework.stereotype.Component;

import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;

/**
 * 提供给其他微服务调用的用户微服务接口的熔断降级类
 * 
 * 
 */
@Component
public class SysUserServiceClientFallback implements SysUserServiceClient {

	/**
	 * 根据用户ID查询用户名的数据列表产生异常的熔断降级
	 */
	@Override
	public List<LinkedHashMap<String, Object>> queryUsernameBySysUserId(Long[] sysUserId) {
		return Collections.emptyList();
	}

	/**
	 * 根据用户名查询用户ID的数据列表产生异常的熔断降级
	 */
	@Override
	public List<Long> querySysUserIdByUsername(String[] username) {
		return Collections.emptyList();
	}

	/**
	 * 根据所属机构ID查询用户列表产生异常的熔断降级
	 */
	@Override
	public List<LinkedHashMap<String, Object>> querySysUserList(Long orgId) {
		return Collections.emptyList();
	}

}
