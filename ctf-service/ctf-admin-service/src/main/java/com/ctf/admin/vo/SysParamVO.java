package com.ctf.admin.vo;

import java.io.Serializable;

import com.ctf.component.commons.vo.CommonVO;

/**
 * 参数信息的参数类
 *
 *
 */
public class SysParamVO extends CommonVO implements Serializable {

	private static final long serialVersionUID = 2678834023762000639L;
	String paramName;// 参数名称
	String paramKey;// 参数键名
	String paramValue;// 参数键值

	public String getParamName() {
		return paramName;
	}

	public void setParamName(String paramName) {
		this.paramName = paramName;
	}

	public String getParamKey() {
		return paramKey;
	}

	public void setParamKey(String paramKey) {
		this.paramKey = paramKey;
	}

	public String getParamValue() {
		return paramValue;
	}

	public void setParamValue(String paramValue) {
		this.paramValue = paramValue;
	}

}
