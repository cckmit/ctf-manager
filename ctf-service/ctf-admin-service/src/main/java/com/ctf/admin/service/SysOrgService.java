package com.ctf.admin.service;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.ctf.admin.entity.SysOrg;

/**
 * 机构信息的业务逻辑接口层
 *
 *
 */
public interface SysOrgService {

	/**
	 * 查询机构的数据分页
	 *
	 * @param currentPage    当前页数
	 * @param pageSize       每页记录数
	 * @param orgName        机构名称
	 * @param orgType        机构类型
	 * @param orgDescription 机构描述
	 * @return
	 */
	Map<String, Object> querySysOrg(Integer currentPage, Integer pageSize, String orgName, String orgType, String orgDescription);

	/**
	 * 根据参数查询机构列表
	 *
	 * @param paramMap 参数Map
	 * @return
	 */
	List<LinkedHashMap<String, Object>> querySysOrg(Map<String, Object> paramMap);

	/**
	 * 查询机构的树数据
	 *
	 * @return
	 */
	LinkedHashMap<String, Object> querySysOrgTree();

	/**
	 * 查询机构类型的下拉框数据
	 *
	 * @return
	 */
	LinkedHashMap<String, Object> queryOrgType();

	/**
	 * 查询机构用户的树数据
	 *
	 * @param roleId 角色ID
	 * @param assign 是否分配（0是未分配，1是已分配）
	 * @return
	 */
	List<LinkedHashMap<String, Object>> queryOrgUserTree(Long roleId, Short assign);

	/**
	 * 查询机构的导出数据列表
	 *
	 * @param paramMap 参数Map
	 * @return
	 */
	List<LinkedHashMap<String, Object>> querySysOrgForExcel(Map<String, Object> paramMap);

	/**
	 * 新增机构
	 *
	 * @param sysOrg 机构对象
	 */
	void insertSysOrg(SysOrg sysOrg);

	/**
	 * 编辑机构
	 *
	 * @param sysOrg 机构对象
	 */
	void updateSysOrg(SysOrg sysOrg);

	/**
	 * 删除机构
	 *
	 * @param id 机构ID
	 */
	void deleteSysOrg(Long[] id);

}
