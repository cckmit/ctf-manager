package com.ctf.generator.service.impl;

import java.io.ByteArrayOutputStream;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.zip.ZipOutputStream;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ctf.admin.client.SysRoleServiceClient;
import com.ctf.component.commons.exception.ServiceException;
import com.ctf.component.commons.result.PaginationBuilder;
import com.ctf.component.commons.utils.CollectionUtils;
import com.ctf.component.commons.utils.CurrentUserUtils;
import com.ctf.component.commons.utils.GeneratorUtils;
import com.ctf.component.commons.utils.SequenceGenerator;
import com.ctf.generator.entity.Generator;
import com.ctf.generator.mapper.GeneratorMapper;
import com.ctf.generator.service.GeneratorService;
import com.ctf.generator.vo.GeneratorFieldVO;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

/**
 * 代码信息的业务逻辑实现层
 *
 *
 */
@Service
@Transactional
public class GeneratorServiceImpl implements GeneratorService {

	private final Logger logger = LoggerFactory.getLogger(getClass());
	private static SequenceGenerator sequenceGenerator = new SequenceGenerator();

	@Autowired
	private GeneratorMapper generatorMapper;
	@Autowired
	private SysRoleServiceClient sysRoleServiceClient;

	/**
	 * 查询代码信息分页
	 */
	@Override
	public Map<String, Object> queryGenerator(Integer currentPage, Integer pageSize, String moduleName, String serviceName, String sorter) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("moduleName", moduleName);
		paramMap.put("serviceName", serviceName);
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
		List<LinkedHashMap<String, Object>> resultList = generatorMapper.queryGenerator(paramMap);

		String roleData = sysRoleServiceClient.queryRoleData("generator", CurrentUserUtils.getOAuth2AuthenticationDetailsInfo().get("name"));
		String[] roleDataArray = roleData == null ? null : roleData.split(",");
		if (roleDataArray != null && roleDataArray.length > 0) {// 处理数据权限
			return PaginationBuilder.buildResult(CollectionUtils.convertFilterList(resultList, roleDataArray), page.getTotal(), currentPage, pageSize);
		} else {
			return PaginationBuilder.buildResult(resultList, page.getTotal(), currentPage, pageSize);
		}
	}

	/**
	 * 查询代码信息的导出数据列表
	 */
	@Override
	public List<LinkedHashMap<String, Object>> queryGeneratorForExcel(Map<String, Object> paramMap) {
		return generatorMapper.queryGenerator(paramMap);
	}

	/**
	 * 根据代码信息ID查询对应的实体字段
	 */
	@Override
	public Map<String, Object> queryFieldByGeneratorId(GeneratorFieldVO generatorFieldVO) {
		Map<String, Object> resultMap = new HashMap<>();
		List<LinkedHashMap<String, Object>> resultList = generatorMapper.queryFieldByGeneratorId(generatorFieldVO.getGeneratorId());
		resultMap.put("list", resultList);
		resultMap.put("count", resultList.size());
		return resultMap;
	}

	/**
	 * 新增代码信息
	 */
	@Override
	public void insertGenerator(Generator generator) {
		generator.setId(sequenceGenerator.nextId());
		insertGeneratorField(generator);
		generator.setTenantCode(CurrentUserUtils.getOAuth2AuthenticationDetailsInfo().get("tenantCode"));// 当前用户的租户编码
		generatorMapper.insertGenerator(generator);
		logger.info("代码信息已新增： {}", generator.getServiceName());
	}

	/**
	 * 编辑代码信息
	 */
	@Override
	public void updateGenerator(Generator generator) {
		generatorMapper.deleteGeneratorField(new Long[] { generator.getId() });
		insertGeneratorField(generator);
		generatorMapper.updateGenerator(generator);
		logger.info("代码信息已编辑： {}", generator.getServiceName());
	}

	/**
	 * 新增实体字段信息
	 */
	private void insertGeneratorField(Generator generator) {
		for (int i = 0; i < generator.getGeneratorField().size(); i++) {
			generatorMapper.insertGeneratorField(sequenceGenerator.nextId(), generator.getGeneratorField().get(i).getFieldType(),
					generator.getGeneratorField().get(i).getField(), generator.getId());
		}
	}

	/**
	 * 删除代码信息
	 */
	@Override
	public void deleteGenerator(Long[] id) {
		generatorMapper.deleteGenerator(id);
		generatorMapper.deleteGeneratorField(id);
	}

	/**
	 * 生成代码资源
	 */
	public byte[] generateResource(Long[] id) {
		try (ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
				ZipOutputStream zipOutputStream = new ZipOutputStream(byteArrayOutputStream);) {
			List<LinkedHashMap<String, Object>> codeList = generatorMapper.queryGeneratorById(id);
			for (int i = 0; i < codeList.size(); i++) {
				GeneratorUtils.generateResource(codeList.get(i), generatorMapper.queryFieldByGeneratorId(Long.valueOf(codeList.get(i).get("id").toString())),
						zipOutputStream);
			}
			return byteArrayOutputStream.toByteArray();
		} catch (Exception e) {
			throw new ServiceException(e.toString());
		}
	}

}
