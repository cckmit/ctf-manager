package com.ctf.admin.mapper;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.ctf.admin.entity.SysRegion;

/**
 * 区域信息的数据持久接口层
 * 
 * 
 */
public interface SysRegionMapper {

	/**
	 * 查询区域分页或导出数据
	 * 
	 * @param paramMap 参数Map
	 * @return
	 */
	List<LinkedHashMap<String, Object>> querySysRegion(Map<String, Object> paramMap);

	/**
	 * 查询区域的树数据列表
	 * 
	 * @param tenantCode 租户编码
	 * @return
	 */
	List<LinkedHashMap<String, Object>> querySysRegionTree(String tenantCode);

	/**
	 * 查询全部省份数据
	 * 
	 * @return
	 */
	List<LinkedHashMap<String, Object>> queryProvince();

	/**
	 * 根据省份代码查询对应地市数据
	 * 
	 * @param province 省份代码
	 * @return
	 */
	List<LinkedHashMap<String, Object>> queryCity(String province);

	/**
	 * 查询是否已存在此区域代码
	 * 
	 * @param regionCode 区域代码
	 * @return
	 */
	Integer getSysRegionByRegionCode(String regionCode);

	/**
	 * 新增区域
	 * 
	 * @param sysRegion 区域对象
	 * @return
	 */
	int insertSysRegion(SysRegion sysRegion);

	/**
	 * 编辑区域
	 * 
	 * @param sysRegion 区域对象
	 * @return
	 */
	int updateSysRegion(SysRegion sysRegion);

	/**
	 * 删除区域
	 * 
	 * @param regionCode 区域代码
	 * @return
	 */
	int deleteSysRegion(String[] regionCode);

}
