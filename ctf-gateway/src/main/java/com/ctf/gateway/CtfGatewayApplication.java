package com.ctf.gateway;

//import com.ctf.gateway.filter.GatewayFilter;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.context.annotation.Bean;

/**
 * Ctf的入口网关启动类
 */
@SpringBootApplication(scanBasePackages = "com.ctf")
@EnableDiscoveryClient
public class CtfGatewayApplication {

    public static void main(String[] args) {
        SpringApplication.run(CtfGatewayApplication.class);
    }

//    @Bean
//    public GatewayFilter gatewayFilter() {
//        return new GatewayFilter();
//    }

}
