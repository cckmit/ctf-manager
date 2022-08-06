package com.ctf.component.commons.result;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;

import java.util.Collections;
import java.util.List;
import java.util.Map;

/**
 * 构建结果返回信息
 *
 *
 */
public class ResultBuilder {

	private static final Logger LOGGER = LoggerFactory.getLogger(ResultBuilder.class);
	private static final ListResult<Object> listResult = new ListResult<>();
	private static final ActionResult actionResult = new ActionResult();
	private static final String SUCCESS = "success";

	private ResultBuilder() {

	}

	public static ListResult<Object> buildListSuccess(String data) {
		try {
			listResult.setData(data);
			listResult.setStatus(HttpStatus.OK.value());
			listResult.setMessage(SUCCESS);
		} catch (Exception e) {
			ResultBuilder.buildListWarn(listResult, e);
		}
		return listResult;
	}

	public static ListResult<Object> buildListSuccess(Map<String, Object> data) {
		try {
			listResult.setData(data);
			listResult.setStatus(HttpStatus.OK.value());
			listResult.setMessage(SUCCESS);
		} catch (Exception e) {
			ResultBuilder.buildListWarn(listResult, e);
		}
		return listResult;
	}

	public static ListResult<Object> buildListSuccess(List<?> data) {
		try {
			listResult.setData(data);
			listResult.setStatus(HttpStatus.OK.value());
			listResult.setMessage(SUCCESS);
		} catch (Exception e) {
			ResultBuilder.buildListWarn(listResult, e);
		}
		return listResult;
	}

	public static void buildListWarn(ListResult<Object> result, Exception e) {
		result.setData(Collections.emptyMap());
		result.setStatus(HttpStatus.INTERNAL_SERVER_ERROR.value());
		result.setMessage(e.getMessage());
		if (LOGGER.isWarnEnabled()) {
			LOGGER.warn(e.toString());
		}
	}

	public static ActionResult buildActionSuccess() {
		try {
			actionResult.setStatus(HttpStatus.OK.value());
			actionResult.setMessage(SUCCESS);
		} catch (Exception e) {
			ResultBuilder.buildActionWarn(actionResult, e);
		}
		return actionResult;
	}

	public static void buildActionWarn(ActionResult result, Exception e) {
		result.setStatus(HttpStatus.INTERNAL_SERVER_ERROR.value());
		result.setMessage(e.getMessage());
		if (LOGGER.isWarnEnabled()) {
			LOGGER.warn(e.toString());
		}
	}

}
