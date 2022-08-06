package com.ctf.generator.controller;

import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ctf.component.commons.result.ActionResult;
import com.ctf.component.commons.result.ListResult;
import com.ctf.component.commons.result.ResultBuilder;
import com.ctf.component.commons.utils.ExcelUtils;
import com.ctf.component.commons.validator.InsertValidator;
import com.ctf.component.commons.validator.UpdateValidator;
import com.ctf.generator.entity.Generator;
import com.ctf.generator.service.GeneratorService;
import com.ctf.generator.vo.GeneratorFieldVO;
import com.ctf.generator.vo.GeneratorVO;

/**
 * 代码信息的控制层
 *
 *
 */
@RestController
@RequestMapping("/generator")
public class GeneratorController {

	private final Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	private GeneratorService generatorService;

	/**
	 * 查询代码信息分页
	 *
	 * @param generatorVO 代码前端参数
	 * @return
	 */
	@GetMapping(path = "/queryGenerator")
	public ListResult<Object> queryGenerator(GeneratorVO generatorVO) {
		Map<String, Object> data = generatorService.queryGenerator(generatorVO.getCurrentPage(), generatorVO.getPageSize(), generatorVO.getModuleName(),
				generatorVO.getServiceName(), generatorVO.getSorter());
		return ResultBuilder.buildListSuccess(data);
	}

	/**
	 * 根据代码信息ID查询对应的实体字段
	 *
	 * @param generatorFieldVO 代码信息ID
	 * @return
	 */
	@GetMapping(path = "/queryFieldByGeneratorId")
	public ListResult<Object> queryFieldByGeneratorId(@Validated(UpdateValidator.class) GeneratorFieldVO generatorFieldVO) {
		Map<String, Object> data = generatorService.queryFieldByGeneratorId(generatorFieldVO);
		return ResultBuilder.buildListSuccess(data);
	}

	/**
	 * 新增代码信息
	 *
	 * @param generator 代码信息对象
	 * @return
	 */
	@PostMapping(path = "/addGenerator")
	public ActionResult addGenerator(@Validated(InsertValidator.class) @RequestBody Generator generator) {
		generatorService.insertGenerator(generator);
		return ResultBuilder.buildActionSuccess();
	}

	/**
	 * 编辑代码信息
	 *
	 * @param generator 代码信息对象
	 * @return
	 */
	@PutMapping(path = "/updateGenerator")
	public ActionResult updateGenerator(@Validated(UpdateValidator.class) @RequestBody Generator generator) {
		generatorService.updateGenerator(generator);
		return ResultBuilder.buildActionSuccess();
	}

	/**
	 * 删除代码信息
	 *
	 * @param id 代码信息ID
	 * @return
	 */
	@PostMapping(path = "/deleteGenerator")
	public ActionResult deleteGenerator(@RequestParam(name = "id", required = true) Long[] id) {
		generatorService.deleteGenerator(id);
		return ResultBuilder.buildActionSuccess();
	}

	/**
	 * 根据查询条件导出代码信息
	 *
	 * @param response 响应对象
	 * @param paramMap 参数Map
	 */
	@PostMapping(path = "/exportGenerator")
	public void exportGenerator(HttpServletResponse response, @RequestParam Map<String, Object> paramMap) {
		try {
			List<String> headList = Arrays.asList("ID", "模块名", "服务名", "包名", "实体名", "表名", "主键名", "创建时间");
			List<LinkedHashMap<String, Object>> dataList = generatorService.queryGeneratorForExcel(paramMap);
			ExcelUtils.exportExcel(headList, dataList, "代码信息管理", response);
		} catch (Exception e) {
			logger.warn(e.toString());
		}
	}

	/**
	 * 生成代码资源
	 *
	 * @param id 代码信息ID
	 */
	@PostMapping(value = "/generateResource")
	public ResponseEntity<byte[]> generateResource(@RequestParam(name = "id", required = true) Long[] id) {
		ResponseEntity<byte[]> responseEntity = null;
		try {
			byte[] byteArray = generatorService.generateResource(id);
			HttpHeaders responseHeaders = new HttpHeaders();
			responseEntity = new ResponseEntity<>(byteArray, responseHeaders, HttpStatus.OK);
		} catch (Exception e) {
			logger.warn(e.toString());
		}
		return responseEntity;
	}

}
