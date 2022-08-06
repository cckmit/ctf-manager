package com.ctf.auth.controller;

import java.security.Principal;
import java.util.LinkedHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ctf.auth.service.AuthService;
import com.ctf.component.commons.result.ListResult;
import com.ctf.component.commons.result.ResultBuilder;

/**
 * 用户认证授权信息的控制层
 *
 *
 *
 */
@RestController
@RequestMapping("/users")
public class AuthController {

	@Autowired
	private AuthService authService;

	/**
	 * 查询当前用户信息
	 *
	 * @return
	 */
	@GetMapping(path = "/getSysUser")
	public ListResult<Object> getSysUser() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		LinkedHashMap<String, Object> data = authService.getSysUser(authentication.getName());
		return ResultBuilder.buildListSuccess(data);
	}

	@GetMapping(value = "/current")
	public Principal getSysUser(Principal principal) {
		return principal;
	}

}
