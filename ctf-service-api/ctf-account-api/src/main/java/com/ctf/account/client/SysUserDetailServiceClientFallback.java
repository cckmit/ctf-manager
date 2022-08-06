package com.ctf.account.client;

import java.text.MessageFormat;

import org.springframework.stereotype.Component;

import com.ctf.component.commons.client.ClientResponse;
import com.ctf.component.commons.client.ResultCode;

/**
 * 提供给其他微服务调用的用户详细信息微服务接口的熔断降级类
 *
 *
 */
@Component
public class SysUserDetailServiceClientFallback implements SysUserDetailServiceClient {

	/**
	 * 修改用户头像图片地址产生异常的熔断降级
	 */
	@Override
	public ClientResponse updateAvatar(String avatar, Long id) {
		String message = MessageFormat.format("修改用户{0}头像图片地址失败", id);
		return new ClientResponse(ResultCode.FAILURE, message);
	}

}
