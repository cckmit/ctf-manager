package com.ctf.auth.service.impl;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ctf.admin.client.SysRoleServiceClient;
import com.ctf.auth.entity.AppClient;
import com.ctf.auth.mapper.AppClientMapper;
import com.ctf.auth.service.AppClientService;
import com.ctf.component.commons.result.PaginationBuilder;
import com.ctf.component.commons.utils.CollectionUtils;
import com.ctf.component.commons.utils.CurrentUserUtils;
import com.ctf.component.commons.utils.SequenceGenerator;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

/**
 * 应用信息的业务逻辑实现层
 *
 *
 */
@Service
@Transactional
public class AppClientServiceImpl implements AppClientService {

	private final Logger logger = LoggerFactory.getLogger(getClass());
	private static SequenceGenerator sequenceGenerator = new SequenceGenerator();

	@Autowired
	private AppClientMapper appClientMapper;
	@Autowired
	private SysRoleServiceClient sysRoleServiceClient;

	/**
	 * 查询应用分页
	 */
	@Override
	public Map<String, Object> queryAppClient(Integer currentPage, Integer pageSize, String clientCode, String authType, String sorter) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("clientCode", clientCode);
		paramMap.put("authType", authType);
		paramMap.put("tenantCode", CurrentUserUtils.getOAuth2AuthenticationInfo().get("tenantCode"));// 当前用户的租户编码
		if (StringUtils.isNotBlank(sorter)) {
			String sort = sorter.substring(0, sorter.lastIndexOf('_'));
			String sequence = "ascend".equals(sorter.substring(sorter.lastIndexOf('_') + 1)) ? "ASC" : "DESC";
			paramMap.put("sort", sort);
			paramMap.put("sequence", sequence);
		} else {
			paramMap.put("sort", "createTime");
			paramMap.put("sequence", "DESC");
		}
		Page<Object> page = PageHelper.startPage(currentPage, pageSize);
		List<LinkedHashMap<String, Object>> resultList = appClientMapper.queryAppClient(paramMap);

		String roleData = sysRoleServiceClient.queryRoleData("appclient", CurrentUserUtils.getOAuth2AuthenticationInfo().get("name"));
		String[] roleDataArray = roleData == null ? null : roleData.split(",");
		if (roleDataArray != null && roleDataArray.length > 0) {// 处理数据权限
			return PaginationBuilder.buildResult(CollectionUtils.convertFilterList(resultList, roleDataArray), page.getTotal(), currentPage, pageSize);
		} else {
			return PaginationBuilder.buildResult(resultList, page.getTotal(), currentPage, pageSize);
		}
	}

	/**
	 * 查询应用的导出数据列表
	 */
	@Override
	public List<LinkedHashMap<String, Object>> queryAppClientForExcel(Map<String, Object> paramMap) {
		return appClientMapper.queryAppClient(paramMap);
	}

	/**
	 * 新增应用
	 */
	@Override
	public void insertAppClient(AppClient appClient) {
		Integer existing = appClientMapper.getAppClientByClientCode(appClient.getId(), appClient.getClientCode().trim());
		if (existing != null && existing > 0) {
			throw new IllegalArgumentException("应用编码已存在");
		}
		appClient.setId(sequenceGenerator.nextId());
		appClient.setTenantCode(CurrentUserUtils.getOAuth2AuthenticationInfo().get("tenantCode"));// 当前用户的租户编码
		appClientMapper.insertAppClient(appClient);
		logger.info("应用已新增： {}", appClient.getClientCode());
	}

	/**
	 * 编辑应用
	 */
	@Override
	public void updateAppClient(AppClient appClient) {
		appClientMapper.updateAppClient(appClient);
		logger.info("应用已编辑： {}", appClient.getClientCode());
	}

	/**
	 * 删除应用
	 */
	@Override
	public void deleteAppClient(Long[] id) {
		appClientMapper.deleteAppClient(id);
	}

}
