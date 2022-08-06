package com.ctf.admin.controller;

import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ctf.admin.entity.SysMenu;
import com.ctf.admin.service.SysMenuService;
import com.ctf.admin.vo.SysMenuVO;
import com.ctf.component.commons.result.ActionResult;
import com.ctf.component.commons.result.ListResult;
import com.ctf.component.commons.result.ResultBuilder;
import com.ctf.component.commons.utils.ExcelUtils;
import com.ctf.component.commons.validator.InsertValidator;
import com.ctf.component.commons.validator.UpdateValidator;

/**
 * 菜单信息的控制层
 *
 *
 */
@RestController
@RequestMapping("/sysmenu")
public class SysMenuController {

	private final Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	private SysMenuService sysMenuService;

	/**
	 * 查询菜单分页
	 *
	 * @param sysMenuVO 菜单前端参数
	 * @return
	 */
	@GetMapping(path = "/querySysMenu")
	public ListResult<Object> querySysMenu(SysMenuVO sysMenuVO) {
		Map<String, Object> data = sysMenuService.querySysMenu(sysMenuVO.getCurrentPage(), sysMenuVO.getPageSize(), sysMenuVO.getMenuName(),
				sysMenuVO.getMenuPath());
		return ResultBuilder.buildListSuccess(data);
	}

	/**
	 * 查询菜单的树数据
	 *
	 * @return
	 */
	@GetMapping(path = "/querySysMenuTree")
	public ListResult<Object> querySysMenuTree() {
		List<LinkedHashMap<String, Object>> data = sysMenuService.querySysMenuTree();
		return ResultBuilder.buildListSuccess(data);
	}

	/**
	 * 查询菜单按钮的树数据
	 *
	 * @return
	 */
	@GetMapping(path = "/querySysMenuButtonTree")
	public ListResult<Object> querySysMenuButtonTree() {
		List<LinkedHashMap<String, Object>> data = sysMenuService.querySysMenuButtonTree();
		return ResultBuilder.buildListSuccess(data);
	}

	/**
	 * 根据角色ID查询对应的菜单ID
	 *
	 * @param roleId 角色ID
	 * @return
	 */
	@GetMapping(path = "/queryMenuIdByRoleId")
	public ListResult<Object> queryMenuIdByRoleId(@RequestParam(name = "roleId", required = true) Long roleId) {
		List<String> data = sysMenuService.queryMenuIdByRoleId(roleId);
		return ResultBuilder.buildListSuccess(data);
	}

	/**
	 * 根据角色编码查询对应的菜单按钮
	 *
	 * @param roleCode 角色编码
	 * @return
	 */
	@GetMapping(path = "/queryMenuButtonByRoleCode")
	public ListResult<Object> queryMenuButtonByRoleCode(@RequestParam(name = "roleCode", required = true) String roleCode) {
		List<String> data = sysMenuService.queryMenuButtonByRoleCode(roleCode);
		return ResultBuilder.buildListSuccess(data);
	}

	/**
	 * 根据菜单编码查询对应的过滤数据字段
	 *
	 * @param menuCode 菜单编码
	 * @return
	 */
	@GetMapping(path = "/queryDataFieldByMenuCode")
	public ListResult<Object> queryDataFieldByMenuCode(@RequestParam(name = "menuCode", required = true) String menuCode) {
		Map<String, Object> data = sysMenuService.queryDataFieldByMenuCode(menuCode);
		return ResultBuilder.buildListSuccess(data);
	}

	/**
	 * 查询菜单按钮的多选框数据
	 *
	 * @return
	 */
	@GetMapping(path = "/queryMenuButtonCheckbox")
	public ListResult<Object> queryMenuButtonCheckbox() {
		List<LinkedHashMap<String, Object>> data = sysMenuService.queryMenuButtonCheckbox();
		return ResultBuilder.buildListSuccess(data);
	}

	/**
	 * 查询菜单包含的按钮
	 *
	 * @param menuCode 菜单编码
	 * @return
	 */
	@GetMapping(path = "/queryCheckedMenuButton")
	public ListResult<Object> queryCheckedMenuButton(@RequestParam(name = "menuCode", required = true) String menuCode) {
		List<String> data = sysMenuService.queryCheckedMenuButton(menuCode);
		return ResultBuilder.buildListSuccess(data);
	}

	/**
	 * 新增菜单
	 *
	 * @param sysMenu 菜单对象
	 * @return
	 */
	@PostMapping(path = "/addSysMenu")
	public ActionResult addSysMenu(@Validated(InsertValidator.class) @RequestBody SysMenu sysMenu) {
		sysMenuService.insertSysMenu(sysMenu);
		return ResultBuilder.buildActionSuccess();
	}

	/**
	 * 将对应的菜单授权给角色
	 *
	 * @param roleId 角色ID
	 * @param menuId 菜单ID
	 * @return
	 */
	@PostMapping(path = "/authorizeMenuToRole")
	public ActionResult authorizeMenuToRole(@RequestParam(name = "roleId", required = true) Long roleId,
			@RequestParam(name = "menuId", required = true) Long[] menuId) {
		sysMenuService.insertRoleIdMenuId(roleId, menuId);
		return ResultBuilder.buildActionSuccess();
	}

	/**
	 * 将对应的菜单按钮授权给角色
	 *
	 * @param roleCode   角色编码
	 * @param menuButton 菜单按钮
	 * @return
	 */
	@PostMapping(path = "/authorizeMenuButtonToRole")
	public ActionResult authorizeMenuButtonToRole(@RequestParam(name = "roleCode", required = true) String roleCode,
			@RequestParam(name = "menuButton", required = false) String[] menuButton) {
		sysMenuService.insertRoleCodeMenuButton(roleCode, menuButton);
		return ResultBuilder.buildActionSuccess();
	}

	/**
	 * 将对应的过滤数据字段授权给角色
	 *
	 * @param roleCode  角色编码
	 * @param menuCode  菜单编码
	 * @param dataField 过滤数据字段
	 * @return
	 */
	@PostMapping(path = "/authorizeMenuDataToRole")
	public ActionResult authorizeMenuDataToRole(@RequestParam(name = "roleCode", required = true) String roleCode,
			@RequestParam(name = "menuCode", required = true) String menuCode, @RequestParam(name = "dataField", required = true) String dataField) {
		sysMenuService.insertRoleCodeMenuData(roleCode, menuCode, dataField);
		return ResultBuilder.buildActionSuccess();
	}

	/**
	 * 编辑菜单
	 *
	 * @param sysMenu 菜单对象
	 * @return
	 */
	@PutMapping(path = "/updateSysMenu")
	public ActionResult updateSysMenu(@Validated(UpdateValidator.class) @RequestBody SysMenu sysMenu) {
		sysMenuService.updateSysMenu(sysMenu);
		return ResultBuilder.buildActionSuccess();
	}

	/**
	 * 删除菜单
	 *
	 * @param id 菜单ID
	 * @return
	 */
	@PostMapping(path = "/deleteSysMenu")
	public ActionResult deleteSysMenu(@RequestParam(name = "id", required = true) Long[] id) {
		sysMenuService.deleteSysMenu(id);
		return ResultBuilder.buildActionSuccess();
	}

	/**
	 * 删除过滤数据字段
	 *
	 * @param roleCode 角色编码
	 * @param menuCode 菜单编码
	 * @return
	 */
	@PostMapping(path = "/deleteDataField")
	public ActionResult deleteDataField(@RequestParam(name = "roleCode", required = true) String roleCode,
			@RequestParam(name = "menuCode", required = true) String menuCode) {
		sysMenuService.deleteDataField(roleCode, menuCode);
		return ResultBuilder.buildActionSuccess();
	}

	/**
	 * 根据查询条件导出菜单
	 *
	 * @param response 响应对象
	 * @param paramMap 参数Map
	 */
	@PostMapping(path = "/exportSysMenu")
	public void exportSysMenu(HttpServletResponse response, @RequestParam Map<String, Object> paramMap) {
		try {
			List<String> headList = Arrays.asList("ID", "菜单编码", "菜单名称", "菜单图标", "菜单路由", "菜单组件", "排序", "菜单状态", "菜单状态名称", "上级菜单ID", "创建时间");
			List<LinkedHashMap<String, Object>> dataList = sysMenuService.querySysMenuForExcel(paramMap);
			ExcelUtils.exportExcel(headList, dataList, "菜单管理", response);
		} catch (Exception e) {
			logger.warn(e.toString());
		}
	}

}
