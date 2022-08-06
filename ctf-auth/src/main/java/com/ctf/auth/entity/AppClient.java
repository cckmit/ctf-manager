package com.ctf.auth.entity;

import java.io.Serializable;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import com.ctf.component.commons.entity.TimeEntity;
import com.ctf.component.commons.validator.InsertValidator;
import com.ctf.component.commons.validator.UpdateValidator;
import com.google.common.base.MoreObjects;
import com.google.common.base.Objects;

/**
 * 应用信息的实体类
 *
 *
 */
public class AppClient extends TimeEntity implements Serializable {

	private static final long serialVersionUID = 3425047713144124401L;
	@NotNull(groups = { UpdateValidator.class })
	private Long id;// ID
	@NotBlank(groups = { InsertValidator.class, UpdateValidator.class })
	@Size(max = 32, min = 1, groups = { InsertValidator.class, UpdateValidator.class })
	private String clientCode;// 应用编码
	@NotBlank(groups = { InsertValidator.class, UpdateValidator.class })
	@Size(max = 64, min = 1, groups = { InsertValidator.class, UpdateValidator.class })
	private String clientSecret;// 应用密钥
	@NotBlank(groups = { InsertValidator.class, UpdateValidator.class })
	@Size(max = 64, min = 1, groups = { InsertValidator.class, UpdateValidator.class })
	private String authType;// 授权类型
	@NotBlank(groups = { InsertValidator.class, UpdateValidator.class })
	@Size(max = 32, min = 1, groups = { InsertValidator.class, UpdateValidator.class })
	private String authScope;// 授权范围
	@NotNull(groups = { InsertValidator.class, UpdateValidator.class })
	private Long tokenSeconds;// 令牌秒数
	@NotNull(groups = { InsertValidator.class, UpdateValidator.class })
	private Long refreshSeconds;// 刷新秒数
	@NotBlank(groups = { InsertValidator.class, UpdateValidator.class })
	@Size(max = 512, min = 1, groups = { InsertValidator.class, UpdateValidator.class })
	private String fallbackUrl;// 回调地址
	@Size(max = 256, groups = { InsertValidator.class, UpdateValidator.class })
	private String clientDescription;// 应用描述
	private String tenantCode;// 租户编码

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getClientCode() {
		return clientCode;
	}

	public void setClientCode(String clientCode) {
		this.clientCode = clientCode;
	}

	public String getClientSecret() {
		return clientSecret;
	}

	public void setClientSecret(String clientSecret) {
		this.clientSecret = clientSecret;
	}

	public String getAuthType() {
		return authType;
	}

	public void setAuthType(String authType) {
		this.authType = authType;
	}

	public String getAuthScope() {
		return authScope;
	}

	public void setAuthScope(String authScope) {
		this.authScope = authScope;
	}

	public Long getTokenSeconds() {
		return tokenSeconds;
	}

	public void setTokenSeconds(Long tokenSeconds) {
		this.tokenSeconds = tokenSeconds;
	}

	public Long getRefreshSeconds() {
		return refreshSeconds;
	}

	public void setRefreshSeconds(Long refreshSeconds) {
		this.refreshSeconds = refreshSeconds;
	}

	public String getFallbackUrl() {
		return fallbackUrl;
	}

	public void setFallbackUrl(String fallbackUrl) {
		this.fallbackUrl = fallbackUrl;
	}

	public String getClientDescription() {
		return clientDescription;
	}

	public void setClientDescription(String clientDescription) {
		this.clientDescription = clientDescription;
	}

	public String getTenantCode() {
		return tenantCode;
	}

	public void setTenantCode(String tenantCode) {
		this.tenantCode = tenantCode;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || getClass() != o.getClass())
			return false;
		AppClient item = (AppClient) o;
		return Objects.equal(id, item.id);
	}

	@Override
	public int hashCode() {
		return Objects.hashCode(id);
	}

	@Override
	public String toString() {
		return MoreObjects.toStringHelper(this).add("id", id).add("clientCode", clientCode).add("clientSecret", clientSecret).add("authType", authType)
				.add("authScope", authScope).add("tokenSeconds", tokenSeconds).add("refreshSeconds", refreshSeconds).add("fallbackUrl", fallbackUrl)
				.add("clientDescription", clientDescription).add("tenantCode", tenantCode).add("createTime", super.getCreateTime()).toString();
	}

}
