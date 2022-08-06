package com.ctf.auth.vo;

import java.io.Serializable;

import com.ctf.component.commons.vo.CommonVO;

/**
 * 应用信息的参数类
 *
 *
 */
public class AppClientVO extends CommonVO implements Serializable {

	private static final long serialVersionUID = -7365233858896287067L;
	String clientCode;// 应用编码
	String authType;// 授权类型

	public String getClientCode() {
		return clientCode;
	}

	public void setClientCode(String clientCode) {
		this.clientCode = clientCode;
	}

	public String getAuthType() {
		return authType;
	}

	public void setAuthType(String authType) {
		this.authType = authType;
	}

}
