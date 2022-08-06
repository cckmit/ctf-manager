package com.ctf.admin.vo;

import java.io.Serializable;

import com.ctf.component.commons.vo.CommonVO;

/**
 * 字典信息的参数类
 *
 *
 */
public class SysDictVO extends CommonVO implements Serializable {

	private static final long serialVersionUID = 3956287435612937606L;

	String dictType;// 字典类型
	String dictName;// 字典名称
	String dictValue;// 字典值

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

}
