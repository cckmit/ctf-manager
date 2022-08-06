package com.ctf.admin;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.circuitbreaker.EnableCircuitBreaker;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableOAuth2Client;

import com.ctf.admin.mapper.SysRoleMapper;
import com.ctf.admin.mapper.SysUrlMapper;
import com.ctf.cach.redis.constants.ApplicationConstants;
import com.ctf.cach.redis.util.RedisUtils;

/**
 * Ctf的系统管理启动类
 *
 *
 */
@SpringBootApplication(scanBasePackages = "com.ctf")
@EnableDiscoveryClient
@EnableOAuth2Client
@EnableFeignClients(basePackages = { "com.ctf" })
@EnableCircuitBreaker
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class CtfAdminApplication implements CommandLineRunner {

	@Autowired
	private SysUrlMapper sysUrlMapper;
	@Autowired
	private SysRoleMapper sysRoleMapper;
	@Autowired
	private RedisUtils redisUtils;

	public static void main(String[] args) {
		SpringApplication.run(CtfAdminApplication.class);
	}

	/**
	 * 初始化角色编码对应的URL授权数据到Redis缓存，供网关验证权限
	 */
	@Override
	public void run(String... args) throws Exception {
		List<String> roleCodeList = sysRoleMapper.queryRoleCodeList();
		for (int i = 0; i < roleCodeList.size(); i++) {
			String roleCode = roleCodeList.get(i);
			List<String> url = sysUrlMapper.queryRoleUrl(roleCode);
			redisUtils.psetex(ApplicationConstants.URL_ROLECODE_PREFIX + roleCode, url == null ? Collections.emptyList().toString() : url.toString());
		}
	}

}
