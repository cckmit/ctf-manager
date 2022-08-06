package com.ctf.gateway.config;

import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.method.configuration.EnableReactiveMethodSecurity;
import org.springframework.security.config.annotation.web.reactive.EnableWebFluxSecurity;
import org.springframework.security.config.web.server.ServerHttpSecurity;
import org.springframework.security.web.server.SecurityWebFilterChain;

/**
 * WebFlux安全配置
 */
@EnableWebFluxSecurity
@EnableReactiveMethodSecurity
public class WebFluxConfig {

    /**
     * 配置拦截路径的安全规则
     */
    @Bean
    public SecurityWebFilterChain springSecurityFilterChain(ServerHttpSecurity http) {
        return http.csrf().disable().authorizeExchange().pathMatchers("/actuator/**").authenticated().anyExchange().permitAll().and().build();
    }

}
