package com.ctf.auth.service;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.ctf.auth.entity.AppClient;

/**
 * 应用信息的业务逻辑接口层
 *
 *
 */
public interface AppClientService {

	/**
	 * 查询应用分页
	 *
	 * @param currentPage 当前页数
	 * @param pageSize    每页记录数
	 * @param clientCode  应用编码
	 * @param authType    授权类型
	 * @param sorter      排序
	 * @return
	 */
	Map<String, Object> queryAppClient(Integer currentPage, Integer pageSize, String clientCode, String authType, String sorter);

	/**
	 * 查询应用的导出数据列表
	 *
	 * @param paramMap 参数Map
	 * @return
	 */
	List<LinkedHashMap<String, Object>> queryAppClientForExcel(Map<String, Object> paramMap);

	/**
	 * 新增应用
	 *
	 * @param appClient 应用对象
	 */
	void insertAppClient(AppClient appClient);

	/**
	 * 编辑应用
	 *
	 * @param appClient 应用对象
	 */
	void updateAppClient(AppClient appClient);

	/**
	 * 删除应用
	 *
	 * @param id 应用ID
	 */
	void deleteAppClient(Long[] id);

}
