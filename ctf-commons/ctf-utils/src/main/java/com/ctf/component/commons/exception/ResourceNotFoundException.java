package com.ctf.component.commons.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

import java.io.Serializable;

/**
 * 找不到资源的统一异常处理
 *
 *
 */
@ResponseStatus(HttpStatus.NOT_FOUND)
public class ResourceNotFoundException extends RuntimeException {

	private static final long serialVersionUID = -1087806513635138814L;

	private final String resourceName;
	private final Serializable id;

	public ResourceNotFoundException(String resourceName, Serializable id) {
		super(resourceName + " 找不到.");
		this.resourceName = resourceName;
		this.id = id;
	}

	public String getResourceName() {
		return resourceName;
	}

	public Serializable getId() {
		return id;
	}

}
