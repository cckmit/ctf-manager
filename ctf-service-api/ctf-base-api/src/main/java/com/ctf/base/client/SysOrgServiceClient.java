package com.ctf.base.client;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.LinkedHashMap;
import java.util.List;

/**
 * 提供给其他微服务调用的机构微服务接口层
 *
 *
 */
@FeignClient(name = "ctf-admin-service", path = "/admin/sysorg", fallback = SysOrgServiceClientFallback.class)
public interface SysOrgServiceClient {

	/**
	 * 根据机构类型查询机构列表
	 *
	 * @param orgType 机构类型
	 * @return
	 */
	@PostMapping(value = "/querySysOrgList")
	List<LinkedHashMap<String, Object>> querySysOrgList(@RequestParam(name = "orgType", required = true) String orgType);

}
