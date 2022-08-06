package com.ctf.auth.mapper;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.ctf.auth.entity.AppClient;

/**
 * 应用信息的数据持久接口层
 *
 *
 */
public interface AppClientMapper {

	/**
	 * 查询应用分页或导出数据
	 *
	 * @param paramMap 参数Map
	 * @return
	 */
	List<LinkedHashMap<String, Object>> queryAppClient(Map<String, Object> paramMap);

	/**
	 * 查询是否已存在此应用编码
	 *
	 * @param id         应用ID
	 * @param clientCode 应用编码
	 * @return
	 */
	Integer getAppClientByClientCode(Long id, String clientCode);

	/**
	 * 新增应用
	 *
	 * @param appClient 应用对象
	 * @return
	 */
	int insertAppClient(AppClient appClient);

	/**
	 * 编辑应用
	 *
	 * @param appClient 应用对象
	 * @return
	 */
	int updateAppClient(AppClient appClient);

	/**
	 * 删除应用
	 *
	 * @param id 应用ID
	 * @return
	 */
	int deleteAppClient(Long[] id);

}
