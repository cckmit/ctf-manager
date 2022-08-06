package com.ctf.base.client;

import org.springframework.stereotype.Component;

import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;

/**
 * 提供给其他微服务调用的字典微服务接口的熔断降级类
 *
 *
 */
@Component
public class SysDictServiceClientFallback implements SysDictServiceClient {

	/**
	 * 根据字典类型查询下拉框数据列表产生异常的熔断降级
	 *
	 */
	@Override
	public List<LinkedHashMap<String, Object>> queryDictByDictType(String dictType) {
		return Collections.emptyList();
	}

}
