package com.ctf.component.commons.result;

import java.io.Serializable;

/**
 * HTTP的返回响应类
 *
 *
 */
public class ActionResult implements Serializable {

	private static final long serialVersionUID = -8041820346732720877L;
	private int status;// 状态编码
	private String message;// 消息

	public ActionResult() {
		super();
	}

	public ActionResult(int status, String message) {
		super();
		this.status = status;
		this.message = message;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

}
