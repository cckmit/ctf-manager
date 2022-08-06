package com.ctf.admin.entity;

import java.io.Serializable;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import com.ctf.component.commons.entity.TimeEntity;
import com.ctf.component.commons.validator.InsertValidator;
import com.ctf.component.commons.validator.UpdateValidator;
import com.google.common.base.MoreObjects;
import com.google.common.base.Objects;

/**
 * 参数信息的实体类
 *
 *
 */
public class SysParam extends TimeEntity implements Serializable {

	private static final long serialVersionUID = 1614525988960046479L;
	@NotNull(groups = { UpdateValidator.class })
	private Long id;// ID
	@NotBlank(groups = { InsertValidator.class, UpdateValidator.class })
	@Size(max = 64, min = 1, groups = { InsertValidator.class, UpdateValidator.class })
	private String paramName;// 参数名称
	@NotBlank(groups = { InsertValidator.class, UpdateValidator.class })
	@Size(max = 256, min = 1, groups = { InsertValidator.class, UpdateValidator.class })
	private String paramKey;// 参数键名
	@Size(max = 2048, groups = { InsertValidator.class, UpdateValidator.class })
	private String paramValue;// 参数键值
	private String tenantCode;// 租户编码

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

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

	public String getTenantCode() {
		return tenantCode;
	}

	public void setTenantCode(String tenantCode) {
		this.tenantCode = tenantCode;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || getClass() != o.getClass())
			return false;
		SysParam item = (SysParam) o;
		return Objects.equal(id, item.id);
	}

	@Override
	public int hashCode() {
		return Objects.hashCode(id);
	}

	@Override
	public String toString() {
		return MoreObjects.toStringHelper(this).add("id", id).add("paramName", paramName).add("paramKey", paramKey).add("paramValue", paramValue)
				.add("tenantCode", tenantCode).add("createTime", super.getCreateTime()).toString();
	}

}
