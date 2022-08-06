//package com.ctf;
//
//import lombok.AllArgsConstructor;
//import lombok.Data;
//import org.springframework.boot.context.properties.ConfigurationProperties;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.stereotype.Component;
//
//import java.util.List;
//
//@ConfigurationProperties(prefix = "spring.redis")
//@Data
//@Component
//@Configuration
//public class RedisProperties {
//
//    private String host;
//
//    private Integer port;
//
//    private String password;
//
//    private int database = 0;
//
//    private Cluster cluster;
//
//
//    @Data
//    @AllArgsConstructor
//    public static class Cluster {
//        private List<String> nodes;
//        private Integer maxRedirects;
//
//        public Cluster() {
//        }
//
//    }
//}
