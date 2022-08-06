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

import com.ctf.admin.entity.SysParam;
import com.ctf.admin.service.SysParamService;
import com.ctf.admin.vo.SysParamVO;
import com.ctf.component.commons.result.ActionResult;
import com.ctf.component.commons.result.ListResult;
import com.ctf.component.commons.result.ResultBuilder;
import com.ctf.component.commons.utils.ExcelUtils;
import com.ctf.component.commons.validator.InsertValidator;
import com.ctf.component.commons.validator.UpdateValidator;

/**
 * 参数信息的控制层
 *
 *
 */
@RestController
@RequestMapping("/sysparam")
public class SysParamController {

	private final Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	private SysParamService sysParamService;

	/**
	 * 查询参数分页
	 *
	 * @param sysParamVO 参数功能前端参数
	 * @return
	 */
	@GetMapping(path = "/querySysParam")
	public ListResult<Object> querySysParam(SysParamVO sysParamVO) {
		Map<String, Object> data = sysParamService.querySysParam(sysParamVO.getCurrentPage(), sysParamVO.getPageSize(), sysParamVO.getParamName(),
				sysParamVO.getParamKey(), sysParamVO.getParamValue(), sysParamVO.getSorter());
		return ResultBuilder.buildListSuccess(data);
	}

	/**
	 * 新增参数
	 *
	 * @param sysParam 参数对象
	 * @return
	 */
	@PostMapping(path = "/addSysParam")
	public ActionResult addSysParam(@Validated(InsertValidator.class) @RequestBody SysParam sysParam) {
		sysParamService.insertSysParam(sysParam);
		return ResultBuilder.buildActionSuccess();
	}

	/**
	 * 编辑参数
	 *
	 * @param sysParam 参数对象
	 * @return
	 */
	@PutMapping(path = "/updateSysParam")
	public ActionResult updateSysParam(@Validated(UpdateValidator.class) @RequestBody SysParam sysParam) {
		sysParamService.updateSysParam(sysParam);
		return ResultBuilder.buildActionSuccess();
	}

	/**
	 * 删除参数
	 *
	 * @param id 参数ID
	 * @return
	 */
	@PostMapping(path = "/deleteSysParam")
	public ActionResult deleteSysParam(@RequestParam(name = "id", required = true) Long[] id) {
		sysParamService.deleteSysParam(id);
		return ResultBuilder.buildActionSuccess();
	}

	/**
	 * 根据查询条件导出参数
	 *
	 * @param response 响应对象
	 * @param paramMap 参数Map
	 */
	@PostMapping(path = "/exportSysParam")
	public void exportSysParam(HttpServletResponse response, @RequestParam Map<String, Object> paramMap) {
		try {
			List<String> headList = Arrays.asList("ID", "参数名称", "参数键名", "参数键值", "创建时间");
			List<LinkedHashMap<String, Object>> dataList = sysParamService.querySysParamForExcel(paramMap);
			ExcelUtils.exportExcel(headList, dataList, "参数管理", response);
		} catch (Exception e) {
			logger.warn(e.toString());
		}
	}

}
