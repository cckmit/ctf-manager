package com.ctf.admin.client;

import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.stereotype.Component;

/**
 * 提供给其他微服务调用的机构微服务接口的熔断降级类
 * 
 * 
 */
@Component
public class SysOrgServiceClientFallback implements SysOrgServiceClient {

	/**
	 * 根据机构类型查询机构列表产生异常的熔断降级
	 */
	@Override
	public List<LinkedHashMap<String, Object>> querySysOrgList(String orgType) {
		return Collections.emptyList();
	}

}
