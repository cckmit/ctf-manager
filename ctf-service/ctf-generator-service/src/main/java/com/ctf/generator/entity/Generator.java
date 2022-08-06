package com.ctf.generator.entity;

import java.io.Serializable;
import java.util.List;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import com.ctf.component.commons.entity.TimeEntity;
import com.ctf.component.commons.validator.InsertValidator;
import com.ctf.component.commons.validator.UpdateValidator;
import com.google.common.base.MoreObjects;
import com.google.common.base.Objects;

/**
 * 代码信息的实体类
 *
 *
 */
public class Generator extends TimeEntity implements Serializable {

	private static final long serialVersionUID = 924591675326135912L;
	@NotNull(groups = { UpdateValidator.class })
	private Long id;// ID
	@NotBlank(groups = { InsertValidator.class, UpdateValidator.class })
	@Size(max = 64, min = 1, groups = { InsertValidator.class, UpdateValidator.class })
	private String moduleName;// 模块名
	@NotBlank(groups = { InsertValidator.class, UpdateValidator.class })
	@Size(max = 64, min = 1, groups = { InsertValidator.class, UpdateValidator.class })
	private String serviceName;// 服务名
	@NotBlank(groups = { InsertValidator.class, UpdateValidator.class })
	@Size(max = 256, min = 1, groups = { InsertValidator.class, UpdateValidator.class })
	private String packageName;// 包名
	@NotBlank(groups = { InsertValidator.class, UpdateValidator.class })
	@Size(max = 64, min = 1, groups = { InsertValidator.class, UpdateValidator.class })
	private String entityName;// 实体名
	@NotBlank(groups = { InsertValidator.class, UpdateValidator.class })
	@Size(max = 64, min = 1, groups = { InsertValidator.class, UpdateValidator.class })
	private String tableName;// 表名
	@NotBlank(groups = { InsertValidator.class, UpdateValidator.class })
	@Size(max = 32, min = 1, groups = { InsertValidator.class, UpdateValidator.class })
	private String idName;// 主键名
	private String tenantCode;// 租户编码
	private List<GeneratorField> generatorField;// 实体字段

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getModuleName() {
		return moduleName;
	}

	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}

	public String getServiceName() {
		return serviceName;
	}

	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}

	public String getPackageName() {
		return packageName;
	}

	public void setPackageName(String packageName) {
		this.packageName = packageName;
	}

	public String getEntityName() {
		return entityName;
	}

	public void setEntityName(String entityName) {
		this.entityName = entityName;
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public String getIdName() {
		return idName;
	}

	public void setIdName(String idName) {
		this.idName = idName;
	}

	public String getTenantCode() {
		return tenantCode;
	}

	public void setTenantCode(String tenantCode) {
		this.tenantCode = tenantCode;
	}

	public List<GeneratorField> getGeneratorField() {
		return generatorField;
	}

	public void setGeneratorField(List<GeneratorField> generatorField) {
		this.generatorField = generatorField;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || getClass() != o.getClass())
			return false;
		Generator item = (Generator) o;
		return Objects.equal(id, item.id);
	}

	@Override
	public int hashCode() {
		return Objects.hashCode(id);
	}

	@Override
	public String toString() {
		return MoreObjects.toStringHelper(this).add("id", id).add("moduleName", moduleName).add("serviceName", serviceName).add("packageName", packageName)
				.add("entityName", entityName).add("tableName", tableName).add("idName", idName).add("tenantCode", tenantCode)
				.add("generatorField", generatorField).add("createTime", super.getCreateTime()).toString();
	}

}
