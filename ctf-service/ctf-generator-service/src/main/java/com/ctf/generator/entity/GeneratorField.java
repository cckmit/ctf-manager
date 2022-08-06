package com.ctf.generator.entity;

import java.io.Serializable;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import com.ctf.component.commons.validator.InsertValidator;
import com.ctf.component.commons.validator.UpdateValidator;
import com.google.common.base.MoreObjects;
import com.google.common.base.Objects;

/**
 * 实体字段信息的实体类
 *
 *
 */
public class GeneratorField implements Serializable {

	private static final long serialVersionUID = 1221169604345162963L;
	@NotNull(groups = { UpdateValidator.class })
	private Long id;// ID
	@NotBlank(groups = { InsertValidator.class, UpdateValidator.class })
	@Size(max = 32, min = 1, groups = { InsertValidator.class, UpdateValidator.class })
	private String fieldType;// 类型
	@NotBlank(groups = { InsertValidator.class, UpdateValidator.class })
	@Size(max = 64, min = 1, groups = { InsertValidator.class, UpdateValidator.class })
	private String field;// 实体字段

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFieldType() {
		return fieldType;
	}

	public void setFieldType(String fieldType) {
		this.fieldType = fieldType;
	}

	public String getField() {
		return field;
	}

	public void setField(String field) {
		this.field = field;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || getClass() != o.getClass())
			return false;
		GeneratorField item = (GeneratorField) o;
		return Objects.equal(id, item.id);
	}

	@Override
	public int hashCode() {
		return Objects.hashCode(id);
	}

	@Override
	public String toString() {
		return MoreObjects.toStringHelper(this).add("id", id).add("fieldType", fieldType).add("field", field).toString();
	}

}
