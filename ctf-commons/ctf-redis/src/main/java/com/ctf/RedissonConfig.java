//package com.ctf;
//
//
//import cn.hutool.core.util.StrUtil;
//import lombok.AllArgsConstructor;
//import org.redisson.Redisson;
//import org.redisson.api.RedissonClient;
//import org.redisson.config.ClusterServersConfig;
//import org.redisson.config.Config;
//import org.redisson.config.SingleServerConfig;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//
//import java.util.List;
//import java.util.stream.Collectors;
//
////@EnableConfigurationProperties(RedisProperties.class)
//@AllArgsConstructor
//@Configuration
//public class RedissonConfig {
//
//    private RedisProperties redisProperties;
//
///*    @Bean
//    public RedissonClient getRedisson(){
//        Config config = new Config();
//        SingleServerConfig singleServerConfig = config.useSingleServer().setAddress("redis://" + redisProperties.getHost() + ":" + redisProperties.getPort());
//        if(StrUtil.isNotEmpty(redisProperties.getPassword())){
//            singleServerConfig.setPassword(redisProperties.getPassword());
//        }
//        config.setCodec(new JsonJacksonCodec());
//        //添加主从配置
////        config.useMasterSlaveServers().setMasterAddress("").setPassword("").addSlaveAddress(new String[]{"",""});
//        return Redisson.create(config);
//    }*/
//
////    @Bean
////    CacheManager cacheManager(RedissonClient redissonClient) {
////        Map<String, CacheConfig> config = new HashMap<String, CacheConfig>();
////        // 创建一个名称为"testMap"的缓存，过期时间ttl为24分钟，同时最长空闲时maxIdleTime为12分钟。
////        config.put("testMap", new CacheConfig(24*60*1000, 12*60*1000));
////        return new RedissonSpringCacheManager(redissonClient, config);
////    }
//
//    @Bean
//    public RedissonClient getRedissonClient(RedisProperties redisProperties) {
//        Config config = new Config();
//        if (redisProperties.getCluster() != null) {
//            //集群模式配置
//            List<String> nodes = redisProperties.getCluster().getNodes();
//            nodes = nodes.stream().map(node -> "redis://" + node).collect(Collectors.toList());
//            ClusterServersConfig clusterServersConfig = config.useClusterServers();
//            clusterServersConfig.addNodeAddress(nodes.toArray(new String[nodes.size()]));
//            if (!StrUtil.isEmpty(redisProperties.getPassword())) {
//                clusterServersConfig.setPassword(redisProperties.getPassword());
//            }
//        } else {
//            //单节点配置
//            String address = "redis://" + redisProperties.getHost() + ":" + redisProperties.getPort();
//            SingleServerConfig serverConfig = config.useSingleServer();
//            serverConfig.setAddress(address);
//            if (!StrUtil.isEmpty(redisProperties.getPassword())) {
//                serverConfig.setPassword(redisProperties.getPassword());
//            }
//            serverConfig.setDatabase(redisProperties.getDatabase());
//        }
//        //看门狗的锁续期时间，默认30000ms，这里配置成15000ms
//        config.setLockWatchdogTimeout(15000);
//        return Redisson.create(config);
//    }
//
//}
