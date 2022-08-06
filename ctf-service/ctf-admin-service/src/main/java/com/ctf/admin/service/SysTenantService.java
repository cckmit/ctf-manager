package com.ctf.admin.service;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.ctf.admin.entity.SysTenant;

/**
 * 租户信息的业务逻辑接口层
 *
 *
 */
public interface SysTenantService {

	/**
	 * 查询租户分页
	 *
	 * @param currentPage   当前页数
	 * @param pageSize      每页记录数
	 * @param tenantCode    租户编码
	 * @param tenantName    租户名称
	 * @param tenantContact 联系人
	 * @param sorter        排序
	 * @return
	 */
	Map<String, Object> querySysTenant(Integer currentPage, Integer pageSize, String tenantCode, String tenantName, String tenantContact, String sorter);

	/**
	 * 查询租户的导出数据列表
	 *
	 * @param paramMap 参数Map
	 * @return
	 */
	List<LinkedHashMap<String, Object>> querySysTenantForExcel(Map<String, Object> paramMap);

	/**
	 * 新增租户
	 *
	 * @param sysTenant 租户对象
	 */
	void insertSysTenant(SysTenant sysTenant);

	/**
	 * 编辑租户
	 *
	 * @param sysTenant 租户对象
	 */
	void updateSysTenant(SysTenant sysTenant);

	/**
	 * 删除租户
	 *
	 * @param id 租户ID
	 */
	void deleteSysTenant(Long[] id);

}
