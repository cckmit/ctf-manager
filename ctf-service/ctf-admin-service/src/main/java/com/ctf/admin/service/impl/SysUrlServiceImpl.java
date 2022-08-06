package com.ctf.admin.service.impl;

import java.util.Collections;
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

import com.ctf.admin.entity.SysUrl;
import com.ctf.admin.mapper.SysRoleMapper;
import com.ctf.admin.mapper.SysUrlMapper;
import com.ctf.admin.service.SysUrlService;
import com.ctf.cach.redis.constants.ApplicationConstants;
import com.ctf.cach.redis.util.RedisUtils;
import com.ctf.component.commons.result.PaginationBuilder;
import com.ctf.component.commons.utils.CollectionUtils;
import com.ctf.component.commons.utils.CurrentUserUtils;
import com.ctf.component.commons.utils.SequenceGenerator;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

/**
 * 接口信息的业务逻辑实现层
 *
 *
 */
@Service
@Transactional
public class SysUrlServiceImpl implements SysUrlService {

	private final Logger logger = LoggerFactory.getLogger(getClass());
	private static SequenceGenerator sequenceGenerator = new SequenceGenerator();

	@Autowired
	private SysUrlMapper sysUrlMapper;
	@Autowired
	private SysRoleMapper sysRoleMapper;
	@Autowired
	private RedisUtils redisUtils;

	/**
	 * 查询接口分页
	 */
	@Override
	public Map<String, Object> querySysUrl(Integer currentPage, Integer pageSize, String url, String sorter) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("url", url);
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
		List<LinkedHashMap<String, Object>> resultList = sysUrlMapper.querySysUrl(paramMap);

		String roleData = sysRoleMapper.queryRoleData("sysurl", CurrentUserUtils.getOAuth2AuthenticationDetailsInfo().get("name"));
		String[] roleDataArray = roleData == null ? null : roleData.split(",");
		if (roleDataArray != null && roleDataArray.length > 0) {// 处理数据权限
			return PaginationBuilder.buildResult(CollectionUtils.convertFilterList(resultList, roleDataArray), page.getTotal(), currentPage, pageSize);
		} else {
			return PaginationBuilder.buildResult(resultList, page.getTotal(), currentPage, pageSize);
		}
	}

	/**
	 * 查询接口的导出数据列表
	 */
	@Override
	public List<LinkedHashMap<String, Object>> querySysUrlForExcel(Map<String, Object> paramMap) {
		return sysUrlMapper.querySysUrl(paramMap);
	}

	/**
	 * 新增接口
	 */
	@Override
	public void insertSysUrl(SysUrl sysUrl) {
		Integer existing = sysUrlMapper.getSysUrlByUrl(sysUrl.getUrl().trim());
		if (existing != null && existing > 0) {
			throw new IllegalArgumentException("接口已存在");
		}
		sysUrl.setId(sequenceGenerator.nextId());
		sysUrl.setTenantCode(CurrentUserUtils.getOAuth2AuthenticationDetailsInfo().get("tenantCode"));// 当前用户的租户编码
		sysUrlMapper.insertSysUrl(sysUrl);
		logger.info("接口已新增： {}", sysUrl.getUrl());
	}

	/**
	 * 编辑接口
	 */
	@Override
	public void updateSysUrl(SysUrl sysUrl) {
		sysUrlMapper.updateSysUrl(sysUrl);
		logger.info("接口已编辑： {}", sysUrl.getUrl());
	}

	/**
	 * 删除接口
	 */
	@Override
	public void deleteSysUrl(Long[] id) {
		sysUrlMapper.deleteSysUrl(id);
	}

	/**
	 * 将接口授权给角色
	 */
	@Override
	public void insertUrlIdRoleId(Long urlId, Long[] roleId) {
		sysUrlMapper.deleteUrlRole(urlId);
		for (int i = 0; i < roleId.length; i++) {
			sysUrlMapper.insertUrlIdRoleId(Long.valueOf(sequenceGenerator.nextId()), urlId, roleId[i]);
		}
		// 刷新Redis里的缓存数据
		List<String> roleCodeList = sysRoleMapper.queryRoleCodeList();
		for (int i = 0; i < roleCodeList.size(); i++) {
			String roleCode = roleCodeList.get(i);
			List<String> url = sysUrlMapper.queryRoleUrl(roleCode);
			redisUtils.psetex(ApplicationConstants.URL_ROLECODE_PREFIX + roleCode, url == null ? Collections.emptyList().toString() : url.toString());
		}
	}

	/**
	 * 根据接口ID查询对应的角色ID
	 */
	@Override
	public List<String> queryRoleIdByUrlId(Long urlId) {
		return sysUrlMapper.queryRoleIdByUrlId(urlId);
	}

}
