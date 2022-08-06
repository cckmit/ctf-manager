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

import com.ctf.admin.entity.SysTenant;
import com.ctf.admin.service.SysTenantService;
import com.ctf.admin.vo.SysTenantVO;
import com.ctf.component.commons.result.ActionResult;
import com.ctf.component.commons.result.ListResult;
import com.ctf.component.commons.result.ResultBuilder;
import com.ctf.component.commons.utils.ExcelUtils;
import com.ctf.component.commons.validator.InsertValidator;
import com.ctf.component.commons.validator.UpdateValidator;

/**
 * 租户信息的控制层
 *
 *
 */
@RestController
@RequestMapping("/systenant")
public class SysTenantController {

	private final Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	private SysTenantService sysTenantService;

	/**
	 * 查询租户分页
	 *
	 * @param sysTenantVO 租户前端参数
	 * @return
	 */
	@GetMapping(path = "/querySysTenant")
	public ListResult<Object> querySysTenant(SysTenantVO sysTenantVO) {
		Map<String, Object> data = sysTenantService.querySysTenant(sysTenantVO.getCurrentPage(), sysTenantVO.getPageSize(), sysTenantVO.getTenantCode(),
				sysTenantVO.getTenantName(), sysTenantVO.getTenantContact(), sysTenantVO.getSorter());
		return ResultBuilder.buildListSuccess(data);
	}

	/**
	 * 新增租户
	 *
	 * @param sysTenant 租户对象
	 * @return
	 */
	@PostMapping(path = "/addSysTenant")
	public ActionResult addSysTenant(@Validated(InsertValidator.class) @RequestBody SysTenant sysTenant) {
		sysTenantService.insertSysTenant(sysTenant);
		return ResultBuilder.buildActionSuccess();
	}

	/**
	 * 编辑租户
	 *
	 * @param sysTenant 租户对象
	 * @return
	 */
	@PutMapping(path = "/updateSysTenant")
	public ActionResult updateSysTenant(@Validated(UpdateValidator.class) @RequestBody SysTenant sysTenant) {
		sysTenantService.updateSysTenant(sysTenant);
		return ResultBuilder.buildActionSuccess();
	}

	/**
	 * 删除租户
	 *
	 * @param id 租户ID
	 * @return
	 */
	@PostMapping(path = "/deleteSysTenant")
	public ActionResult deleteSysTenant(@RequestParam(name = "id", required = true) Long[] id) {
		sysTenantService.deleteSysTenant(id);
		return ResultBuilder.buildActionSuccess();
	}

	/**
	 * 根据查询条件导出租户
	 *
	 * @param response 响应对象
	 * @param paramMap 参数Map
	 */
	@PostMapping(path = "/exportSysTenant")
	public void exportSysTenant(HttpServletResponse response, @RequestParam Map<String, Object> paramMap) {
		try {
			List<String> headList = Arrays.asList("ID", "租户编码", "租户名称", "联系人", "联系邮箱", "联系电话", "创建时间");
			List<LinkedHashMap<String, Object>> dataList = sysTenantService.querySysTenantForExcel(paramMap);
			ExcelUtils.exportExcel(headList, dataList, "租户管理", response);
		} catch (Exception e) {
			logger.warn(e.toString());
		}
	}

}
