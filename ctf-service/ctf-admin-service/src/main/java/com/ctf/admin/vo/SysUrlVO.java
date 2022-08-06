package com.ctf.admin.vo;

import java.io.Serializable;

import com.ctf.component.commons.vo.CommonVO;

/**
 * 接口信息的参数类
 *
 *
 */
public class SysUrlVO extends CommonVO implements Serializable {

	private static final long serialVersionUID = -1887383111996273369L;
	String url;// URL

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

}
