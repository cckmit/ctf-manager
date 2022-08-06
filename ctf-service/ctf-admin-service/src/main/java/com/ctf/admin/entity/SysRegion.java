package com.ctf.admin.entity;

import java.io.Serializable;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import com.ctf.component.commons.entity.TimeEntity;
import com.ctf.component.commons.validator.InsertValidator;
import com.ctf.component.commons.validator.NumericCharacters;
import com.ctf.component.commons.validator.UpdateValidator;
import com.google.common.base.MoreObjects;
import com.google.common.base.Objects;

/**
 * 区域信息的实体类
 *
 *
 */
public class SysRegion extends TimeEntity implements Serializable {

	private static final long serialVersionUID = 8700836479308592586L;
	@NotNull(groups = { UpdateValidator.class })
	private Long id;// ID
	@NotBlank(groups = { InsertValidator.class, UpdateValidator.class })
	@Size(max = 40, min = 2, groups = { InsertValidator.class, UpdateValidator.class })
	private String regionName;// 区域名称
	@NotBlank(groups = { InsertValidator.class, UpdateValidator.class })
	@NumericCharacters(groups = { InsertValidator.class, UpdateValidator.class })
	@Size(max = 20, min = 6, groups = { InsertValidator.class, UpdateValidator.class })
	private String regionCode;// 区域代码
	@NotBlank(groups = { InsertValidator.class, UpdateValidator.class })
	@Size(max = 32, min = 1, groups = { InsertValidator.class, UpdateValidator.class })
	private String regionType;// 区域类型
	@NotBlank(groups = { InsertValidator.class, UpdateValidator.class })
	@Size(max = 20, min = 1, groups = { InsertValidator.class, UpdateValidator.class })
	private String parentRegionCode;// 上级区域代码
	private String tenantCode;// 租户编码

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

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

	public String getParentRegionCode() {
		return parentRegionCode;
	}

	public void setParentRegionCode(String parentRegionCode) {
		this.parentRegionCode = parentRegionCode;
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
		SysRegion item = (SysRegion) o;
		return Objects.equal(id, item.id);
	}

	@Override
	public int hashCode() {
		return Objects.hashCode(id);
	}

	@Override
	public String toString() {
		return MoreObjects.toStringHelper(this).add("id", id).add("regionName", regionName).add("regionCode", regionCode).add("regionType", regionType)
				.add("parentRegionCode", parentRegionCode).add("tenantCode", tenantCode).add("createTime", super.getCreateTime()).toString();
	}

}
