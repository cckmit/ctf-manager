package com.ctf.auth;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableResourceServer;

/**
 * Ctf的OAuth2安全认证授权启动类
 *
 *
 */
@SpringBootApplication(scanBasePackages = "com.ctf")
@EnableResourceServer
@EnableDiscoveryClient
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class CtfAuthApplication {

	public static void main(String[] args) {
		SpringApplication.run(CtfAuthApplication.class);
	}

}
