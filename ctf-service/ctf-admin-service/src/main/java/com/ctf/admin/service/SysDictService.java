package com.ctf.admin.service;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.ctf.admin.entity.SysDict;

/**
 * 字典信息的业务逻辑接口层
 *
 *
 */
public interface SysDictService {

	/**
	 * 查询字典的数据分页
	 *
	 * @param currentPage 当前页数
	 * @param pageSize    每页记录数
	 * @param dictType    字典类型
	 * @param dictName    字典名称
	 * @param dictValue   字典值
	 * @return
	 */
	Map<String, Object> querySysDict(Integer currentPage, Integer pageSize, String dictType, String dictName, String dictValue);

	/**
	 * 查询字典的树数据
	 *
	 * @return
	 */
	LinkedHashMap<String, Object> querySysDictTree();

	/**
	 * 查询字典的导出数据列表
	 *
	 * @param paramMap 参数Map
	 * @return
	 */
	List<LinkedHashMap<String, Object>> querySysDictForExcel(Map<String, Object> paramMap);

	/**
	 * 根据字典类型查询下拉框数据列表
	 *
	 * @param dictType 字典类型
	 * @return
	 */
	List<LinkedHashMap<String, Object>> queryDictByDictType(String dictType);

	/**
	 * 根据字典类型查询多选框数据列表
	 *
	 * @param dictType 字典类型
	 * @return
	 */
	List<LinkedHashMap<String, Object>> queryDictByDictTypeCheckbox(String dictType);

	/**
	 * 新增字典
	 *
	 * @param sysDict 字典对象
	 */
	void insertSysDict(SysDict sysDict);

	/**
	 * 编辑字典
	 *
	 * @param sysDict 字典对象
	 */
	void updateSysDict(SysDict sysDict);

	/**
	 * 删除字典
	 *
	 * @param id 字典ID
	 */
	void deleteSysDict(Long[] id);

}
