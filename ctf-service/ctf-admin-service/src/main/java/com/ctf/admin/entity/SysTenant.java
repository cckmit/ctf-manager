package com.ctf.admin.entity;

import java.io.Serializable;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import com.ctf.component.commons.entity.TimeEntity;
import com.ctf.component.commons.validator.InsertValidator;
import com.ctf.component.commons.validator.UpdateValidator;
import com.google.common.base.MoreObjects;
import com.google.common.base.Objects;

/**
 * 租户信息的实体类
 *
 *
 */
public class SysTenant extends TimeEntity implements Serializable {

	private static final long serialVersionUID = 3763829790282234531L;
	@NotNull(groups = { UpdateValidator.class })
	private Long id;// ID
	@NotBlank(groups = { InsertValidator.class, UpdateValidator.class })
	@Size(max = 64, min = 1, groups = { InsertValidator.class, UpdateValidator.class })
	private String tenantCode;// 租户编码
	@NotBlank(groups = { InsertValidator.class, UpdateValidator.class })
	@Size(max = 64, min = 1, groups = { InsertValidator.class, UpdateValidator.class })
	private String tenantName;// 租户名称
	@Size(max = 64, groups = { InsertValidator.class, UpdateValidator.class })
	private String tenantContact;// 联系人
	@Email(groups = { InsertValidator.class, UpdateValidator.class })
	@Size(max = 100, groups = { InsertValidator.class, UpdateValidator.class })
	private String tenantEmail;// 联系邮箱
	@Size(max = 20, groups = { InsertValidator.class, UpdateValidator.class })
	private String tenantTel;// 联系电话

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

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

	public String getTenantEmail() {
		return tenantEmail;
	}

	public void setTenantEmail(String tenantEmail) {
		this.tenantEmail = tenantEmail;
	}

	public String getTenantTel() {
		return tenantTel;
	}

	public void setTenantTel(String tenantTel) {
		this.tenantTel = tenantTel;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || getClass() != o.getClass())
			return false;
		SysTenant item = (SysTenant) o;
		return Objects.equal(id, item.id);
	}

	@Override
	public int hashCode() {
		return Objects.hashCode(id);
	}

	@Override
	public String toString() {
		return MoreObjects.toStringHelper(this).add("id", id).add("tenantCode", tenantCode).add("tenantName", tenantName).add("tenantContact", tenantContact)
				.add("tenantEmail", tenantEmail).add("tenantTel", tenantTel).add("createTime", super.getCreateTime()).toString();
	}

}
