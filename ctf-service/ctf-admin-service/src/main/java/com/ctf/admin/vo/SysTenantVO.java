package com.ctf.admin.vo;

import java.io.Serializable;

import com.ctf.component.commons.vo.CommonVO;

/**
 * 租户信息的参数类
 *
 *
 */
public class SysTenantVO extends CommonVO implements Serializable {

	private static final long serialVersionUID = 5949020473992423638L;
	String tenantCode; // 租户编码
	String tenantName;// 租户名称
	String tenantContact;// 联系人

	public String getTenantCode() {
		return tenantCode;
	}

	public void setTenantCode(String tenantCode) {
		this.tenantCode = tenantCode;
	}

	public String getTenantName() {
		return tenantName;
	}

	public void setTenantName(String tenantName) {
		this.tenantName = tenantName;
	}

	public String getTenantContact() {
		return tenantContact;
	}

	public void setTenantContact(String tenantContact) {
		this.tenantContact = tenantContact;
	}

}
