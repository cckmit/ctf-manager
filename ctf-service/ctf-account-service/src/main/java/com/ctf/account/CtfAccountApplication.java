package com.ctf.account;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.circuitbreaker.EnableCircuitBreaker;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableOAuth2Client;

/**
 * Ctf的账户管理启动类
 *
 *
 */
@SpringBootApplication(scanBasePackages = "com.ctf")
@EnableDiscoveryClient
@EnableOAuth2Client
@EnableFeignClients(basePackages = { "com.ctf" })
@EnableCircuitBreaker
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class CtfAccountApplication {

	public static void main(String[] args) {
		SpringApplication.run(CtfAccountApplication.class);
	}

}
