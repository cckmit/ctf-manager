package com.ctf;

import lombok.Data;
import org.apache.http.HttpHost;
import org.elasticsearch.client.RestClient;
import org.elasticsearch.client.RestHighLevelClient;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;

@Configuration
@Component
@ConfigurationProperties(prefix = "elasticsearch")//配置注解表示这个类可以读取所有yml以 "elasticSearch"开头的配置项
@Data
public class ESConfig {

    private String host;

    private int port;

    private Integer connectNum;

    private Integer connectPerRoute;

    public static String hostStatic;

    public static int portStatic;

    public static Integer connectNumStatic;

    public static Integer connectPerRouteStatic;

    @PostConstruct
    public void initStaticParam() {
        hostStatic = host;
        portStatic = port;
        connectNumStatic = connectNum;
        connectPerRouteStatic = connectPerRoute;
    }

    @Bean
    public HttpHost[] httpHost() {
        //解析hostlist配置信息
        String[] split = host.split(",");
        //创建HttpHost数组，其中存放es主机和端口的配置信息
        HttpHost[] httpHostArray = new HttpHost[split.length];
        for (int i = 0; i < split.length; i++) {
            String item = split[i];
            httpHostArray[i] = new HttpHost(item.split(":")[0], Integer.parseInt(item.split(":")[1]), "http");
        }
        return httpHostArray;
    }

    @Bean(initMethod="init",destroyMethod="close")
//    @Bean(initMethod="init")
    public ESClientSpringFactory getFactory(){
        return ESClientSpringFactory.
                build(httpHost(), connectNum, connectPerRoute);
    }

    @Bean
    @Scope("singleton")
    public RestClient getRestClient(){
        return getFactory().getClient();
    }

    @Bean
    @Scope("singleton")
    public RestHighLevelClient getRHLClient(){
        return getFactory().getRhlClient();
    }

}


