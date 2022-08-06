package com.ctf.admin.vo;

import java.io.Serializable;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import com.ctf.component.commons.validator.InsertValidator;
import com.ctf.component.commons.vo.CommonVO;

/**
 * 用户信息的参数类
 *
 *
 */
public class SysUserVO extends CommonVO implements Serializable {

	private static final long serialVersionUID = -228357463766836975L;
	private String username;
	private String status;
	@NotEmpty(groups = { InsertValidator.class })
	private Long[] roleId;// 角色ID
	@NotNull(groups = { InsertValidator.class })
	private Long userId;// 用户ID

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Long[] getRoleId() {
		return roleId;
	}

	public void setRoleId(Long[] roleId) {
		this.roleId = roleId;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

}
