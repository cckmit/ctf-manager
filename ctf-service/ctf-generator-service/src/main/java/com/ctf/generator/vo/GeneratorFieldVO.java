package com.ctf.generator.vo;

import java.io.Serializable;

import javax.validation.constraints.NotNull;

import com.ctf.component.commons.validator.UpdateValidator;
import com.ctf.component.commons.vo.CommonVO;

/**
 * 实体字段信息的参数类
 *
 *
 */
public class GeneratorFieldVO extends CommonVO implements Serializable {

	private static final long serialVersionUID = 4389750226468499369L;
	@NotNull(groups = { UpdateValidator.class })
	Long generatorId;// 代码信息ID
	String version;// 前端版本信息，例如react、vue

	public Long getGeneratorId() {
		return generatorId;
	}

	public void setGeneratorId(Long generatorId) {
		this.generatorId = generatorId;
	}

	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

}
