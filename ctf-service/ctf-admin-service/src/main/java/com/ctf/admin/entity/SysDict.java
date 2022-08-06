package com.ctf.admin.entity;

import java.io.Serializable;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import com.ctf.component.commons.entity.CommonEntity;
import com.ctf.component.commons.validator.InsertValidator;
import com.ctf.component.commons.validator.UpdateValidator;
import com.google.common.base.MoreObjects;
import com.google.common.base.Objects;

/**
 * 字典信息的实体类
 *
 *
 */
public class SysDict extends CommonEntity implements Serializable {

	private static final long serialVersionUID = 6477726497523835274L;
	@NotNull(groups = { UpdateValidator.class })
	private Long id;// ID
	@NotBlank(groups = { InsertValidator.class, UpdateValidator.class })
	@Size(max = 32, min = 1, groups = { InsertValidator.class, UpdateValidator.class })
	private String dictType;// 字典类型
	@NotBlank(groups = { InsertValidator.class, UpdateValidator.class })
	@Size(max = 32, min = 1, groups = { InsertValidator.class, UpdateValidator.class })
	private String dictName;// 字典名称
	@NotBlank(groups = { InsertValidator.class, UpdateValidator.class })
	@Size(max = 32, min = 1, groups = { InsertValidator.class, UpdateValidator.class })
	private String dictValue;// 字典值
	private Long dictSequence;// 排序
	private String tenantCode;// 租户编码

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getDictType() {
		return dictType;
	}

	public void setDictType(String dictType) {
		this.dictType = dictType;
	}

	public String getDictName() {
		return dictName;
	}

	public void setDictName(String dictName) {
		this.dictName = dictName;
	}

	public String getDictValue() {
		return dictValue;
	}

	public void setDictValue(String dictValue) {
		this.dictValue = dictValue;
	}

	public Long getDictSequence() {
		return dictSequence;
	}

	public void setDictSequence(Long dictSequence) {
		this.dictSequence = dictSequence;
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
		SysDict item = (SysDict) o;
		return Objects.equal(id, item.id);
	}

	@Override
	public int hashCode() {
		return Objects.hashCode(id);
	}

	@Override
	public String toString() {
		return MoreObjects.toStringHelper(this).add("id", id).add("dictType", dictType).add("dictName", dictName).add("dictValue", dictValue)
				.add("dictSequence", dictSequence).add("tenantCode", tenantCode).add("parentId", super.getParentId()).add("createTime", super.getCreateTime())
				.toString();
	}

}
