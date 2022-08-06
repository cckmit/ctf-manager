package com.ctf.admin.mapper;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.ctf.admin.entity.SysParam;

/**
 * 参数信息的数据持久接口层
 *
 *
 */
public interface SysParamMapper {

	/**
	 * 查询参数分页或导出数据
	 *
	 * @param paramMap 参数Map
	 * @return
	 */
	List<LinkedHashMap<String, Object>> querySysParam(Map<String, Object> paramMap);

	/**
	 * 查询是否已存在此参数名称
	 *
	 * @param paramName 参数名称
	 * @return
	 */
	Integer getSysParamByParamName(String paramName);

	/**
	 * 新增参数
	 *
	 * @param sysParam 参数对象
	 * @return
	 */
	int insertSysParam(SysParam sysParam);

	/**
	 * 编辑参数
	 *
	 * @param sysParam 参数对象
	 * @return
	 */
	int updateSysParam(SysParam sysParam);

	/**
	 * 删除参数
	 *
	 * @param id 参数ID
	 * @return
	 */
	int deleteSysParam(Long[] id);

}
