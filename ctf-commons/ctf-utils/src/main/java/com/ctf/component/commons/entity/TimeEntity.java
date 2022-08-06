package com.ctf.component.commons.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 实体类共用时间字段
 *
 *
 */
public class TimeEntity implements Serializable {

	private static final long serialVersionUID = 4522947470855561430L;
	private Date createTime; // 创建时间

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

}
