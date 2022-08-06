package com.ctf.admin.vo;

import java.io.Serializable;

import com.ctf.component.commons.vo.CommonVO;

/**
 * 机构信息的参数类
 *
 *
 */
public class SysOrgVO extends CommonVO implements Serializable {

	private static final long serialVersionUID = 6537854989905372885L;
	String orgName;// 机构名称
	String orgType;// 机构类型
	String orgDescription;// 机构描述

	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	public String getOrgType() {
		return orgType;
	}

	public void setOrgType(String orgType) {
		this.orgType = orgType;
	}

	public String getOrgDescription() {
		return orgDescription;
	}

	public void setOrgDescription(String orgDescription) {
		this.orgDescription = orgDescription;
	}

}
