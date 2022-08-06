package com.ctf.component.commons.utils;

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.provider.OAuth2Authentication;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * 当前用户信息工具类
 *
 *
 */
public class CurrentUserUtils {

	private CurrentUserUtils() {

	}

	/**
	 * 获取当前用户详情信息
	 *
	 * @return
	 */
	public static Map<String, String> getOAuth2AuthenticationDetailsInfo() {
		Map<String, String> oauth2AuthenticationMap = new HashMap<>();
		OAuth2Authentication oauth2Authentication = (OAuth2Authentication) SecurityContextHolder.getContext().getAuthentication();
		UsernamePasswordAuthenticationToken usernamePasswordAuthenticationToken = (UsernamePasswordAuthenticationToken) oauth2Authentication
				.getUserAuthentication();
		String tenantCode = (String) ((LinkedHashMap<?, ?>) ((LinkedHashMap<?, ?>) ((LinkedHashMap<?, ?>) usernamePasswordAuthenticationToken.getDetails())
				.get("userAuthentication")).get("details")).get("tenantCode");
		oauth2AuthenticationMap.put("tenantCode", tenantCode);
		oauth2AuthenticationMap.put("name", oauth2Authentication.getName());
		return oauth2AuthenticationMap;
	}

	/**
	 * 获取当前用户信息
	 *
	 * @return
	 */
	public static Map<String, String> getOAuth2AuthenticationInfo() {
		Map<String, String> oauth2AuthenticationMap = new HashMap<>();
		OAuth2Authentication oauth2Authentication = (OAuth2Authentication) SecurityContextHolder.getContext().getAuthentication();
		UsernamePasswordAuthenticationToken usernamePasswordAuthenticationToken = (UsernamePasswordAuthenticationToken) oauth2Authentication
				.getUserAuthentication();
		String tenantCode = (String) ((LinkedHashMap<?, ?>) usernamePasswordAuthenticationToken.getDetails()).get("tenantCode");
		oauth2AuthenticationMap.put("tenantCode", tenantCode);
		oauth2AuthenticationMap.put("name", oauth2Authentication.getName());
		return oauth2AuthenticationMap;
	}

}
