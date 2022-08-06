package com.ctf.admin.vo;

import java.io.Serializable;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import com.ctf.component.commons.validator.InsertValidator;
import com.ctf.component.commons.vo.CommonVO;

/**
 * 角色信息的参数类
 *
 *
 */
public class SysRoleVO extends CommonVO implements Serializable {

	private static final long serialVersionUID = 4928960051913469176L;
	private String roleName;// 角色名称
	@NotNull(groups = { InsertValidator.class })
	private Long roleId;// 角色ID
	@NotEmpty(groups = { InsertValidator.class })
	private Long[][] userId;// 用户ID

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public Long getRoleId() {
		return roleId;
	}

	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}

	public Long[][] getUserId() {
		return userId;
	}

	public void setUserId(Long[][] userId) {
		this.userId = userId;
	}

}
