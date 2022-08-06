package com.ctf.component.commons.exception;

import com.ctf.component.commons.result.ResultBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

/**
 * 全局异常处理
 *
 *
 */
@ControllerAdvice
public class GlobalExceptionHandler {

	private static final Logger LOGGER = LoggerFactory.getLogger(ResultBuilder.class);

	/**
	 * 处理所有异常信息
	 * @param e 所有异常对象
	 * @return
	 */
	@ExceptionHandler(Exception.class)
	@ResponseBody
	public Map<String, Object> handleException(Exception e) {
		Map<String, Object> map = new HashMap<>();
		map.put("status", HttpStatus.INTERNAL_SERVER_ERROR.value());
		map.put("data", Collections.emptyMap());
		map.put("message", e.getMessage());
		if (LOGGER.isWarnEnabled()) {
			LOGGER.warn(e.toString());
		}
		return map;
	}

}
