package com.ctf.component.commons.config;

import io.swagger.annotations.ApiOperation;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.ParameterBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.schema.ModelRef;
import springfox.documentation.service.*;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spi.service.contexts.SecurityContext;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

import java.util.ArrayList;
import java.util.List;

/**
 * Swagger API接口文档配置类
 *
 *
 */
@Configuration
@EnableSwagger2
public class SwaggerConfig {

	/**
	 * API的具体配置
	 *
	 * @return
	 */
	@Bean
	public Docket createRestApi() {
		ParameterBuilder parameterBuilder = new ParameterBuilder();
		List<Parameter> parameters = new ArrayList<Parameter>();
		parameterBuilder.name("Authorization").description("令牌").modelRef(new ModelRef("string")).parameterType("header").required(false).build();
		parameters.add(parameterBuilder.build());

		return new Docket(DocumentationType.SWAGGER_2).pathMapping("/").select().apis(RequestHandlerSelectors.withMethodAnnotation(ApiOperation.class)).build()
				.apiInfo(new ApiInfoBuilder().title("Ctf Swagger API").description("Ctf微服务平台接口文档").version("1.0.0").build())
				.useDefaultResponseMessages(false).securitySchemes(securitySchemes()).securityContexts(securityContexts())
				.globalOperationParameters(parameters);
	}

	private List<SecurityScheme> securitySchemes() {
		List<SecurityScheme> apiKeyList = new ArrayList<>();
		apiKeyList.add(new ApiKey("Authorization", "Authorization", "header"));
		return apiKeyList;
	}

	private List<SecurityContext> securityContexts() {
		List<SecurityContext> securityContexts = new ArrayList<>();
		securityContexts.add(SecurityContext.builder().securityReferences(defaultAuth()).forPaths(PathSelectors.regex("^(?!auth).*$")).build());
		return securityContexts;
	}

	List<SecurityReference> defaultAuth() {
		AuthorizationScope authorizationScope = new AuthorizationScope("global", "accessEverything");
		AuthorizationScope[] authorizationScopes = new AuthorizationScope[1];
		authorizationScopes[0] = authorizationScope;
		List<SecurityReference> securityReferences = new ArrayList<>();
		securityReferences.add(new SecurityReference("Authorization", authorizationScopes));
		return securityReferences;
	}

}
