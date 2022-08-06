package com.ctf.admin.vo;

import java.io.Serializable;

import com.ctf.component.commons.vo.CommonVO;

/**
 * 菜单信息的参数类
 *
 *
 */
public class SysMenuVO extends CommonVO implements Serializable {

	private static final long serialVersionUID = 8283244799001002954L;
	String menuName;// 菜单名称
	String menuPath;// 菜单路由

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public String getMenuPath() {
		return menuPath;
	}

	public void setMenuPath(String menuPath) {
		this.menuPath = menuPath;
	}

}
