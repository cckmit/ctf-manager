package com.ctf.generator.vo;

import java.io.Serializable;

import com.ctf.component.commons.vo.CommonVO;

/**
 * 代码信息的参数类
 *
 *
 */
public class GeneratorVO extends CommonVO implements Serializable {

	private static final long serialVersionUID = 2994063747786522503L;
	String moduleName; // 模块名
	String serviceName;// 服务名

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

}
