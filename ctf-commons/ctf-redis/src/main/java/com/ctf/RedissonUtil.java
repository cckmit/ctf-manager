//package com.ctf;
//
//import lombok.AllArgsConstructor;
//import lombok.extern.slf4j.Slf4j;
//import org.redisson.api.*;
//import org.redisson.config.Config;
//import org.springframework.stereotype.Component;
//
//import javax.annotation.PostConstruct;
//import java.io.IOException;
//
//@AllArgsConstructor
//@Slf4j
//@Component
//public class RedissonUtil {
//
//    RedissonClient redissonClient;
//
//    private static RedissonClient redissonClientStatic;
//
//    @PostConstruct
//    public void point(){
//        RedissonUtil.redissonClientStatic = redissonClient;
//    }
//
//    public static void getRedissonClient() throws IOException {
//        Config config = redissonClientStatic.getConfig();
//        System.out.println(config.toJSON().toString());
//    }
//
//    /**`
//     * 获取字符串对象
//     *
//     * @param objectName
//     * @return
//     */
//    public static <T> RBucket<T> getRBucket(String objectName) {
//        RBucket<T> bucket = redissonClientStatic.getBucket(objectName);
//        return bucket;
//    }
//
//    /**
//     * 获取Map对象
//     *
//     * @param objectName
//     * @return
//     */
//    public static <K, V> RMap<K, V> getRMap(String objectName) {
//        RMap<K, V> map = redissonClientStatic.getMap(objectName);
//        return map;
//    }
//
//    /**
//     * 获取有序集合
//     *
//     * @param objectName
//     * @return
//     */
//    public static <V> RSortedSet<V> getRSortedSet(String objectName) {
//        RSortedSet<V> sortedSet = redissonClientStatic.getSortedSet(objectName);
//        return sortedSet;
//    }
//
//    /**
//     * 获取集合
//     *
//     * @param objectName
//     * @return
//     */
//    public static <V> RSet<V> getRSet(String objectName) {
//        RSet<V> rSet = redissonClientStatic.getSet(objectName);
//        return rSet;
//    }
//
//    /**
//     * 获取列表
//     *
//     * @param objectName
//     * @return
//     */
//    public static <V> RList<V> getRList(String objectName) {
//        RList<V> rList = redissonClientStatic.getList(objectName);
//        return rList;
//    }
//
//    /**
//     * 获取队列
//     *
//     * @param objectName
//     * @return
//     */
//    public static <V> RQueue<V> getRQueue(String objectName) {
//        RQueue<V> rQueue = redissonClientStatic.getQueue(objectName);
//        return rQueue;
//    }
//
//    /**
//     * 获取双端队列
//     *
//     * @param objectName
//     * @return
//     */
//    public static <V> RDeque<V> getRDeque(String objectName) {
//        RDeque<V> rDeque = redissonClientStatic.getDeque(objectName);
//        return rDeque;
//    }
//
//
//    /**
//     * 获取锁
//     *
//     * @param objectName
//     * @return
//     */
//    public static RLock getRLock(String objectName) {
//        RLock rLock = redissonClientStatic.getLock(objectName);
//        return rLock;
//    }
//
//    /**
//     * 获取读取锁
//     *
//     * @param objectName
//     * @return
//     */
//    public static RReadWriteLock getRWLock(String objectName) {
//        RReadWriteLock rwlock = redissonClientStatic.getReadWriteLock(objectName);
//        return rwlock;
//    }
//
//    /**
//     * 获取原子数
//     *
//     * @param objectName
//     * @return
//     */
//    public static RAtomicLong getRAtomicLong(String objectName) {
//        RAtomicLong rAtomicLong = redissonClientStatic.getAtomicLong(objectName);
//        return rAtomicLong;
//    }
//
//    /**
//     * 获取记数锁
//     *
//     * @param objectName
//     * @return
//     */
//    public static RCountDownLatch getRCountDownLatch(String objectName) {
//        RCountDownLatch rCountDownLatch = redissonClientStatic.getCountDownLatch(objectName);
//        return rCountDownLatch;
//    }
//
//    /**
//     * 获取消息的Topic
//     *
//     * @param objectName
//     * @return
//     */
//    public static <M> RTopic getRTopic(String objectName) {
//        RTopic rTopic = redissonClientStatic.getTopic(objectName);
//        return rTopic;
//    }
//
//}
