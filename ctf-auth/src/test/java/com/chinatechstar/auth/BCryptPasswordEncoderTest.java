package com.chinatechstar.auth;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.junit4.SpringRunner;

/**
 * Ctf的密码加密测试类
 *
 *
 *
 */
@RunWith(SpringRunner.class)
public class BCryptPasswordEncoderTest {

	@Test
	public void contextLoads() throws Exception {
		assertThat(new BCryptPasswordEncoder().encode("123456")).isNotNull();
	}

}
