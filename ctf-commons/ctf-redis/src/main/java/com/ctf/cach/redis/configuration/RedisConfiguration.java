package com.ctf.cach.redis.configuration;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import redis.clients.jedis.JedisPool;

/**
 * Redis的配置类
 *
 *
 */
@Configuration
@ConfigurationProperties(prefix = "redis")
public class RedisConfiguration {

	private String host;// 主机IP
	private Integer port;// 端口
	private String password;// 密码
	private Long expiredTime;// 过期时间

	public String getHost() {
		return host;
	}

	public void setHost(String host) {
		this.host = host;
	}

	public Integer getPort() {
		return port;
	}

	public void setPort(Integer port) {
		this.port = port;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Long getExpiredTime() {
		return expiredTime;
	}

	public void setExpiredTime(Long expiredTime) {
		this.expiredTime = expiredTime;
	}

	@Bean
	public JedisPool getPool() {
		return new JedisPool(this.getHost(), this.getPort());
	}

}
