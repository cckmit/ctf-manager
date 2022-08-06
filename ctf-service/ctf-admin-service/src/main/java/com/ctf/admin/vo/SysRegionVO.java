package com.ctf.admin.vo;

import java.io.Serializable;

import com.ctf.component.commons.vo.CommonVO;

/**
 * 区域信息的参数类
 *
 *
 */
public class SysRegionVO extends CommonVO implements Serializable {

	private static final long serialVersionUID = 7389723555724532049L;
	String regionName;// 区域名称
	String regionCode;// 区域代码
	String regionType;// 区域类型

	public String getRegionName() {
		return regionName;
	}

	public void setRegionName(String regionName) {
		this.regionName = regionName;
	}

	public String getRegionCode() {
		return regionCode;
	}

	public void setRegionCode(String regionCode) {
		this.regionCode = regionCode;
	}

	public String getRegionType() {
		return regionType;
	}

	public void setRegionType(String regionType) {
		this.regionType = regionType;
	}

}
