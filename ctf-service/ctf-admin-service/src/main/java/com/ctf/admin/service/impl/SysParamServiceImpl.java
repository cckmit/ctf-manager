package com.ctf.admin.service.impl;

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

import com.ctf.admin.entity.SysParam;
import com.ctf.admin.mapper.SysParamMapper;
import com.ctf.admin.mapper.SysRoleMapper;
import com.ctf.admin.service.SysParamService;
import com.ctf.component.commons.result.PaginationBuilder;
import com.ctf.component.commons.utils.CollectionUtils;
import com.ctf.component.commons.utils.CurrentUserUtils;
import com.ctf.component.commons.utils.SequenceGenerator;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

/**
 * 参数信息的业务逻辑实现层
 *
 *
 */
@Service
@Transactional
public class SysParamServiceImpl implements SysParamService {

	private final Logger logger = LoggerFactory.getLogger(getClass());
	private static SequenceGenerator sequenceGenerator = new SequenceGenerator();

	@Autowired
	private SysParamMapper sysParamMapper;
	@Autowired
	private SysRoleMapper sysRoleMapper;

	/**
	 * 查询参数分页
	 */
	@Override
	public Map<String, Object> querySysParam(Integer currentPage, Integer pageSize, String paramName, String paramKey, String paramValue, String sorter) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("paramName", paramName);
		paramMap.put("paramKey", paramKey);
		paramMap.put("paramValue", paramValue);
		paramMap.put("tenantCode", CurrentUserUtils.getOAuth2AuthenticationDetailsInfo().get("tenantCode"));// 当前用户的租户编码
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
		List<LinkedHashMap<String, Object>> resultList = sysParamMapper.querySysParam(paramMap);

		String roleData = sysRoleMapper.queryRoleData("sysparam", CurrentUserUtils.getOAuth2AuthenticationDetailsInfo().get("name"));
		String[] roleDataArray = roleData == null ? null : roleData.split(",");
		if (roleDataArray != null && roleDataArray.length > 0) {// 处理数据权限
			return PaginationBuilder.buildResult(CollectionUtils.convertFilterList(resultList, roleDataArray), page.getTotal(), currentPage, pageSize);
		} else {
			return PaginationBuilder.buildResult(resultList, page.getTotal(), currentPage, pageSize);
		}
	}

	/**
	 * 查询参数的导出数据列表
	 */
	@Override
	public List<LinkedHashMap<String, Object>> querySysParamForExcel(Map<String, Object> paramMap) {
		return sysParamMapper.querySysParam(paramMap);
	}

	/**
	 * 新增参数
	 */
	@Override
	public void insertSysParam(SysParam sysParam) {
		Integer existing = sysParamMapper.getSysParamByParamName(sysParam.getParamName().trim());
		if (existing != null && existing > 0) {
			throw new IllegalArgumentException("参数名称已存在");
		}
		sysParam.setId(sequenceGenerator.nextId());
		sysParam.setTenantCode(CurrentUserUtils.getOAuth2AuthenticationDetailsInfo().get("tenantCode"));// 当前用户的租户编码
		sysParamMapper.insertSysParam(sysParam);
		logger.info("参数已新增： {}", sysParam.getParamName());
	}

	/**
	 * 编辑参数
	 */
	@Override
	public void updateSysParam(SysParam sysParam) {
		sysParamMapper.updateSysParam(sysParam);
		logger.info("参数已编辑： {}", sysParam.getParamName());
	}

	/**
	 * 删除参数
	 */
	@Override
	public void deleteSysParam(Long[] id) {
		sysParamMapper.deleteSysParam(id);
	}

}
