package com.ctf.gateway.filter;

import com.ctf.cach.redis.constants.ApplicationConstants;
//import com.ctf.cach.redis.util.RedisUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.core.Ordered;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

/**
 * Ctf的入口网关过滤器
 */
@Component
public class GatewayFilter implements GlobalFilter, Ordered {
//
//    @Autowired
//    private RedisUtils redisUtils;

    /**
     * 执行过滤器，处理无权限的URL
     */
    @Override
    public Mono<Void> filter(ServerWebExchange exchange, GatewayFilterChain chain) {
        String roleCode = exchange.getRequest().getHeaders().getFirst("RoleCode");
        String url = exchange.getRequest().getURI().toString();
        if (url.indexOf("/api/uaa/oauth/token") == -1
                && url.indexOf("/api/file/static/upload") == -1
                && url.indexOf("/api/account/sysuserdetail/compareCaptcha") == -1
                && !"undefined".equals(roleCode)
                && !"null".equals(roleCode)
                && !"guest".equals(roleCode)
                && StringUtils.isNotBlank(roleCode)) {
            String partialUrl;
            if (url.contains("?")) {
                partialUrl = url.substring(url.lastIndexOf("api") + 3, url.lastIndexOf("?"));// 截取api后面的url一直到?
            } else {
                partialUrl = url.substring(url.lastIndexOf("api") + 3);// 截取api后面的url
            }
            String[] partialUrlArray = partialUrl.split("/");
            // 再处理待比较url，以支持路径包含传参，格式是：模块路径 + 类路径 + 方法路径
            String newPartialUrl = "/" + partialUrlArray[1] + "/" + partialUrlArray[2] + "/" + partialUrlArray[3];
            String[] rawRoleCode = roleCode.split(",");
            StringBuilder stringBuilder = new StringBuilder();
//            for (int i = 0; i < rawRoleCode.length; i++) {
//                stringBuilder
//                        .append(redisUtils.get(ApplicationConstants.URL_ROLECODE_PREFIX + StringUtils.strip(StringUtils.strip(rawRoleCode[i], "[]"), "\"")));
//            }
            if (stringBuilder != null) {
                if (stringBuilder.indexOf(newPartialUrl) == -1) {
                    exchange.getResponse().setStatusCode(HttpStatus.UNAUTHORIZED);
                    return exchange.getResponse().setComplete();
                }
            }
        }
        return chain.filter(exchange);
    }

    /**
     * 过滤器执行的顺序
     */
    @Override
    public int getOrder() {
        return -1;
    }

}
