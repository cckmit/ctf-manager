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
 * 菜单信息的实体类
 *
 *
 */
public class SysMenu extends CommonEntity implements Serializable {

	private static final long serialVersionUID = 3142559115628496219L;
	@NotNull(groups = { UpdateValidator.class })
	private Long id;// ID
	@NotBlank(groups = { InsertValidator.class, UpdateValidator.class })
	@Size(max = 32, min = 1, groups = { InsertValidator.class, UpdateValidator.class })
	private String menuCode;// 菜单编码
	@NotBlank(groups = { InsertValidator.class, UpdateValidator.class })
	@Size(max = 32, min = 1, groups = { InsertValidator.class, UpdateValidator.class })
	private String menuName;// 菜单名称
	@Size(max = 32, groups = { InsertValidator.class, UpdateValidator.class })
	private String menuIcon;// 菜单图标
	@NotBlank(groups = { InsertValidator.class, UpdateValidator.class })
	@Size(max = 512, min = 1, groups = { InsertValidator.class, UpdateValidator.class })
	private String menuPath;// 菜单路由
	@Size(max = 256, groups = { InsertValidator.class, UpdateValidator.class })
	private String menuComponent;// 菜单组件
	private Long menuSequence;// 菜单排序
	@NotNull(groups = { InsertValidator.class, UpdateValidator.class })
	private Short menuStatus;// 菜单状态 0：隐藏 1：显示
	private String[] menuButton;// 菜单按钮
	private String tenantCode;// 租户编码

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getMenuCode() {
		return menuCode;
	}

	public void setMenuCode(String menuCode) {
		this.menuCode = menuCode;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public String getMenuIcon() {
		return menuIcon;
	}

	public void setMenuIcon(String menuIcon) {
		this.menuIcon = menuIcon;
	}

	public String getMenuPath() {
		return menuPath;
	}

	public void setMenuPath(String menuPath) {
		this.menuPath = menuPath;
	}

	public String getMenuComponent() {
		return menuComponent;
	}

	public void setMenuComponent(String menuComponent) {
		this.menuComponent = menuComponent;
	}

	public Long getMenuSequence() {
		return menuSequence;
	}

	public void setMenuSequence(Long menuSequence) {
		this.menuSequence = menuSequence;
	}

	public Short getMenuStatus() {
		return menuStatus;
	}

	public void setMenuStatus(Short menuStatus) {
		this.menuStatus = menuStatus;
	}

	public String[] getMenuButton() {
		return menuButton;
	}

	public void setMenuButton(String[] menuButton) {
		this.menuButton = menuButton;
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
		SysMenu item = (SysMenu) o;
		return Objects.equal(id, item.id);
	}

	@Override
	public int hashCode() {
		return Objects.hashCode(id);
	}

	@Override
	public String toString() {
		return MoreObjects.toStringHelper(this).add("id", id).add("menuCode", menuCode).add("menuName", menuName).add("menuIcon", menuIcon)
				.add("menuPath", menuPath).add("menuComponent", menuComponent).add("menuSequence", menuSequence).add("menuStatus", menuStatus)
				.add("menuButton", menuButton).add("tenantCode", tenantCode).add("parentId", super.getParentId()).add("createTime", super.getCreateTime())
				.toString();
	}

}
