package com.ctf.account.client;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ctf.component.commons.client.ClientResponse;

/**
 * 提供给其他微服务调用的用户详细信息微服务接口层
 *
 *
 */
@FeignClient(name = "ctf-account-service", path = "/account/sysuserdetail", fallback = SysUserDetailServiceClientFallback.class)
public interface SysUserDetailServiceClient {

	/**
	 * 修改用户头像图片地址
	 *
	 * @param avatar 用户头像图片地址
	 * @param id     用户ID
	 */
	@PostMapping(value = "/updateAvatar")
	ClientResponse updateAvatar(@RequestParam(name = "avatar", required = true) String avatar, @RequestParam(name = "id", required = true) Long id);

}
