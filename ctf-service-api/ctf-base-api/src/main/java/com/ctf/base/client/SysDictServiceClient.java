package com.ctf.base.client;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.LinkedHashMap;
import java.util.List;

/**
 * 提供给其他微服务调用的字典微服务接口层
 *
 *
 */
@FeignClient(name = "ctf-admin-service", path = "/admin/sysdict", fallback = SysDictServiceClientFallback.class)
public interface SysDictServiceClient {

	/**
	 * 根据字典类型查询下拉框数据列表
	 *
	 * @param dictType 字典类型
	 * @return
	 */
	@GetMapping(value = "/queryDictByDictType")
	List<LinkedHashMap<String, Object>> queryDictByDictType(@RequestParam(name = "dictType", required = true) String dictType);

}
