package com.ctf;

import lombok.extern.slf4j.Slf4j;
import org.apache.http.Header;
import org.apache.http.HttpHost;
import org.apache.http.impl.client.BasicCredentialsProvider;
import org.apache.http.impl.nio.conn.PoolingNHttpClientConnectionManager;
import org.apache.http.impl.nio.reactor.DefaultConnectingIOReactor;
import org.apache.http.message.BasicHeader;
import org.apache.http.nio.reactor.IOReactorException;
import org.apache.http.nio.reactor.IOReactorExceptionHandler;
import org.elasticsearch.client.RestClient;
import org.elasticsearch.client.RestClientBuilder;
import org.elasticsearch.client.RestHighLevelClient;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;

@Slf4j
public class ESClientSpringFactory {

    public static int CONNECT_TIMEOUT_MILLIS = 10000;
    public static int SOCKET_TIMEOUT_MILLIS = 60000*10;
    public static int CONNECTION_REQUEST_TIMEOUT_MILLIS = 500;
    public static int MAX_CONN_PER_ROUTE = 50;
    public static int MAX_CONN_TOTAL = 150;

    private static HttpHost[] HTTP_HOST;
    private RestClientBuilder builder;
    private RestClient restClient;
    private RestHighLevelClient restHighLevelClient;

    private static ESClientSpringFactory esClientSpringFactory = new ESClientSpringFactory();

    private ESClientSpringFactory() {
    }

    public static ESClientSpringFactory build(HttpHost[] httpHost,
                                              Integer maxConnectNum, Integer maxConnectPerRoute) {
        HTTP_HOST = httpHost;
        MAX_CONN_TOTAL = maxConnectNum;
        MAX_CONN_PER_ROUTE = maxConnectPerRoute;
        return esClientSpringFactory;
    }

    public static ESClientSpringFactory build(HttpHost[] httpHost, Integer connectTimeOut, Integer socketTimeOut,
                                              Integer connectionRequestTime, Integer maxConnectNum, Integer maxConnectPerRoute) {
        HTTP_HOST = httpHost;
        CONNECT_TIMEOUT_MILLIS = connectTimeOut;
        SOCKET_TIMEOUT_MILLIS = socketTimeOut;
        CONNECTION_REQUEST_TIMEOUT_MILLIS = connectionRequestTime;
        MAX_CONN_TOTAL = maxConnectNum;
        MAX_CONN_PER_ROUTE = maxConnectPerRoute;
        return esClientSpringFactory;
    }


    public void init() {
        builder = RestClient.builder(HTTP_HOST);
        setConnectTimeOutConfig();
        setMutiConnectConfig();
        restClient = builder.build();
        restHighLevelClient = new RestHighLevelClient(builder);
        System.out.println("init factory");
    }

    // 配置连接时间延时
    public void setConnectTimeOutConfig() {
        builder.setRequestConfigCallback(requestConfigBuilder -> {
            requestConfigBuilder.setConnectTimeout(CONNECT_TIMEOUT_MILLIS);
            requestConfigBuilder.setSocketTimeout(SOCKET_TIMEOUT_MILLIS);
            return requestConfigBuilder;
        });
    }

    // 使用异步httpclient时设置并发连接数
    public void setMutiConnectConfig(){
        builder.setHttpClientConfigCallback(httpClientBuilder -> {
            httpClientBuilder.setMaxConnTotal(MAX_CONN_TOTAL);
            httpClientBuilder.setMaxConnPerRoute(MAX_CONN_PER_ROUTE);
            List<Header> headers = new ArrayList<>();
            headers.add(new BasicHeader("Connection", "keep-alive"));
            headers.add(new BasicHeader("Keep-Alive", "720"));
            httpClientBuilder.setDefaultHeaders(headers);
            httpClientBuilder.setDefaultCredentialsProvider(new BasicCredentialsProvider()).setKeepAliveStrategy((response, context) ->  TimeUnit.MINUTES.toMillis(3));
            try {
                DefaultConnectingIOReactor ioReactor = new DefaultConnectingIOReactor();
                ioReactor.setExceptionHandler(new IOReactorExceptionHandler() {
                    @Override
                    public boolean handle(IOException e) {
                        log.info("System may be unstable: IOReactor encountered a checked exception : "
                                + e.getMessage(), e);
                        return true; // Return true to note this exception as handled, it will not be re-thrown
                    }

                    @Override
                    public boolean handle(RuntimeException e) {
                        log.info("System may be unstable: IOReactor encountered a runtime exception : "
                                + e.getMessage(), e);
                        return true; // Return true to note this exception as handled, it will not be re-thrown
                    }
                });
                httpClientBuilder.setConnectionManager(new PoolingNHttpClientConnectionManager(ioReactor));
            } catch (IOReactorException e) {
                throw new RuntimeException(e);
            }
            return httpClientBuilder;
        });
    }

    public RestClient getClient() {
        return restClient;
    }

    public RestHighLevelClient getRhlClient() {
        return restHighLevelClient;
    }

    public void close() {
        if (restClient != null) {
            try {
                restClient.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        System.out.println("close client");
    }

    /**
     * 单例的客户端
     */
    public static volatile RestHighLevelClient INSTANCE;

    /**
     * 获取高级客户端，会判断空会重建
     * @return
     * @throws RuntimeException
     */
    public static RestHighLevelClient getRHLClientForInstance() throws RuntimeException {
        if (INSTANCE == null) {
            synchronized (ESConfig.class) {
                if (INSTANCE == null) {
                    //解析hostlist配置信息
                    String[] split = ESConfig.hostStatic.split(",");
                    //创建HttpHost数组，其中存放es主机和端口的配置信息
                    HttpHost[] httpHostArray = new HttpHost[split.length];
                    for (int i = 0; i < split.length; i++) {
                        String item = split[i];
                        httpHostArray[i] = new HttpHost(item.split(":")[0], Integer.parseInt(item.split(":")[1]), "http");
                    }
                    INSTANCE = new RestHighLevelClient(RestClient.builder(httpHostArray)
                            .setHttpClientConfigCallback(httpClientBuilder -> {
                                httpClientBuilder.setMaxConnTotal(ESConfig.connectNumStatic);
                                httpClientBuilder.setMaxConnPerRoute(ESConfig.connectPerRouteStatic);
                                List<Header> headers = new ArrayList<>();
                                headers.add(new BasicHeader("Connection", "keep-alive"));
                                headers.add(new BasicHeader("Keep-Alive", "720"));
                                httpClientBuilder.setDefaultHeaders(headers);
                                httpClientBuilder.setDefaultCredentialsProvider(new BasicCredentialsProvider()).setKeepAliveStrategy((response, context) ->  TimeUnit.MINUTES.toMillis(3));
                                try {
                                    DefaultConnectingIOReactor ioReactor = new DefaultConnectingIOReactor();
                                    ioReactor.setExceptionHandler(new IOReactorExceptionHandler() {
                                        @Override
                                        public boolean handle(IOException e) {
                                            log.info("System may be unstable: IOReactor encountered a checked exception : "
                                                    + e.getMessage(), e);
                                            return true; // Return true to note this exception as handled, it will not be re-thrown
                                        }

                                        @Override
                                        public boolean handle(RuntimeException e) {
                                            log.info("System may be unstable: IOReactor encountered a runtime exception : "
                                                    + e.getMessage(), e);
                                            return true; // Return true to note this exception as handled, it will not be re-thrown
                                        }
                                    });
                                    httpClientBuilder.setConnectionManager(new PoolingNHttpClientConnectionManager(ioReactor));
                                } catch (IOReactorException e) {
                                    log.info("异常：message=={},error=" + e.getMessage(), e);
                                    throw new RuntimeException(e);
                                }
                                return httpClientBuilder;
                            }));

                }
            }
        }
        return INSTANCE;
    }

    /**
     * 刷新客户端
     * @throws RuntimeException
     */
    public static void refresh() throws RuntimeException {
        ESClientSpringFactory.INSTANCE = null;
    }


}

