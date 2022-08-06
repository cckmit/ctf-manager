package com.ctf.generator.service;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.ctf.generator.entity.Generator;
import com.ctf.generator.vo.GeneratorFieldVO;

/**
 * 代码信息的业务逻辑接口层
 *
 *
 */
public interface GeneratorService {

	/**
	 * 查询代码信息分页
	 *
	 * @param currentPage 当前页数
	 * @param pageSize    每页记录数
	 * @param moduleName  模块名
	 * @param serviceName 服务名
	 * @param sorter      排序
	 * @return
	 */
	Map<String, Object> queryGenerator(Integer currentPage, Integer pageSize, String moduleName, String serviceName, String sorter);

	/**
	 * 查询代码信息的导出数据列表
	 *
	 * @param paramMap 参数Map
	 * @return
	 */
	List<LinkedHashMap<String, Object>> queryGeneratorForExcel(Map<String, Object> paramMap);

	/**
	 * 根据代码信息ID查询对应的实体字段
	 *
	 * @param generatorFieldVO 实体字段信息的参数
	 * @return
	 */
	Map<String, Object> queryFieldByGeneratorId(GeneratorFieldVO generatorFieldVO);

	/**
	 * 新增代码信息
	 *
	 * @param generator 代码信息对象
	 */
	void insertGenerator(Generator generator);

	/**
	 * 编辑代码信息
	 *
	 * @param generator 代码信息对象
	 */
	void updateGenerator(Generator generator);

	/**
	 * 删除代码信息
	 *
	 * @param id 代码信息ID
	 */
	void deleteGenerator(Long[] id);

	/**
	 * 生成代码资源
	 *
	 * @param id 代码信息ID
	 * @return
	 */
	byte[] generateResource(Long[] id);

}
