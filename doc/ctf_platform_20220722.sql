/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50730
 Source Host           : localhost:3306
 Source Schema         : ctf_platform

 Target Server Type    : MySQL
 Target Server Version : 50730
 File Encoding         : 65001

 Date: 22/07/2022 01:36:43
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

CREATE DATABASE ctf_platform;
USE ctf_platform;

-- ----------------------------
-- Table structure for mscode_app_client
-- ----------------------------
DROP TABLE IF EXISTS `mscode_app_client`;
CREATE TABLE `mscode_app_client` (
  `id` bigint(20) NOT NULL COMMENT '应用主键ID',
  `client_code` varchar(32) NOT NULL COMMENT '应用编码',
  `client_secret` varchar(64) NOT NULL COMMENT '应用密钥',
  `auth_type` varchar(64) NOT NULL COMMENT '授权类型',
  `auth_scope` varchar(32) NOT NULL COMMENT '授权范围',
  `token_seconds` bigint(20) NOT NULL COMMENT '令牌秒数',
  `refresh_seconds` bigint(20) NOT NULL COMMENT '刷新秒数',
  `fallback_url` varchar(512) NOT NULL COMMENT '回调地址',
  `client_description` varchar(256) DEFAULT NULL COMMENT '应用描述',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `tenant_code` varchar(64) DEFAULT '10001' COMMENT '租户编码',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_client_code` (`client_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='应用表';

-- ----------------------------
-- Records of mscode_app_client
-- ----------------------------
BEGIN;
INSERT INTO `mscode_app_client` (`id`, `client_code`, `client_secret`, `auth_type`, `auth_scope`, `token_seconds`, `refresh_seconds`, `fallback_url`, `client_description`, `create_time`, `update_time`, `tenant_code`) VALUES (699100199708446720, 'mscode', 'mscode_secret', 'refresh_token,password,authorization_code', 'all', 3600, 604800, 'http://127.0.0.1:10004', 'MSCode微服务平台的应用管理', '2020-04-13 11:34:36', '2020-04-16 19:17:32', '10001');
COMMIT;

-- ----------------------------
-- Table structure for mscode_file
-- ----------------------------
DROP TABLE IF EXISTS `mscode_file`;
CREATE TABLE `mscode_file` (
  `id` bigint(20) NOT NULL COMMENT '文件主键ID',
  `name` varchar(32) DEFAULT NULL COMMENT '文件参数名',
  `original_filename` varchar(256) NOT NULL COMMENT '文件名称',
  `file_size` bigint(20) DEFAULT NULL COMMENT '文件大小，单位：字节',
  `content_type` varchar(256) DEFAULT NULL COMMENT '数据类型',
  `file_type` varchar(32) DEFAULT NULL COMMENT '文件类型',
  `type` tinyint(4) DEFAULT '1' COMMENT '1:文件夹，2:文件',
  `url` varchar(256) DEFAULT NULL COMMENT '下载URL',
  `content` longtext COMMENT '文件字符串内容',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '上级ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `tenant_code` varchar(64) DEFAULT '10001' COMMENT '租户编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='文件表';

-- ----------------------------
-- Records of mscode_file
-- ----------------------------
BEGIN;
INSERT INTO `mscode_file` (`id`, `name`, `original_filename`, `file_size`, `content_type`, `file_type`, `type`, `url`, `content`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (681335583645552640, 'file', '我的头像.png', 15814, 'image/png', 'image', 2, '/static/upload/20200224110421638.png', NULL, 0, '2020-02-24 11:04:22', '2021-01-11 13:43:14', '10001');
INSERT INTO `mscode_file` (`id`, `name`, `original_filename`, `file_size`, `content_type`, `file_type`, `type`, `url`, `content`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (798065279526948864, NULL, '文档集', NULL, NULL, NULL, 1, NULL, NULL, 0, '2021-01-11 13:46:30', NULL, '10001');
INSERT INTO `mscode_file` (`id`, `name`, `original_filename`, `file_size`, `content_type`, `file_type`, `type`, `url`, `content`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (798075650501431296, 'file', 'Spring Boot and Spring Cloud.pdf', 88940, 'application/pdf', 'document', 2, '/static/upload/20210111142742606.pdf', 'Copyright ©2003-2021 Accelebrate, Inc. Some outlines may contain content from our courseware partners; such \r\ncontent is protected by these partners’ copyrights. All trademarks are owned by their respective owners. \r\n \r\n \r\nSpring Boot and Spring Cloud \r\nCourse Number: SPRG-184 \r\nDuration: 5 Days \r\nOverview \r\nRapid advancements in cloud-based software delivery and virtualization have caused many \r\ndevelopers to question the wisdom of a “Big Server” approach to deploying web applications. \r\nSpring Boot is a technology stack that builds on the popular Spring Framework to allow the \r\ndeployment of Spring-based applications as stand-alone jar files that host their own web \r\nservers.  This approach works nicely with deployment automation and rapid scaling. \r\nCloud-based, highly-distributed applications face additional challenges in supporting a \r\ndynamic environment, especially around configuration, service discovery, service resilience, \r\nand monitoring. Spring Cloud embraces and extends the popular suite of open source cloud \r\ntools published by Netflix (Eureka, Hystrix, Ribbon, etc.). \r\nThis Spring Boot and Spring Cloud training introduces Spring Boot, Spring Cloud, and the \r\nNetflix OSS suite as a way to deploy highly resilient and scalable RESTful services and web \r\napplications. \r\nPrerequisites \r\nAll attendees must be comfortable programming in Java and have a basic understanding of \r\nSpring Dependency Injection using the Spring @Autowired annotation or the javax @Inject \r\nannotation. Spring Java Configuration experience is helpful but not required. \r\nMaterials \r\nAll Spring training attendees receive courseware covering the topics in the course. \r\nSoftware Needed on Each Student PC \r\n 64-bit Windows, Mac, or Linux environment with at least 8GB RAM \r\n Java 1.8 or later \r\n Eclipse or IntelliJ (we may be able to support other IDEs upon request) \r\n Related lab files that Accelebrate provides \r\nObjectives \r\n Use Spring Boot to build standalone web applications and RESTful services \r\n Understand the Configuration techniques that Spring Boot Provides \r\n Build Spring boot based Microservices for JSON and XML data exchange \r\n Monitor services using the Prometheus Actuator \r\n Understand the major components of Netflix OSS \r\n Register services with a Eureka Service \r\n Implement “client” load balancing with Ribbon to Eureka managed Services \r\n Create fault-tolerant services with Hystrix callbacks \r\nCopyright ©2003-2021 Accelebrate, Inc. Some outlines may contain content from our courseware partners; such \r\ncontent is protected by these partners’ copyrights. All trademarks are owned by their respective owners. \r\n Filter requests to your Microservices using Zuul \r\n Create producer and Consumer services using Kafka and Zookeeper \r\n Define Feign clients to your services \r\nOutline \r\n Introduction  \r\no What is Spring Boot? \r\no Spring starter Maven Dependencies \r\no Understanding @SpringBootApplication \r\no Example of Spring MVC-based RESTful Web Service \r\no Project Structure \r\no Externalized Configuration application.properties and YAML \r\no @ConfigurationPropetrties  \r\n Type Safe Properties \r\n JSR303 Validation of Properties \r\n Spring Environment Object \r\n @Value vs @ConfigurationProperties \r\no Logging \r\n Actuators  \r\no Exposing Information about your services \r\no Customize Health and Info Endpoints \r\no Custom Metrics and Custom Actuator \r\no Prometheus Monitoring \r\n Building Web Applications  \r\no Controllers and ModelAttributes \r\no Template Views \r\no Using Embedded and External Databases \r\no Spring Boot Initializers and Command Line Runners \r\no Active Profiles \r\no Form Submissions \r\n REST Services  \r\no What is REST? \r\no Restful Controllers \r\no JSON and XML Data Exchange \r\no Content Negotiation \r\no Angular JS Accessing your Services \r\n Java Clients using RestTemplate  \r\no ResponseEntity \r\no Headers \r\no Status codes \r\no RequestEntity \r\no Posting JSON to a Service \r\n Persistence with JPA Repositories  \r\no JPA, EntityManagers, Entity Classes, Annotation mappings \r\no Spring JPA Data, CrudRepository, PagingAndSortingRepository \r\no Spring Data Rest, Exposing Databases as Endpoints \r\no HATEOAS JSON \r\no @Projections and Excerpts  \r\n Restrict the data sent back to the client \r\n Introduction to Microservices  \r\no What are Microservices? \r\no Decentralized Governance, Scalability, Fault Tolerance \r\nCopyright ©2003-2021 Accelebrate, Inc. Some outlines may contain content from our courseware partners; such \r\ncontent is protected by these partners’ copyrights. All trademarks are owned by their respective owners. \r\no Cloud Computing \r\no Spring Cloud \r\no Service and Client Discovery \r\no Netflix OSS \r\n Core Microservice Patterns using Spring Cloud and Netflix OSS  \r\no Where are my Services?  \r\n Using Service Discovery \r\n Eureka Servers and Clients \r\no Scale Services  \r\n Load Balancing with Ribbon using Service Discovery \r\n A LoadBalanced RestTemplate \r\n Load Balancing with Ribbon without Service Discovery \r\no Circuit Breaker, when services fail  \r\n Hystrix \r\n Callbacks \r\no Gateway/Edge Services – Providing an API  \r\n Zuul services \r\n Filtering the Request and Response  \r\no Create Feign Clients to your Services \r\no Event Driven Services or Sagas  \r\n Keeping Services synchronized with each other \r\n Creating Message Queues with Zookeeper and Kafka \r\n Docker Images and Containers  \r\no Orchestration and Workflow \r\n Conclusion \r\n \r\n', 798065279526948864, '2021-01-11 14:27:43', '2021-01-18 11:25:24', '10001');
INSERT INTO `mscode_file` (`id`, `name`, `original_filename`, `file_size`, `content_type`, `file_type`, `type`, `url`, `content`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (798076789640843264, 'file', 'Spring Boot and Spring Cloud.txt', 53, 'text/plain', 'other', 2, '/static/upload/20210111143214199.txt', 'MSCode微服务平台\r\nSpring Boot and Spring Cloud\r\n', 0, '2021-01-11 14:32:14', '2021-01-18 11:27:56', '10001');
INSERT INTO `mscode_file` (`id`, `name`, `original_filename`, `file_size`, `content_type`, `file_type`, `type`, `url`, `content`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (798076828920500224, 'file', 'Spring Boot and Spring Cloud.docx', 36190, 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'document', 2, '/static/upload/20210111143223562.docx', '\n\nSpring Boot and Spring Cloud\nCourse Number: SPRG-184\nDuration: 5 Days\nOverview\nRapid advancements in cloud-based software delivery and virtualization have caused many developers to question the wisdom of a “Big Server” approach to deploying web applications. Spring Boot is a technology stack that builds on the popular Spring Framework to allow the deployment of Spring-based applications as stand-alone jar files that host their own web servers.  This approach works nicely with deployment automation and rapid scaling.\nCloud-based, highly-distributed applications face additional challenges in supporting a dynamic environment, especially around configuration, service discovery, service resilience, and monitoring. Spring Cloud embraces and extends the popular suite of open source cloud tools published by Netflix (Eureka, Hystrix, Ribbon, etc.).\nThis Spring Boot and Spring Cloud training introduces Spring Boot, Spring Cloud, and the Netflix OSS suite as a way to deploy highly resilient and scalable RESTful services and web applications.\nPrerequisites\nAll attendees must be comfortable programming in Java and have a basic understanding of Spring Dependency Injection using the Spring @Autowired annotation or the javax @Inject annotation. Spring Java Configuration experience is helpful but not required.\nMaterials\nAll Spring training attendees receive courseware covering the topics in the course.\nSoftware Needed on Each Student PC\n64-bit Windows, Mac, or Linux environment with at least 8GB RAM\nJava 1.8 or later\nEclipse or IntelliJ (we may be able to support other IDEs upon request)\nRelated lab files that Accelebrate provides\nObjectives\nUse Spring Boot to build standalone web applications and RESTful services\nUnderstand the Configuration techniques that Spring Boot Provides\nBuild Spring boot based Microservices for JSON and XML data exchange\nMonitor services using the Prometheus Actuator\nUnderstand the major components of Netflix OSS\nRegister services with a Eureka Service\nImplement “client” load balancing with Ribbon to Eureka managed Services\nCreate fault-tolerant services with Hystrix callbacks\nFilter requests to your Microservices using Zuul\nCreate producer and Consumer services using Kafka and Zookeeper\nDefine Feign clients to your services\nOutline\nIntroduction \nWhat is Spring Boot?\nSpring starter Maven Dependencies\nUnderstanding @SpringBootApplication\nExample of Spring MVC-based RESTful Web Service\nProject Structure\nExternalized Configuration application.properties and YAML\n@ConfigurationPropetrties \nType Safe Properties\nJSR303 Validation of Properties\nSpring Environment Object\n@Value vs @ConfigurationProperties\nLogging\nActuators \nExposing Information about your services\nCustomize Health and Info Endpoints\nCustom Metrics and Custom Actuator\nPrometheus Monitoring\nBuilding Web Applications \nControllers and ModelAttributes\nTemplate Views\nUsing Embedded and External Databases\nSpring Boot Initializers and Command Line Runners\nActive Profiles\nForm Submissions\nREST Services \nWhat is REST?\nRestful Controllers\nJSON and XML Data Exchange\nContent Negotiation\nAngular JS Accessing your Services\nJava Clients using RestTemplate \nResponseEntity\nHeaders\nStatus codes\nRequestEntity\nPosting JSON to a Service\nPersistence with JPA Repositories \nJPA, EntityManagers, Entity Classes, Annotation mappings\nSpring JPA Data, CrudRepository, PagingAndSortingRepository\nSpring Data Rest, Exposing Databases as Endpoints\nHATEOAS JSON\n@Projections and Excerpts \nRestrict the data sent back to the client\nIntroduction to Microservices \nWhat are Microservices?\nDecentralized Governance, Scalability, Fault Tolerance\nCloud Computing\nSpring Cloud\nService and Client Discovery\nNetflix OSS\nCore Microservice Patterns using Spring Cloud and Netflix OSS \nWhere are my Services? \nUsing Service Discovery\nEureka Servers and Clients\nScale Services \nLoad Balancing with Ribbon using Service Discovery\nA LoadBalanced RestTemplate\nLoad Balancing with Ribbon without Service Discovery\nCircuit Breaker, when services fail \nHystrix\nCallbacks\nGateway/Edge Services – Providing an API \nZuul services\nFiltering the Request and Response \nCreate Feign Clients to your Services\nEvent Driven Services or Sagas \nKeeping Services synchronized with each other\nCreating Message Queues with Zookeeper and Kafka\nDocker Images and Containers \nOrchestration and Workflow\nConclusion\n\nCopyright ©2003-2021 Accelebrate, Inc. Some outlines may contain content from our courseware partners; such content is protected by these partners’ copyrights. All trademarks are owned by their respective owners.\n', 0, '2021-01-11 14:32:24', '2021-01-18 11:27:23', '10001');
INSERT INTO `mscode_file` (`id`, `name`, `original_filename`, `file_size`, `content_type`, `file_type`, `type`, `url`, `content`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (798076858771361792, 'file', 'Spring Boot and Spring Cloud.pdf', 88940, 'application/pdf', 'document', 2, '/static/upload/20210111143230678.pdf', 'Copyright ©2003-2021 Accelebrate, Inc. Some outlines may contain content from our courseware partners; such \r\ncontent is protected by these partners’ copyrights. All trademarks are owned by their respective owners. \r\n \r\n \r\nSpring Boot and Spring Cloud \r\nCourse Number: SPRG-184 \r\nDuration: 5 Days \r\nOverview \r\nRapid advancements in cloud-based software delivery and virtualization have caused many \r\ndevelopers to question the wisdom of a “Big Server” approach to deploying web applications. \r\nSpring Boot is a technology stack that builds on the popular Spring Framework to allow the \r\ndeployment of Spring-based applications as stand-alone jar files that host their own web \r\nservers.  This approach works nicely with deployment automation and rapid scaling. \r\nCloud-based, highly-distributed applications face additional challenges in supporting a \r\ndynamic environment, especially around configuration, service discovery, service resilience, \r\nand monitoring. Spring Cloud embraces and extends the popular suite of open source cloud \r\ntools published by Netflix (Eureka, Hystrix, Ribbon, etc.). \r\nThis Spring Boot and Spring Cloud training introduces Spring Boot, Spring Cloud, and the \r\nNetflix OSS suite as a way to deploy highly resilient and scalable RESTful services and web \r\napplications. \r\nPrerequisites \r\nAll attendees must be comfortable programming in Java and have a basic understanding of \r\nSpring Dependency Injection using the Spring @Autowired annotation or the javax @Inject \r\nannotation. Spring Java Configuration experience is helpful but not required. \r\nMaterials \r\nAll Spring training attendees receive courseware covering the topics in the course. \r\nSoftware Needed on Each Student PC \r\n 64-bit Windows, Mac, or Linux environment with at least 8GB RAM \r\n Java 1.8 or later \r\n Eclipse or IntelliJ (we may be able to support other IDEs upon request) \r\n Related lab files that Accelebrate provides \r\nObjectives \r\n Use Spring Boot to build standalone web applications and RESTful services \r\n Understand the Configuration techniques that Spring Boot Provides \r\n Build Spring boot based Microservices for JSON and XML data exchange \r\n Monitor services using the Prometheus Actuator \r\n Understand the major components of Netflix OSS \r\n Register services with a Eureka Service \r\n Implement “client” load balancing with Ribbon to Eureka managed Services \r\n Create fault-tolerant services with Hystrix callbacks \r\nCopyright ©2003-2021 Accelebrate, Inc. Some outlines may contain content from our courseware partners; such \r\ncontent is protected by these partners’ copyrights. All trademarks are owned by their respective owners. \r\n Filter requests to your Microservices using Zuul \r\n Create producer and Consumer services using Kafka and Zookeeper \r\n Define Feign clients to your services \r\nOutline \r\n Introduction  \r\no What is Spring Boot? \r\no Spring starter Maven Dependencies \r\no Understanding @SpringBootApplication \r\no Example of Spring MVC-based RESTful Web Service \r\no Project Structure \r\no Externalized Configuration application.properties and YAML \r\no @ConfigurationPropetrties  \r\n Type Safe Properties \r\n JSR303 Validation of Properties \r\n Spring Environment Object \r\n @Value vs @ConfigurationProperties \r\no Logging \r\n Actuators  \r\no Exposing Information about your services \r\no Customize Health and Info Endpoints \r\no Custom Metrics and Custom Actuator \r\no Prometheus Monitoring \r\n Building Web Applications  \r\no Controllers and ModelAttributes \r\no Template Views \r\no Using Embedded and External Databases \r\no Spring Boot Initializers and Command Line Runners \r\no Active Profiles \r\no Form Submissions \r\n REST Services  \r\no What is REST? \r\no Restful Controllers \r\no JSON and XML Data Exchange \r\no Content Negotiation \r\no Angular JS Accessing your Services \r\n Java Clients using RestTemplate  \r\no ResponseEntity \r\no Headers \r\no Status codes \r\no RequestEntity \r\no Posting JSON to a Service \r\n Persistence with JPA Repositories  \r\no JPA, EntityManagers, Entity Classes, Annotation mappings \r\no Spring JPA Data, CrudRepository, PagingAndSortingRepository \r\no Spring Data Rest, Exposing Databases as Endpoints \r\no HATEOAS JSON \r\no @Projections and Excerpts  \r\n Restrict the data sent back to the client \r\n Introduction to Microservices  \r\no What are Microservices? \r\no Decentralized Governance, Scalability, Fault Tolerance \r\nCopyright ©2003-2021 Accelebrate, Inc. Some outlines may contain content from our courseware partners; such \r\ncontent is protected by these partners’ copyrights. All trademarks are owned by their respective owners. \r\no Cloud Computing \r\no Spring Cloud \r\no Service and Client Discovery \r\no Netflix OSS \r\n Core Microservice Patterns using Spring Cloud and Netflix OSS  \r\no Where are my Services?  \r\n Using Service Discovery \r\n Eureka Servers and Clients \r\no Scale Services  \r\n Load Balancing with Ribbon using Service Discovery \r\n A LoadBalanced RestTemplate \r\n Load Balancing with Ribbon without Service Discovery \r\no Circuit Breaker, when services fail  \r\n Hystrix \r\n Callbacks \r\no Gateway/Edge Services – Providing an API  \r\n Zuul services \r\n Filtering the Request and Response  \r\no Create Feign Clients to your Services \r\no Event Driven Services or Sagas  \r\n Keeping Services synchronized with each other \r\n Creating Message Queues with Zookeeper and Kafka \r\n Docker Images and Containers  \r\no Orchestration and Workflow \r\n Conclusion \r\n \r\n', 0, '2021-01-11 14:32:31', '2021-01-18 11:25:19', '10001');
INSERT INTO `mscode_file` (`id`, `name`, `original_filename`, `file_size`, `content_type`, `file_type`, `type`, `url`, `content`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (800587637328367616, 'file', '用户管理.xlsx', 12491, 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'other', 2, '/static/upload/20210118124926874.xlsx', '用户名昵称手机号角色所属机构状态rdd张部1.5688888888E10管理角色开发三组正常hrd人事总监1.9999999999E10管理角色行政部正常personnel人事经理1.5666666667E10行政角色行政部正常manager李总1.3333333339E10管理角色行政部正常attendance人事专员1.2111111113E10行政角色行政部正常test王雪红1.5011112222E10测试角色测试一组正常admin超级管理员1.2222222229E10开发角色,超级管理员开发三组正常', 0, '2021-01-11 14:32:15', '2021-01-18 12:50:40', '10001');
INSERT INTO `mscode_file` (`id`, `name`, `original_filename`, `file_size`, `content_type`, `file_type`, `type`, `url`, `content`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (801659644946075648, 'file', '20200221103500027.jpg', 13034, 'image/jpeg', NULL, 2, '/static/upload/20210121114913352.jpg', NULL, NULL, '2021-01-21 11:49:14', NULL, '10001');
INSERT INTO `mscode_file` (`id`, `name`, `original_filename`, `file_size`, `content_type`, `file_type`, `type`, `url`, `content`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (801660787122163712, 'file', '20200214115811030.png', 22241, 'image/png', NULL, 2, '/static/upload/20210121115345785.png', NULL, NULL, '2021-01-21 11:53:46', NULL, '10001');
INSERT INTO `mscode_file` (`id`, `name`, `original_filename`, `file_size`, `content_type`, `file_type`, `type`, `url`, `content`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (801660973856772096, 'file', 'MSCode微服务平台专业版.docx', 14785, 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', NULL, 2, '/static/upload/20210121115429387.docx', 'MSCode微服务平台专业版 3900元\n\n1、永久商业授权；不限制域名数、项目数、库表数、用户数；提供增值税电子普通发票或增值税专用发票，签订商业授权合同或发送商业授权书。\n2、一对一金牌服务：无限次即时响应的电话、QQ、微信、邮件和远程协助。\n3、根据企业项目需求进行专业定制培训。\n4、提供所有源码和详尽文档，包含Spring Cloud Hoxton.SR8、Spring Boot 2.3.3和Spring Cloud Alibaba阿里巴巴组件的微服务分布式版本，包含Spring Boot 2.3.3和Spring Cloud Alibaba阿里巴巴组件的单体式版本，免费持续升级。\n5、基于Vue的Web端，响应式布局，针对不同屏幕大小设计，适配电脑、平板和手机。\n6、基于React的Web端，响应式布局，针对不同屏幕大小设计，适配电脑、平板和手机。\n7、国际化方案支持简体中文、繁体中文和英文，8种主题皮肤满足多样化的品牌诉求。\n8、代码生成器智能生成前后端各层次基础代码，提高开发效率。\n9、图表报表：分析页、监控页，支持饼状图、柱状图、仪表盘、雷达图、标签云、水波图、迷你柱状图、迷你区域图、迷你进度条、带有时间轴的折线图、图表卡片、图表字段。\n10、权限管理：角色管理(授权菜单、授权按钮)、接口权限、数据权限，在线配置即时生效。\n11、系统管理：用户管理、菜单管理、机构管理、字典管理、区域管理、参数管理、应用管理。\n12、基础功能：账户密码登录、手机号登录、验证码、注册、找回密码、发送邮件、个人设置、我的消息、消息通知、短信服务、上传下载、租户管理、SSO单点登录。\n13、支持MySQL、Oracle、SQL Server、PostgreSQL和DB2分布式数据库。\n14、完整的SaaS多租户架构方案。\n15、ELK7.6.2日志集中分析平台，Elasticsearch分布式大数据搜索分析引擎，Logstash分布式实时数据采集日志组件，Kibana分布式数据可视化日志组件。\n16、Spring Security + OAuth2认证授权和安全保护。\n17、Spring Cloud Gateway微服务网关，Ribbon负载均衡， Feign服务调用，Bus消息总线，Stream事件驱动，Sleuth链路跟踪，Turbine集群聚合监控。\n18、阿里巴巴Seata高性能分布式事务，对业务代码零侵入。\n19、阿里巴巴Sentinel流量控制，阿里巴巴Sentinel Dashboard查看实时监控和机器列表，配置簇点链路、流控规则、降级规则、热点规则、系统规则、授权规则和集群流控。\n20、阿里巴巴Nacos配置中心、服务注册&发现，阿里巴巴Nacos Dashboard配置管理、服务管理、集群管理、权限控制、命名空间。\n21、基于Twitter Snowflake算法优化而成分布式ID，更适合分库分表。\n22、RabbitMQ消息队列，实现数据集成、系统解耦、异步处理、事件驱动和流量削峰。\n23、Redis分布式缓存，实现高性能数据读取，实现轻量级分布式定时任务。\n24、MongoDB高性能数据存储，实现统计服务。\n25、Swagger实现接口文档和协同开发。\n26、Web端适配电脑、平板和手机，另外提供多端统一开发移动版：一处代码，10端运行，支持H5、Android、iOS、QQ小程序、360小程序、快应用、微信小程序、百度小程序、支付宝小程序、字节跳动小程序。\n', NULL, '2021-01-21 11:54:31', NULL, '10001');
COMMIT;

-- ----------------------------
-- Table structure for mscode_file_sysuser
-- ----------------------------
DROP TABLE IF EXISTS `mscode_file_sysuser`;
CREATE TABLE `mscode_file_sysuser` (
  `id` bigint(20) NOT NULL COMMENT '文件与系统用户关联主键ID',
  `file_id` bigint(20) NOT NULL COMMENT '文件主键ID',
  `sysuser_id` bigint(20) NOT NULL COMMENT '系统用户主键ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='文件与系统用户关联表';

-- ----------------------------
-- Records of mscode_file_sysuser
-- ----------------------------
BEGIN;
INSERT INTO `mscode_file_sysuser` (`id`, `file_id`, `sysuser_id`) VALUES (681335583775576064, 681335583645552640, 653917974152592329);
INSERT INTO `mscode_file_sysuser` (`id`, `file_id`, `sysuser_id`) VALUES (798065279526948865, 798065279526948864, 653917974152592329);
INSERT INTO `mscode_file_sysuser` (`id`, `file_id`, `sysuser_id`) VALUES (798075650501431297, 798075650501431296, 653917974152592329);
INSERT INTO `mscode_file_sysuser` (`id`, `file_id`, `sysuser_id`) VALUES (798076789640843265, 798076789640843264, 653917974152592329);
INSERT INTO `mscode_file_sysuser` (`id`, `file_id`, `sysuser_id`) VALUES (798076828920500225, 798076828920500224, 653917974152592329);
INSERT INTO `mscode_file_sysuser` (`id`, `file_id`, `sysuser_id`) VALUES (798076858771361793, 798076858771361792, 653917974152592329);
INSERT INTO `mscode_file_sysuser` (`id`, `file_id`, `sysuser_id`) VALUES (800587637328367617, 800587637328367616, 653917974152592329);
INSERT INTO `mscode_file_sysuser` (`id`, `file_id`, `sysuser_id`) VALUES (801659644950269952, 801659644946075648, 653917974152592329);
INSERT INTO `mscode_file_sysuser` (`id`, `file_id`, `sysuser_id`) VALUES (801660787122163713, 801660787122163712, 653917974152592329);
INSERT INTO `mscode_file_sysuser` (`id`, `file_id`, `sysuser_id`) VALUES (801660973856772097, 801660973856772096, 653917974152592329);
COMMIT;

-- ----------------------------
-- Table structure for mscode_generator
-- ----------------------------
DROP TABLE IF EXISTS `mscode_generator`;
CREATE TABLE `mscode_generator` (
  `id` bigint(20) NOT NULL COMMENT '代码生成器主键ID',
  `module_name` varchar(64) NOT NULL COMMENT '模块名',
  `service_name` varchar(64) NOT NULL COMMENT '服务名',
  `package_name` varchar(256) NOT NULL COMMENT '包名',
  `entity_name` varchar(64) NOT NULL COMMENT '实体名',
  `table_name` varchar(64) NOT NULL COMMENT '表名',
  `id_name` varchar(32) NOT NULL COMMENT '主键名',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `tenant_code` varchar(64) DEFAULT '10001' COMMENT '租户编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='代码生成器表';

-- ----------------------------
-- Records of mscode_generator
-- ----------------------------
BEGIN;
INSERT INTO `mscode_generator` (`id`, `module_name`, `service_name`, `package_name`, `entity_name`, `table_name`, `id_name`, `create_time`, `update_time`, `tenant_code`) VALUES (693352447519150080, '账户管理', 'ctf-account-service', 'com.ctf.account', 'SysUserDetail', 'mscode_sys_user', 'id', '2020-03-28 14:55:07', '2022-07-22 00:19:35', '10001');
INSERT INTO `mscode_generator` (`id`, `module_name`, `service_name`, `package_name`, `entity_name`, `table_name`, `id_name`, `create_time`, `update_time`, `tenant_code`) VALUES (693353308081278976, '系统管理', 'ctf-admin-service', 'com.ctf.admin', 'SysDict', 'mscode_sys_dict', 'id', '2020-03-28 14:58:32', '2022-07-22 00:19:17', '10001');
COMMIT;

-- ----------------------------
-- Table structure for mscode_generator_field
-- ----------------------------
DROP TABLE IF EXISTS `mscode_generator_field`;
CREATE TABLE `mscode_generator_field` (
  `id` bigint(20) NOT NULL COMMENT '代码生成器实体字段主键ID',
  `field_type` varchar(32) NOT NULL COMMENT '类型',
  `field` varchar(64) NOT NULL COMMENT '实体字段',
  `generator_id` bigint(20) NOT NULL COMMENT '代码生成器主键ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='代码生成器实体字段表';

-- ----------------------------
-- Records of mscode_generator_field
-- ----------------------------
BEGIN;
INSERT INTO `mscode_generator_field` (`id`, `field_type`, `field`, `generator_id`) VALUES (999712181905240064, 'String', 'dictType', 693353308081278976);
INSERT INTO `mscode_generator_field` (`id`, `field_type`, `field`, `generator_id`) VALUES (999712181917822976, 'String', 'dictName', 693353308081278976);
INSERT INTO `mscode_generator_field` (`id`, `field_type`, `field`, `generator_id`) VALUES (999712181922017280, 'String', 'dictValue', 693353308081278976);
INSERT INTO `mscode_generator_field` (`id`, `field_type`, `field`, `generator_id`) VALUES (999712181926211584, 'long', 'dictSequence', 693353308081278976);
INSERT INTO `mscode_generator_field` (`id`, `field_type`, `field`, `generator_id`) VALUES (999712181930405888, 'String', 'tenantCode', 693353308081278976);
INSERT INTO `mscode_generator_field` (`id`, `field_type`, `field`, `generator_id`) VALUES (999712256823898112, 'String', 'username', 693352447519150080);
INSERT INTO `mscode_generator_field` (`id`, `field_type`, `field`, `generator_id`) VALUES (999712256840675328, 'String', 'password', 693352447519150080);
INSERT INTO `mscode_generator_field` (`id`, `field_type`, `field`, `generator_id`) VALUES (999712256844869632, 'String', 'email', 693352447519150080);
INSERT INTO `mscode_generator_field` (`id`, `field_type`, `field`, `generator_id`) VALUES (999712256849063936, 'String', 'mobile', 693352447519150080);
INSERT INTO `mscode_generator_field` (`id`, `field_type`, `field`, `generator_id`) VALUES (999712256853258240, 'String', 'prefix', 693352447519150080);
INSERT INTO `mscode_generator_field` (`id`, `field_type`, `field`, `generator_id`) VALUES (999712256861646848, 'long', 'roleId', 693352447519150080);
INSERT INTO `mscode_generator_field` (`id`, `field_type`, `field`, `generator_id`) VALUES (999712256865841152, 'long', 'orgId', 693352447519150080);
INSERT INTO `mscode_generator_field` (`id`, `field_type`, `field`, `generator_id`) VALUES (999712256870035456, 'short', 'status', 693352447519150080);
INSERT INTO `mscode_generator_field` (`id`, `field_type`, `field`, `generator_id`) VALUES (999712256878424064, 'String', 'nickname', 693352447519150080);
INSERT INTO `mscode_generator_field` (`id`, `field_type`, `field`, `generator_id`) VALUES (999712256882618368, 'String', 'phone', 693352447519150080);
INSERT INTO `mscode_generator_field` (`id`, `field_type`, `field`, `generator_id`) VALUES (999712256886812672, 'String', 'provinceRegionCode', 693352447519150080);
INSERT INTO `mscode_generator_field` (`id`, `field_type`, `field`, `generator_id`) VALUES (999712256895201280, 'String', 'cityRegionCode', 693352447519150080);
INSERT INTO `mscode_generator_field` (`id`, `field_type`, `field`, `generator_id`) VALUES (999712256899395584, 'String', 'address', 693352447519150080);
INSERT INTO `mscode_generator_field` (`id`, `field_type`, `field`, `generator_id`) VALUES (999712256907784192, 'String', 'profile', 693352447519150080);
INSERT INTO `mscode_generator_field` (`id`, `field_type`, `field`, `generator_id`) VALUES (999712256911978496, 'short', 'notifyMessage', 693352447519150080);
INSERT INTO `mscode_generator_field` (`id`, `field_type`, `field`, `generator_id`) VALUES (999712256916172800, 'short', 'notifyTodo', 693352447519150080);
COMMIT;

-- ----------------------------
-- Table structure for mscode_notification
-- ----------------------------
DROP TABLE IF EXISTS `mscode_notification`;
CREATE TABLE `mscode_notification` (
  `id` bigint(20) NOT NULL COMMENT '消息通知主键ID',
  `title` varchar(100) NOT NULL COMMENT '标题',
  `content` longtext NOT NULL COMMENT '内容',
  `type` varchar(32) NOT NULL COMMENT '类型',
  `priority` varchar(32) DEFAULT NULL COMMENT '优先级',
  `publisher` varchar(64) NOT NULL COMMENT '发布者',
  `start_time` timestamp NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` timestamp NULL DEFAULT NULL COMMENT '结束时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `tenant_code` varchar(64) DEFAULT '10001' COMMENT '租户编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='消息通知表';

-- ----------------------------
-- Records of mscode_notification
-- ----------------------------
BEGIN;
INSERT INTO `mscode_notification` (`id`, `title`, `content`, `type`, `priority`, `publisher`, `start_time`, `end_time`, `create_time`, `update_time`, `tenant_code`) VALUES (99, '通知公告标题测试', '<p>通知公告内容测试</p><p><img src=\"data:image/png;base64,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\"></p>', 'notification', 'high', 'admin', NULL, NULL, '2019-10-15 05:36:45', '2019-11-12 14:00:14', '10001');
INSERT INTO `mscode_notification` (`id`, `title`, `content`, `type`, `priority`, `publisher`, `start_time`, `end_time`, `create_time`, `update_time`, `tenant_code`) VALUES (100, '系统消息标题测试', '<p>系统消息内容测试</p>', 'message', 'medium', 'admin', NULL, NULL, '2019-10-15 05:38:00', '2019-10-27 16:45:36', '10001');
INSERT INTO `mscode_notification` (`id`, `title`, `content`, `type`, `priority`, `publisher`, `start_time`, `end_time`, `create_time`, `update_time`, `tenant_code`) VALUES (101, 'test系统消息标题测试', '<p>test系统消息内容测试</p>', 'message', 'low', 'test', NULL, NULL, '2019-10-15 05:39:05', '2019-10-29 16:52:26', '10001');
INSERT INTO `mscode_notification` (`id`, `title`, `content`, `type`, `priority`, `publisher`, `start_time`, `end_time`, `create_time`, `update_time`, `tenant_code`) VALUES (102, 'admin通知公告标题非时间测试', '<p>admin通知公告内容非时间测试</p>', 'notification', 'medium', 'admin', NULL, NULL, '2019-10-15 05:41:00', '2020-02-11 18:27:55', '10001');
COMMIT;

-- ----------------------------
-- Table structure for mscode_notification_sysuser
-- ----------------------------
DROP TABLE IF EXISTS `mscode_notification_sysuser`;
CREATE TABLE `mscode_notification_sysuser` (
  `id` bigint(20) NOT NULL COMMENT '消息通知与系统用户关联主键ID',
  `notification_id` bigint(20) NOT NULL COMMENT '消息通知主键ID',
  `sysuser_id` bigint(20) NOT NULL COMMENT '系统用户主键ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='消息通知与系统用户关联表';

-- ----------------------------
-- Records of mscode_notification_sysuser
-- ----------------------------
BEGIN;
INSERT INTO `mscode_notification_sysuser` (`id`, `notification_id`, `sysuser_id`) VALUES (676736167949291520, 102, 653917974152592329);
INSERT INTO `mscode_notification_sysuser` (`id`, `notification_id`, `sysuser_id`) VALUES (676736282084691968, 101, 653918847061381120);
INSERT INTO `mscode_notification_sysuser` (`id`, `notification_id`, `sysuser_id`) VALUES (676736334609960960, 100, 653917974152592329);
INSERT INTO `mscode_notification_sysuser` (`id`, `notification_id`, `sysuser_id`) VALUES (676736334723207168, 100, 653918847061381120);
INSERT INTO `mscode_notification_sysuser` (`id`, `notification_id`, `sysuser_id`) VALUES (676736334832259072, 100, 656413611073654784);
INSERT INTO `mscode_notification_sysuser` (`id`, `notification_id`, `sysuser_id`) VALUES (676736334932922368, 100, 656414601122336768);
INSERT INTO `mscode_notification_sysuser` (`id`, `notification_id`, `sysuser_id`) VALUES (676736361227014144, 99, 653917974152592329);
INSERT INTO `mscode_notification_sysuser` (`id`, `notification_id`, `sysuser_id`) VALUES (676736361331871744, 99, 653918847061381120);
INSERT INTO `mscode_notification_sysuser` (`id`, `notification_id`, `sysuser_id`) VALUES (676736361432535040, 99, 656413611073654784);
INSERT INTO `mscode_notification_sysuser` (`id`, `notification_id`, `sysuser_id`) VALUES (676736361541586944, 99, 656414601122336768);
COMMIT;

-- ----------------------------
-- Table structure for mscode_product_statistics
-- ----------------------------
DROP TABLE IF EXISTS `mscode_product_statistics`;
CREATE TABLE `mscode_product_statistics` (
  `id` bigint(20) NOT NULL COMMENT '商品统计主键ID',
  `name` varchar(256) DEFAULT NULL COMMENT '店铺名称',
  `keyword` varchar(38) DEFAULT NULL COMMENT '搜索关键字',
  `visits` bigint(20) DEFAULT NULL COMMENT '访问量',
  `flow` bigint(20) DEFAULT NULL COMMENT '客流量',
  `payment_quantity` bigint(20) DEFAULT NULL COMMENT '支付笔数',
  `user_count` bigint(20) DEFAULT NULL COMMENT '用户数',
  `gain` decimal(10,2) DEFAULT NULL COMMENT '涨幅',
  `cvr` decimal(10,2) DEFAULT NULL COMMENT '转化率',
  `sales` decimal(10,2) DEFAULT NULL COMMENT '销售额',
  `sales_type` varchar(256) DEFAULT NULL COMMENT '销售类别',
  `channel` varchar(32) DEFAULT NULL COMMENT '渠道',
  `time` timestamp NULL DEFAULT NULL COMMENT '时间',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态',
  `tenant_code` varchar(64) DEFAULT '10001' COMMENT '租户编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='商品统计表';

-- ----------------------------
-- Records of mscode_product_statistics
-- ----------------------------
BEGIN;
INSERT INTO `mscode_product_statistics` (`id`, `name`, `keyword`, `visits`, `flow`, `payment_quantity`, `user_count`, `gain`, `cvr`, `sales`, `sales_type`, `channel`, `time`, `status`, `tenant_code`) VALUES (1, '店铺1', '搜索关键词-1', 7, 46, 38, 234, 23.00, 0.10, 55.33, '家用电器', '线上', '2021-02-07 10:51:05', 1, '10001');
INSERT INTO `mscode_product_statistics` (`id`, `name`, `keyword`, `visits`, `flow`, `payment_quantity`, `user_count`, `gain`, `cvr`, `sales`, `sales_type`, `channel`, `time`, `status`, `tenant_code`) VALUES (2, '店铺2', '搜索关键词-2', 18, 67, 32, 789, 66.00, 0.80, 32.33, '家用电器', '线上', '2021-02-08 11:51:05', 0, '10001');
INSERT INTO `mscode_product_statistics` (`id`, `name`, `keyword`, `visits`, `flow`, `payment_quantity`, `user_count`, `gain`, `cvr`, `sales`, `sales_type`, `channel`, `time`, `status`, `tenant_code`) VALUES (3, '店铺3', '搜索关键词-3', 9, 23, 28, 345, 76.00, 0.60, 66.33, '食用酒水', '线上', '2021-02-20 12:51:05', 1, '10001');
INSERT INTO `mscode_product_statistics` (`id`, `name`, `keyword`, `visits`, `flow`, `payment_quantity`, `user_count`, `gain`, `cvr`, `sales`, `sales_type`, `channel`, `time`, `status`, `tenant_code`) VALUES (4, '店铺4', '搜索关键词-4', 10, 34, 22, 123, 32.00, 0.30, 46.99, '食用酒水', '线上', '2021-02-10 13:51:05', 1, '10001');
INSERT INTO `mscode_product_statistics` (`id`, `name`, `keyword`, `visits`, `flow`, `payment_quantity`, `user_count`, `gain`, `cvr`, `sales`, `sales_type`, `channel`, `time`, `status`, `tenant_code`) VALUES (5, '店铺5', '搜索关键词-5', 21, 56, 62, 987, 76.00, 0.50, 33.34, '个护健康', '线上', '2021-02-21 14:51:05', 1, '10001');
INSERT INTO `mscode_product_statistics` (`id`, `name`, `keyword`, `visits`, `flow`, `payment_quantity`, `user_count`, `gain`, `cvr`, `sales`, `sales_type`, `channel`, `time`, `status`, `tenant_code`) VALUES (6, '店铺6', '搜索关键词-6', 12, 89, 73, 876, 99.00, 0.40, 34.44, '个护健康', '线上', '2021-02-22 15:51:05', 1, '10001');
INSERT INTO `mscode_product_statistics` (`id`, `name`, `keyword`, `visits`, `flow`, `payment_quantity`, `user_count`, `gain`, `cvr`, `sales`, `sales_type`, `channel`, `time`, `status`, `tenant_code`) VALUES (7, '店铺7', '搜索关键词-7', 13, 22, 14, 456, 21.00, 0.30, 58.33, '服饰箱包', '线上', '2021-02-23 16:51:05', 0, '10001');
INSERT INTO `mscode_product_statistics` (`id`, `name`, `keyword`, `visits`, `flow`, `payment_quantity`, `user_count`, `gain`, `cvr`, `sales`, `sales_type`, `channel`, `time`, `status`, `tenant_code`) VALUES (8, '店铺8', '搜索关键词-8', 14, 33, 45, 566, 55.00, 0.20, 33.11, '服饰箱包', '线上', '2021-02-24 17:51:05', 1, '10001');
INSERT INTO `mscode_product_statistics` (`id`, `name`, `keyword`, `visits`, `flow`, `payment_quantity`, `user_count`, `gain`, `cvr`, `sales`, `sales_type`, `channel`, `time`, `status`, `tenant_code`) VALUES (9, '店铺9', '搜索关键词-9', 15, 44, 56, 777, 25.00, 0.70, 44.49, '母婴产品', '线上', '2021-09-15 18:51:05', 1, '10001');
INSERT INTO `mscode_product_statistics` (`id`, `name`, `keyword`, `visits`, `flow`, `payment_quantity`, `user_count`, `gain`, `cvr`, `sales`, `sales_type`, `channel`, `time`, `status`, `tenant_code`) VALUES (10, '店铺10', '搜索关键词-10', 16, 55, 67, 999, 97.00, 0.80, 88.88, '母婴产品', '门店', '2021-12-16 19:51:05', 1, '10001');
INSERT INTO `mscode_product_statistics` (`id`, `name`, `keyword`, `visits`, `flow`, `payment_quantity`, `user_count`, `gain`, `cvr`, `sales`, `sales_type`, `channel`, `time`, `status`, `tenant_code`) VALUES (11, '店铺11', '搜索关键词-11', 17, 78, 68, 334, 32.00, 0.90, 75.98, '其他', '门店', '2021-01-14 20:24:09', 1, '10001');
INSERT INTO `mscode_product_statistics` (`id`, `name`, `keyword`, `visits`, `flow`, `payment_quantity`, `user_count`, `gain`, `cvr`, `sales`, `sales_type`, `channel`, `time`, `status`, `tenant_code`) VALUES (12, '店铺12', '搜索关键词-12', 18, 87, 79, 256, 11.00, 1.00, 45.22, '其他', '门店', '2021-02-18 21:24:09', 1, '10001');
INSERT INTO `mscode_product_statistics` (`id`, `name`, `keyword`, `visits`, `flow`, `payment_quantity`, `user_count`, `gain`, `cvr`, `sales`, `sales_type`, `channel`, `time`, `status`, `tenant_code`) VALUES (13, '店铺13', '搜索关键词-13', 7, 46, 28, 234, 23.00, 0.10, 555.33, '家用电器', '线上', '2021-02-19 10:51:05', 1, '10001');
INSERT INTO `mscode_product_statistics` (`id`, `name`, `keyword`, `visits`, `flow`, `payment_quantity`, `user_count`, `gain`, `cvr`, `sales`, `sales_type`, `channel`, `time`, `status`, `tenant_code`) VALUES (14, '店铺14', '搜索关键词-14', 18, 67, 79, 789, 66.00, 0.80, 232.33, '家用电器', '线上', '2021-02-09 11:51:05', 0, '10001');
INSERT INTO `mscode_product_statistics` (`id`, `name`, `keyword`, `visits`, `flow`, `payment_quantity`, `user_count`, `gain`, `cvr`, `sales`, `sales_type`, `channel`, `time`, `status`, `tenant_code`) VALUES (15, '店铺15', '搜索关键词-15', 9, 23, 30, 345, 76.00, 0.60, 566.33, '食用酒水', '线上', '2021-03-09 12:51:05', 1, '10001');
INSERT INTO `mscode_product_statistics` (`id`, `name`, `keyword`, `visits`, `flow`, `payment_quantity`, `user_count`, `gain`, `cvr`, `sales`, `sales_type`, `channel`, `time`, `status`, `tenant_code`) VALUES (16, '店铺16', '搜索关键词-16', 10, 34, 21, 123, 32.00, 0.30, 646.99, '食用酒水', '线上', '2021-04-10 13:51:05', 1, '10001');
INSERT INTO `mscode_product_statistics` (`id`, `name`, `keyword`, `visits`, `flow`, `payment_quantity`, `user_count`, `gain`, `cvr`, `sales`, `sales_type`, `channel`, `time`, `status`, `tenant_code`) VALUES (17, '店铺17', '搜索关键词-17', 21, 56, 22, 987, 76.00, 0.50, 333.34, '个护健康', '线上', '2021-05-11 14:51:05', 1, '10001');
INSERT INTO `mscode_product_statistics` (`id`, `name`, `keyword`, `visits`, `flow`, `payment_quantity`, `user_count`, `gain`, `cvr`, `sales`, `sales_type`, `channel`, `time`, `status`, `tenant_code`) VALUES (18, '店铺18', '搜索关键词-18', 12, 89, 53, 876, 99.00, 0.40, 434.44, '个护健康', '线上', '2021-06-12 15:51:05', 1, '10001');
INSERT INTO `mscode_product_statistics` (`id`, `name`, `keyword`, `visits`, `flow`, `payment_quantity`, `user_count`, `gain`, `cvr`, `sales`, `sales_type`, `channel`, `time`, `status`, `tenant_code`) VALUES (19, '店铺19', '搜索关键词-19', 13, 22, 44, 456, 21.00, 0.30, 555.33, '服饰箱包', '线上', '2021-07-13 16:51:05', 0, '10001');
INSERT INTO `mscode_product_statistics` (`id`, `name`, `keyword`, `visits`, `flow`, `payment_quantity`, `user_count`, `gain`, `cvr`, `sales`, `sales_type`, `channel`, `time`, `status`, `tenant_code`) VALUES (20, '店铺20', '搜索关键词-20', 14, 33, 55, 566, 55.00, 0.20, 633.11, '服饰箱包', '线上', '2021-08-14 17:51:05', 1, '10001');
INSERT INTO `mscode_product_statistics` (`id`, `name`, `keyword`, `visits`, `flow`, `payment_quantity`, `user_count`, `gain`, `cvr`, `sales`, `sales_type`, `channel`, `time`, `status`, `tenant_code`) VALUES (21, '店铺21', '搜索关键词-21', 15, 44, 26, 777, 25.00, 0.70, 444.49, '母婴产品', '线上', '2021-10-15 18:51:05', 1, '10001');
INSERT INTO `mscode_product_statistics` (`id`, `name`, `keyword`, `visits`, `flow`, `payment_quantity`, `user_count`, `gain`, `cvr`, `sales`, `sales_type`, `channel`, `time`, `status`, `tenant_code`) VALUES (22, '店铺22', '搜索关键词-22', 16, 55, 17, 999, 97.00, 0.80, 888.88, '母婴产品', '门店', '2021-11-16 19:51:05', 1, '10001');
INSERT INTO `mscode_product_statistics` (`id`, `name`, `keyword`, `visits`, `flow`, `payment_quantity`, `user_count`, `gain`, `cvr`, `sales`, `sales_type`, `channel`, `time`, `status`, `tenant_code`) VALUES (23, '店铺23', '搜索关键词-23', 17, 78, 18, 334, 32.00, 0.90, 775.98, '其他', '门店', '2021-02-17 20:24:09', 1, '10001');
COMMIT;

-- ----------------------------
-- Table structure for mscode_sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `mscode_sys_dict`;
CREATE TABLE `mscode_sys_dict` (
  `id` bigint(20) NOT NULL COMMENT '字典主键ID',
  `dict_name` varchar(32) NOT NULL COMMENT '字典名称',
  `dict_value` varchar(32) NOT NULL COMMENT '字典值',
  `dict_type` varchar(32) NOT NULL COMMENT '字典类型',
  `dict_sequence` bigint(20) DEFAULT NULL COMMENT '排序',
  `parent_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '上级字典ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `tenant_code` varchar(64) DEFAULT '10001' COMMENT '租户编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='字典表';

-- ----------------------------
-- Records of mscode_sys_dict
-- ----------------------------
BEGIN;
INSERT INTO `mscode_sys_dict` (`id`, `dict_name`, `dict_value`, `dict_type`, `dict_sequence`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (1, '性别', 'gender', 'sex', 1, 0, '2019-08-13 12:41:19', '2019-09-24 18:12:39', '10001');
INSERT INTO `mscode_sys_dict` (`id`, `dict_name`, `dict_value`, `dict_type`, `dict_sequence`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (2, '男', 'male', 'sex', 1, 1, '2019-08-25 21:33:29', '2019-08-28 10:05:39', '10001');
INSERT INTO `mscode_sys_dict` (`id`, `dict_name`, `dict_value`, `dict_type`, `dict_sequence`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (3, '女', 'female', 'sex', 2, 1, '2019-08-25 21:34:14', '2019-08-28 10:05:54', '10001');
INSERT INTO `mscode_sys_dict` (`id`, `dict_name`, `dict_value`, `dict_type`, `dict_sequence`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (38, '机构', 'organization', 'org', 2, 0, '2019-08-28 17:39:10', NULL, '10001');
INSERT INTO `mscode_sys_dict` (`id`, `dict_name`, `dict_value`, `dict_type`, `dict_sequence`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (39, '公司', 'company', 'org', 1, 38, '2019-08-28 17:39:50', NULL, '10001');
INSERT INTO `mscode_sys_dict` (`id`, `dict_name`, `dict_value`, `dict_type`, `dict_sequence`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (40, '部门', 'department', 'org', 2, 38, '2019-08-28 17:40:32', NULL, '10001');
INSERT INTO `mscode_sys_dict` (`id`, `dict_name`, `dict_value`, `dict_type`, `dict_sequence`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (41, '小组', 'team', 'org', 3, 38, '2019-08-28 17:42:00', NULL, '10001');
INSERT INTO `mscode_sys_dict` (`id`, `dict_name`, `dict_value`, `dict_type`, `dict_sequence`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (45, '区域类型', 'regiontype', 'region', 4, 0, '2019-09-17 14:43:40', NULL, '10001');
INSERT INTO `mscode_sys_dict` (`id`, `dict_name`, `dict_value`, `dict_type`, `dict_sequence`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (46, '省份', 'province', 'region', 1, 45, '2019-09-17 14:44:38', NULL, '10001');
INSERT INTO `mscode_sys_dict` (`id`, `dict_name`, `dict_value`, `dict_type`, `dict_sequence`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (47, '地市', 'city', 'region', 2, 45, '2019-09-17 14:45:06', '2019-10-07 14:12:50', '10001');
INSERT INTO `mscode_sys_dict` (`id`, `dict_name`, `dict_value`, `dict_type`, `dict_sequence`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (53, '消息通知类型', 'notificationtype', 'notification', 5, 0, '2019-10-07 15:20:03', NULL, '10001');
INSERT INTO `mscode_sys_dict` (`id`, `dict_name`, `dict_value`, `dict_type`, `dict_sequence`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (54, '系统消息', 'message', 'notification', 1, 53, '2019-10-07 15:25:04', NULL, '10001');
INSERT INTO `mscode_sys_dict` (`id`, `dict_name`, `dict_value`, `dict_type`, `dict_sequence`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (55, '通知公告', 'notification', 'notification', 2, 53, '2019-10-07 15:26:36', NULL, '10001');
INSERT INTO `mscode_sys_dict` (`id`, `dict_name`, `dict_value`, `dict_type`, `dict_sequence`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (56, '消息通知优先级', 'notificationpriority', 'priority', 6, 0, '2019-10-07 15:29:43', '2019-10-07 15:32:40', '10001');
INSERT INTO `mscode_sys_dict` (`id`, `dict_name`, `dict_value`, `dict_type`, `dict_sequence`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (57, '高', 'high', 'priority', 1, 56, '2019-10-07 15:32:14', NULL, '10001');
INSERT INTO `mscode_sys_dict` (`id`, `dict_name`, `dict_value`, `dict_type`, `dict_sequence`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (58, '中', 'medium', 'priority', 2, 56, '2019-10-07 15:34:06', NULL, '10001');
INSERT INTO `mscode_sys_dict` (`id`, `dict_name`, `dict_value`, `dict_type`, `dict_sequence`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (59, '低', 'low', 'priority', 3, 56, '2019-10-07 15:34:46', NULL, '10001');
INSERT INTO `mscode_sys_dict` (`id`, `dict_name`, `dict_value`, `dict_type`, `dict_sequence`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (690409019042877440, '按钮类型', 'buttontype', 'button', 3, 0, '2020-03-20 11:59:00', NULL, '10001');
INSERT INTO `mscode_sys_dict` (`id`, `dict_name`, `dict_value`, `dict_type`, `dict_sequence`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (690409184067768320, '查看', 'view', 'button', 1, 690409019042877440, '2020-03-20 11:59:39', NULL, '10001');
INSERT INTO `mscode_sys_dict` (`id`, `dict_name`, `dict_value`, `dict_type`, `dict_sequence`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (690409389072764928, '新增', 'add', 'button', 2, 690409019042877440, '2020-03-20 12:00:28', NULL, '10001');
INSERT INTO `mscode_sys_dict` (`id`, `dict_name`, `dict_value`, `dict_type`, `dict_sequence`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (690409525698023424, '编辑', 'update', 'button', 3, 690409019042877440, '2020-03-20 12:01:01', NULL, '10001');
INSERT INTO `mscode_sys_dict` (`id`, `dict_name`, `dict_value`, `dict_type`, `dict_sequence`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (690409681893904384, '删除', 'delete', 'button', 4, 690409019042877440, '2020-03-20 12:01:38', '2020-03-20 12:01:59', '10001');
INSERT INTO `mscode_sys_dict` (`id`, `dict_name`, `dict_value`, `dict_type`, `dict_sequence`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (690409931979280384, '导出', 'export', 'button', 5, 690409019042877440, '2020-03-20 12:02:38', NULL, '10001');
INSERT INTO `mscode_sys_dict` (`id`, `dict_name`, `dict_value`, `dict_type`, `dict_sequence`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (690412734541910016, '授权', 'authorize', 'button', 6, 690409019042877440, '2020-03-20 12:13:46', NULL, '10001');
INSERT INTO `mscode_sys_dict` (`id`, `dict_name`, `dict_value`, `dict_type`, `dict_sequence`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (690413233668280320, '上传', 'upload', 'button', 7, 690409019042877440, '2020-03-20 12:15:45', NULL, '10001');
INSERT INTO `mscode_sys_dict` (`id`, `dict_name`, `dict_value`, `dict_type`, `dict_sequence`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (690433305002561536, '下载', 'download', 'button', 8, 690409019042877440, '2020-03-20 13:35:30', NULL, '10001');
INSERT INTO `mscode_sys_dict` (`id`, `dict_name`, `dict_value`, `dict_type`, `dict_sequence`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (690436655534231552, '生成', 'generate', 'button', 9, 690409019042877440, '2020-03-20 13:48:49', NULL, '10001');
INSERT INTO `mscode_sys_dict` (`id`, `dict_name`, `dict_value`, `dict_type`, `dict_sequence`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (690437022095429632, '预览', 'preview', 'button', 10, 690409019042877440, '2020-03-20 13:50:17', NULL, '10001');
INSERT INTO `mscode_sys_dict` (`id`, `dict_name`, `dict_value`, `dict_type`, `dict_sequence`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (690440262862163968, '发起', 'start', 'button', 11, 690409019042877440, '2020-03-20 14:03:09', '2020-03-20 14:03:26', '10001');
INSERT INTO `mscode_sys_dict` (`id`, `dict_name`, `dict_value`, `dict_type`, `dict_sequence`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (690440661547536384, '跟踪', 'track', 'button', 12, 690409019042877440, '2020-03-20 14:04:45', NULL, '10001');
INSERT INTO `mscode_sys_dict` (`id`, `dict_name`, `dict_value`, `dict_type`, `dict_sequence`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (690440905299513344, '签收', 'assign', 'button', 13, 690409019042877440, '2020-03-20 14:05:42', '2020-03-20 14:05:52', '10001');
INSERT INTO `mscode_sys_dict` (`id`, `dict_name`, `dict_value`, `dict_type`, `dict_sequence`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (690441553252372480, '通过', 'complete', 'button', 14, 690409019042877440, '2020-03-20 14:08:17', NULL, '10001');
INSERT INTO `mscode_sys_dict` (`id`, `dict_name`, `dict_value`, `dict_type`, `dict_sequence`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (690441876436078592, '委派', 'delegate', 'button', 15, 690409019042877440, '2020-03-20 14:09:34', NULL, '10001');
INSERT INTO `mscode_sys_dict` (`id`, `dict_name`, `dict_value`, `dict_type`, `dict_sequence`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (690442190606225408, '回退', 'regress', 'button', 16, 690409019042877440, '2020-03-20 14:10:49', NULL, '10001');
INSERT INTO `mscode_sys_dict` (`id`, `dict_name`, `dict_value`, `dict_type`, `dict_sequence`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (690442344885309440, '驳回', 'reject', 'button', 17, 690409019042877440, '2020-03-20 14:11:26', NULL, '10001');
INSERT INTO `mscode_sys_dict` (`id`, `dict_name`, `dict_value`, `dict_type`, `dict_sequence`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (690442513152397312, '终止', 'terminate', 'button', 18, 690409019042877440, '2020-03-20 14:12:06', NULL, '10001');
INSERT INTO `mscode_sys_dict` (`id`, `dict_name`, `dict_value`, `dict_type`, `dict_sequence`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (690442893357666304, '流程设计', 'design', 'button', 19, 690409019042877440, '2020-03-20 14:13:36', NULL, '10001');
INSERT INTO `mscode_sys_dict` (`id`, `dict_name`, `dict_value`, `dict_type`, `dict_sequence`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (690443118273024000, '部署', 'deploy', 'button', 20, 690409019042877440, '2020-03-20 14:14:30', NULL, '10001');
INSERT INTO `mscode_sys_dict` (`id`, `dict_name`, `dict_value`, `dict_type`, `dict_sequence`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (690443434502574080, '挂起', 'suspend', 'button', 21, 690409019042877440, '2020-03-20 14:15:46', NULL, '10001');
INSERT INTO `mscode_sys_dict` (`id`, `dict_name`, `dict_value`, `dict_type`, `dict_sequence`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (690443568074379264, '激活', 'activate', 'button', 22, 690409019042877440, '2020-03-20 14:16:17', NULL, '10001');
INSERT INTO `mscode_sys_dict` (`id`, `dict_name`, `dict_value`, `dict_type`, `dict_sequence`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (690443896224141312, '路径', 'execution', 'button', 23, 690409019042877440, '2020-03-20 14:17:36', NULL, '10001');
INSERT INTO `mscode_sys_dict` (`id`, `dict_name`, `dict_value`, `dict_type`, `dict_sequence`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (690444200416038912, '节点', 'activity', 'button', 24, 690409019042877440, '2020-03-20 14:18:48', NULL, '10001');
INSERT INTO `mscode_sys_dict` (`id`, `dict_name`, `dict_value`, `dict_type`, `dict_sequence`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (690444357635330048, '详细', 'detail', 'button', 25, 690409019042877440, '2020-03-20 14:19:26', NULL, '10001');
INSERT INTO `mscode_sys_dict` (`id`, `dict_name`, `dict_value`, `dict_type`, `dict_sequence`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (690444491202940928, '变量', 'variable', 'button', 26, 690409019042877440, '2020-03-20 14:19:57', NULL, '10001');
INSERT INTO `mscode_sys_dict` (`id`, `dict_name`, `dict_value`, `dict_type`, `dict_sequence`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (693426304712101888, '详情', 'details', 'button', 27, 690409019042877440, '2020-03-28 19:48:34', NULL, '10001');
INSERT INTO `mscode_sys_dict` (`id`, `dict_name`, `dict_value`, `dict_type`, `dict_sequence`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (798063426328252416, '文件类型', 'filetype', 'file', 7, 0, '2021-01-11 13:39:08', NULL, '10001');
INSERT INTO `mscode_sys_dict` (`id`, `dict_name`, `dict_value`, `dict_type`, `dict_sequence`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (798063617890504704, '图片', 'image', 'file', 1, 798063426328252416, '2021-01-11 13:39:54', NULL, '10001');
INSERT INTO `mscode_sys_dict` (`id`, `dict_name`, `dict_value`, `dict_type`, `dict_sequence`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (798063838640918528, '文档', 'document', 'file', 2, 798063426328252416, '2021-01-11 13:40:47', NULL, '10001');
INSERT INTO `mscode_sys_dict` (`id`, `dict_name`, `dict_value`, `dict_type`, `dict_sequence`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (798063992991305728, '视频', 'video', 'file', 3, 798063426328252416, '2021-01-11 13:41:24', NULL, '10001');
INSERT INTO `mscode_sys_dict` (`id`, `dict_name`, `dict_value`, `dict_type`, `dict_sequence`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (798064175741325312, '音频', 'audio', 'file', 4, 798063426328252416, '2021-01-11 13:42:07', NULL, '10001');
INSERT INTO `mscode_sys_dict` (`id`, `dict_name`, `dict_value`, `dict_type`, `dict_sequence`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (798064281538449408, '其他', 'other', 'file', 5, 798063426328252416, '2021-01-11 13:42:32', NULL, '10001');
COMMIT;

-- ----------------------------
-- Table structure for mscode_sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `mscode_sys_menu`;
CREATE TABLE `mscode_sys_menu` (
  `id` bigint(20) NOT NULL COMMENT '菜单主键ID',
  `menu_code` varchar(32) NOT NULL COMMENT '菜单编码',
  `menu_name` varchar(32) NOT NULL COMMENT '菜单名称',
  `menu_icon` varchar(32) DEFAULT NULL COMMENT '菜单图标',
  `menu_path` varchar(512) DEFAULT NULL COMMENT '菜单路由',
  `menu_component` varchar(256) DEFAULT NULL COMMENT '菜单组件',
  `menu_sequence` bigint(20) DEFAULT NULL COMMENT '排序',
  `menu_status` tinyint(4) NOT NULL COMMENT '菜单状态 0：不隐藏 1：隐藏',
  `parent_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '上级菜单ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `tenant_code` varchar(64) DEFAULT '10001' COMMENT '租户编码',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_menu_route` (`menu_path`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='菜单表';

-- ----------------------------
-- Records of mscode_sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (663750580350930944, 'home', '首页', 'home', '/home', NULL, 1, 1, 0, '2020-01-06 22:27:52', '2020-06-29 09:16:39', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (663854683370475520, 'workbench', '工作台', 'profile', '/home/workbench', './Home/Workbench', 1, 1, 663750580350930944, '2020-01-07 05:21:33', '2020-06-29 09:18:00', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (663854974853632000, 'mynotification', '我的消息', 'message', '/home/mynotification', './Home/MyNotification', 2, 1, 663750580350930944, '2020-01-07 05:22:42', '2020-06-29 09:40:43', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (663855492212641792, 'admin', '系统管理', 'desktop', '/admin', NULL, 3, 1, 0, '2020-01-07 05:24:45', '2020-06-29 09:17:56', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (663855709905408000, 'sysuser', '用户管理', 'user', '/admin/sysuser', './Admin/SysUser', 1, 1, 663855492212641792, '2020-01-07 05:25:37', '2020-06-29 09:17:53', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (663855944106954752, 'sysrole', '角色管理', 'idcard', '/authority/sysrole', './Admin/SysRole', 1, 1, 665496626324230144, '2020-01-07 05:26:33', '2020-06-29 09:17:51', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (663856139884482560, 'sysparam', '参数管理', 'sliders', '/admin/sysparam', './Admin/SysParam', 6, 1, 663855492212641792, '2020-01-07 05:27:20', '2020-06-29 09:17:49', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (663856370193715200, 'sysdict', '字典管理', 'book', '/admin/sysdict', './Admin/SysDict', 4, 1, 663855492212641792, '2020-01-07 05:28:15', '2020-06-29 09:17:48', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (663856596409307136, 'sysorg', '机构管理', 'team', '/admin/sysorg', './Admin/SysOrg', 3, 1, 663855492212641792, '2020-01-07 05:29:09', '2020-06-29 09:17:46', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (663856793264771072, 'sysmenu', '菜单管理', 'menu', '/admin/sysmenu', './Admin/SysMenu', 2, 1, 663855492212641792, '2020-01-07 05:29:56', '2020-06-29 09:17:44', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (663857014669496320, 'sysregion', '区域管理', 'environment', '/admin/sysregion', './Admin/SysRegion', 5, 1, 663855492212641792, '2020-01-07 05:30:48', '2020-06-29 09:17:18', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (663857253375725568, 'notification', '消息通知', 'notification', '/admin/notification', './Admin/Notification', 7, 1, 663855492212641792, '2020-01-07 05:31:45', '2020-06-29 09:17:40', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (663861404352565248, 'tenant', '多租户', 'cloud-server', '/tenant', NULL, 4, 1, 0, '2020-01-07 05:48:15', '2020-06-29 09:17:37', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (663861613581225984, 'systenant', '租户管理', 'cloud', '/tenant/systenant', './Admin/SysTenant', 1, 1, 663861404352565248, '2020-01-07 05:49:05', '2020-06-29 09:17:35', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (663862096987344896, 'personaloa', '我的办公', 'schedule', '/personaloa', NULL, 5, 1, 0, '2020-01-07 05:51:00', '2020-06-29 09:17:33', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (663862460172128256, 'startprocess', '发起流程', 'interaction', '/personaloa/startprocess', './PersonalOA/StartProcess', 1, 1, 663862096987344896, '2020-01-07 05:52:27', '2020-06-29 09:17:32', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (663862916743090176, 'myprocess', '我的流程', 'calendar', '/personaloa/myprocess', './PersonalOA/MyProcess', 2, 1, 663862096987344896, '2020-01-07 05:54:15', '2020-06-29 09:17:30', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (663863146888744960, 'candidatetask', '待签收任务', 'container', '/personaloa/candidatetask', './PersonalOA/CandidateTask', 3, 1, 663862096987344896, '2020-01-07 05:55:10', '2020-06-29 09:17:28', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (663863400497336320, 'assigneetask', '待办任务', 'switcher', '/personaloa/assigneetask', './PersonalOA/AssigneeTask', 4, 1, 663862096987344896, '2020-01-07 05:56:11', '2020-06-29 09:17:27', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (663863700486541312, 'finishedtask', '已办任务', 'project', '/personaloa/finishedtask', './PersonalOA/FinishedTask', 5, 1, 663862096987344896, '2020-01-07 05:57:22', '2020-06-29 09:17:25', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (663864025209556992, 'activiti', '工作流管理', 'appstore', '/activiti', NULL, 6, 1, 0, '2020-01-07 05:58:40', '2020-06-29 09:17:22', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (663864263244697600, 'model', '模型管理', 'hdd', '/activiti/model', './Activiti/ModelManage', 1, 1, 663864025209556992, '2020-01-07 05:59:37', '2020-06-29 09:17:43', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (663864697992695808, 'processdesign', '流程设计', NULL, '/activiti/processdesign', './Activiti/ProcessDesign/ProcessDesign', 2, 0, 663864025209556992, '2020-01-07 06:01:20', '2020-06-29 09:15:20', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (663864915588993024, 'deployment', '部署管理', 'deployment-unit', '/activiti/deployment', './Activiti/Deployment', 3, 1, 663864025209556992, '2020-01-07 06:02:12', '2020-06-29 09:18:43', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (663865201925738496, 'processdefinition', '流程定义', 'control', '/activiti/processdefinition', './Activiti/ProcessDefinition', 4, 1, 663864025209556992, '2020-01-07 06:03:20', '2020-06-29 09:18:39', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (663865503307452416, 'processinstance', '流程实例', 'windows', '/activiti/processinstance', './Activiti/ProcessInstance', 5, 1, 663864025209556992, '2020-01-07 06:04:32', '2020-06-29 09:18:38', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (663865799052021760, 'execution', '流程实例执行路径', NULL, '/activiti/execution', './Activiti/Execution', 6, 0, 663864025209556992, '2020-01-07 06:05:43', '2020-06-29 09:15:53', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (663866117546496000, 'task', '流程实例任务', 'solution', '/activiti/task', './Activiti/Task', 7, 1, 663864025209556992, '2020-01-07 06:06:59', '2020-06-29 09:18:36', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (663866457184456704, 'historicprocessinstance', '流程发起历史', 'tablet', '/activiti/historicprocessinstance', './Activiti/HistoricProcessInstance', 8, 1, 663864025209556992, '2020-01-07 06:08:20', '2020-06-29 09:18:34', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (663866797015355392, 'historicactivityinstance', '流程节点执行历史', NULL, '/activiti/historicactivityinstance', './Activiti/HistoricActivityInstance', 9, 0, 663864025209556992, '2020-01-07 06:09:41', '2020-06-29 09:15:48', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (663867140080062464, 'historicdetail', '流程节点详细历史', NULL, '/activiti/historicdetail', './Activiti/HistoricDetail', 10, 0, 663864025209556992, '2020-01-07 06:11:02', '2020-06-29 09:15:28', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (663867371509174272, 'historicvariableinstance', '流程实例变量历史', NULL, '/activiti/historicvariableinstance', './Activiti/HistoricVariableInstance', 11, 0, 663864025209556992, '2020-01-07 06:11:58', '2020-06-29 09:15:23', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (663867636220088320, 'historictaskinstance', '流程任务历史', 'carry-out', '/activiti/historictaskinstance', './Activiti/HistoricTaskInstance', 12, 1, 663864025209556992, '2020-01-07 06:13:01', '2020-06-29 09:18:32', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (663867981964955648, 'file', '文件管理', 'file', '/file', NULL, 7, 1, 0, '2020-01-07 06:14:23', '2020-06-29 09:18:31', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (663868238819938304, 'uploaddownload', '上传下载', 'file-text', '/file/upload-download', './File/File', 1, 1, 663867981964955648, '2020-01-07 06:15:24', '2020-06-29 09:18:26', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (663868640676204544, 'chart', '图表报表', 'dashboard', '/chart', NULL, 8, 1, 0, '2020-01-07 06:17:00', '2020-06-29 09:18:24', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (663868873103560704, 'analysis', '分析页', 'bar-chart', '/chart/analysis', './Chart/Analysis', 1, 1, 663868640676204544, '2020-01-07 06:17:56', '2020-06-29 09:18:02', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (663869085146599424, 'monitor', '监控页', 'area-chart', '/chart/monitor', './Chart/Monitor', 2, 1, 663868640676204544, '2020-01-07 06:18:46', '2020-06-29 09:18:21', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (665003871265280000, 'template', '模板实例', 'project', '/template', NULL, 14, 1, 0, '2020-01-10 09:28:00', '2020-06-29 09:18:19', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (665004465291972608, 'form', '表单页', 'form', '/template/form', NULL, 1, 1, 665003871265280000, '2020-01-10 09:30:21', '2020-06-29 09:18:17', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (665004888883122176, 'basicform', '基础表单', 'form', '/template/form/basic-form', './Template/Forms/BasicForm', 1, 1, 665004465291972608, '2020-01-10 09:32:02', '2020-06-29 09:18:15', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (665005583355006976, 'stepform', '分步表单', 'form', '/template/form/step-form?current=1', './Template/Forms/StepForm', 2, 1, 665004465291972608, '2020-01-10 09:34:48', '2020-06-29 09:18:13', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (665006035807162368, 'info', '填写转账信息', 'form', '/template/form/step-form', './Template/Forms/StepForm/Step1', 1, 1, 665005583355006976, '2020-01-10 09:36:36', '2020-06-29 09:18:09', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (665006303672193024, 'confirm', '确认转账信息', NULL, '/template/form/step-form/confirm', './Template/Forms/StepForm/Step2', 2, 0, 665005583355006976, '2020-01-10 09:37:40', '2020-06-29 09:15:32', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (665006482060136448, 'finish', '完成', NULL, '/template/form/step-form/finish', './Template/Forms/StepForm/Step3', 3, 0, 665005583355006976, '2020-01-10 09:38:22', '2020-06-29 09:15:35', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (665006779776028672, 'advancedform', '高级表单', 'form', '/template/form/advanced-form', './Template/Forms/AdvancedForm', 3, 1, 665004465291972608, '2020-01-10 09:39:33', '2020-06-29 09:18:07', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (665007146580496384, 'list', '列表页', 'table', '/template/list', NULL, 2, 1, 665003871265280000, '2020-01-10 09:41:01', '2020-06-29 09:18:05', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (665007437736497152, 'searchtable', '查询表格', 'table', '/template/list/table-list', './Template/List/TableList', 1, 1, 665007146580496384, '2020-01-10 09:42:10', '2020-06-29 09:18:03', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (665007802225709056, 'basiclist', '标准列表', 'table', '/template/list/basic-list', './Template/List/BasicList', 2, 1, 665007146580496384, '2020-01-10 09:43:37', '2020-06-29 09:18:23', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (665009153424936960, 'cardlist', '卡片列表', 'table', '/template/list/card-list', './Template/List/CardList', 3, 1, 665007146580496384, '2020-01-10 09:48:59', '2020-06-29 09:16:31', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (665009726589161472, 'searchlist', '搜索列表', 'table', '/template/list/search', './Template/List/List', 3, 1, 665007146580496384, '2020-01-10 09:51:16', '2020-06-29 09:16:29', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (665010520889675776, 'articles', '搜索列表（文章）', 'table', '/template/list/search/articles', './Template/List/Articles', 1, 1, 665009726589161472, '2020-01-10 09:54:25', '2020-06-29 09:16:26', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (665010657795952640, 'projects', '搜索列表（项目）', 'table', '/template/list/search/projects', './Template/List/Projects', 2, 1, 665009726589161472, '2020-01-10 09:54:58', '2020-06-29 09:16:23', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (665010791703302144, 'applications', '搜索列表（应用）', 'table', '/template/list/search/applications', './Template/List/Applications', 3, 1, 665009726589161472, '2020-01-10 09:55:30', '2020-06-29 09:16:21', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (665191788055023616, 'profile', '详情页', 'profile', '/template/profile', NULL, 3, 1, 665003871265280000, '2020-01-10 21:54:40', '2020-06-29 09:16:18', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (665192197972742144, 'basic', '基础详情页', 'profile', '/template/profile/basic', './Template/Profile/BasicProfile', 1, 1, 665191788055023616, '2020-01-10 21:56:18', '2020-06-29 09:15:56', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (665192716074143744, 'advanced', '高级详情页', 'profile', '/template/profile/advanced', './Template/Profile/AdvancedProfile', 2, 1, 665191788055023616, '2020-01-10 21:58:22', '2020-06-29 09:16:11', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (665197219141832704, 'result', '结果页', 'check-circle-o', '/template/result', NULL, 4, 1, 665003871265280000, '2020-01-10 22:16:15', '2020-06-29 09:16:05', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (665197381171990528, 'success', '成功页', 'check-circle-o', '/template/result/success', './Template/Result/Success', 1, 1, 665197219141832704, '2020-01-10 22:16:54', '2020-06-29 09:16:01', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (665197527700000768, 'fail', '失败页', 'close-circle-o', '/template/result/fail', './Template/Result/Error', 2, 1, 665197219141832704, '2020-01-10 22:17:29', '2020-06-29 09:15:59', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (665197875319721984, 'exception', '异常页', 'warning', '/exception', NULL, 12, 0, 0, '2020-01-10 22:18:52', '2020-06-29 09:15:04', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (665198079427137536, 'not-permission', '403', 'warning', '/exception/403', './Exception/Exception403', 1, 0, 665197875319721984, '2020-01-10 22:19:40', '2020-06-29 09:15:12', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (665198241801228288, 'not-find', '404', 'warning', '/exception/404', './Exception/Exception404', 2, 0, 665197875319721984, '2020-01-10 22:20:19', '2020-06-29 09:15:15', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (665198396457799680, 'server-error', '500', 'warning', '/exception/500', './Exception/Exception500', 3, 0, 665197875319721984, '2020-01-10 22:20:56', '2020-06-29 09:14:56', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (665198983094128640, 'account', '个人页', 'user', '/template/account', NULL, 6, 1, 665003871265280000, '2020-01-10 22:23:16', '2020-06-29 09:16:56', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (665199223704571904, 'center', '个人中心', 'user', '/template/account/center', './Template/Account/Center/Center', 1, 1, 665198983094128640, '2020-01-10 22:24:13', '2020-06-29 09:17:16', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (665199423219224576, 'editor', '图形编辑器', 'highlight', '/template/editor', NULL, 7, 1, 665003871265280000, '2020-01-10 22:25:01', '2020-06-29 09:16:16', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (665199632426913792, 'flow', '流程编辑器', 'highlight', '/template/editor/flow', './Template/Editor/GGEditor/Flow', 1, 1, 665199423219224576, '2020-01-10 22:25:51', '2020-06-29 09:17:13', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (665199774022422528, 'mind', '脑图编辑器', 'highlight', '/template/editor/mind', './Template/Editor/GGEditor/Mind', 2, 1, 665199423219224576, '2020-01-10 22:26:24', '2020-06-29 09:17:11', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (665199936786583552, 'koni', '拓扑编辑器', 'highlight', '/template/editor/koni', './Template/Editor/GGEditor/Koni', 3, 1, 665199423219224576, '2020-01-10 22:27:03', '2020-06-29 09:17:09', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (665496626324230144, 'authority', '权限管理', 'safety', '/authority', NULL, 2, 1, 0, '2020-01-11 18:06:00', '2020-06-29 09:17:07', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (665564219978469376, 'monitors', '配置监控', 'line-chart', '/monitors', NULL, 11, 1, 0, '2020-01-11 22:34:36', '2020-06-29 09:17:06', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (665564620060545024, 'sentinel', 'Sentinel流量监控', 'sliders', 'https://www.mscodecloud.com/sentinel/', NULL, 1, 1, 665564219978469376, '2020-01-11 22:36:11', '2020-10-02 17:22:41', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (665730162285268992, 'nacos', 'Nacos配置注册', 'branches', 'https://www.mscodecloud.com/nacos/', NULL, 2, 1, 665564219978469376, '2020-01-12 09:34:02', '2020-06-29 09:17:00', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (665734849524846592, 'swagger', 'Swagger接口文档', 'box-plot', 'https://www.mscodecloud.com/swagger', NULL, 3, 1, 665564219978469376, '2020-01-12 09:52:39', '2020-10-01 21:55:27', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (666473278365683712, 'devtool', '研发工具', 'code-sandbox', '/devtool', NULL, 9, 1, 0, '2020-01-14 10:46:53', '2020-06-29 09:16:54', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (666473881804394496, 'generator', '代码生成器', 'code', '/devtool/generator', './DevTool/Generator', 1, 1, 666473278365683712, '2020-01-14 10:49:17', '2020-06-29 09:16:52', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (684185040317763584, 'sysurl', '接口权限', 'api', '/authority/sysurl', './Admin/SysUrl', 2, 1, 665496626324230144, '2020-03-03 07:47:08', '2020-06-29 09:16:51', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (687514791186976768, 'account', '个人页', 'setting', '/account', '', 13, 0, 0, '2020-03-12 12:18:19', '2020-06-29 09:15:25', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (687563817764704256, 'settings', '个人设置', 'user', '/account/settings', './Account/Settings/Info', 1, 1, 687514791186976768, '2020-03-12 15:33:08', '2020-06-29 09:16:48', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (690019670816116736, 'datapermission', '数据权限', 'gateway', '/authority/datapermission', './Admin/DataPermission', 3, 1, 665496626324230144, '2020-03-19 10:11:52', '2020-06-29 09:16:47', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (692361087815176192, 'groupchart', '分组报表', 'stock', '/chart/groupchart', './Chart/GroupChart', 3, 1, 663868640676204544, '2020-03-25 21:15:54', '2020-06-29 09:16:45', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (693434079391436800, 'myprocessdetails', '我的流程详情', NULL, '/personaloa/myprocessdetails', './PersonalOA/MyProcessDetails', 6, 0, 663862096987344896, '2020-03-28 20:19:27', '2020-06-29 09:15:38', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (693698880994725888, 'mytaskdetails', '我的任务详情', NULL, '/personaloa/mytaskdetails', './PersonalOA/MyTaskDetails', 7, 0, 663862096987344896, '2020-03-29 13:51:43', '2020-06-29 09:15:41', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (693762431952277504, 'historictaskdetails', '任务历史详情', NULL, '/activiti/historictaskdetails', './Activiti/HistoricTaskDetails', 14, 0, 663864025209556992, '2020-03-29 18:04:15', '2020-06-29 09:15:43', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (693762978637860864, 'taskdetails', '任务详情', NULL, '/activiti/taskdetails', './Activiti/TaskDetails', 13, 0, 663864025209556992, '2020-03-29 18:06:25', '2020-06-29 09:15:46', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (699081036910743552, 'appclient', '应用管理', 'fork', '/admin/appclient', './Admin/AppClient', 8, 1, 663855492212641792, '2020-04-13 10:18:27', '2020-06-29 09:16:43', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (705593293912068096, 'distributedlog', '分布式日志', 'cluster', '/distributedlog', NULL, 10, 1, 0, '2020-05-01 09:35:53', '2020-06-29 09:16:41', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (705595098737856512, 'kibana', 'ELK分布式日志', 'pull-request', 'https://www.mscodecloud.com/kibana/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-150m,to:now))&_a=(columns:!(_source),index:\'4b99a7a0-46b8-11eb-bf1d-2d17f624f283\',interval:auto,query:(language:kuery,query:\'\'),sort:!(!(\'@timestamp\',desc)))', NULL, 1, 1, 705593293912068096, '2020-05-01 09:43:03', '2020-12-25 21:53:15', '10001');
INSERT INTO `mscode_sys_menu` (`id`, `menu_code`, `menu_name`, `menu_icon`, `menu_path`, `menu_component`, `menu_sequence`, `menu_status`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (765381334624817152, 'formgenerator', '表单设计器', 'codepen', '/devtool/formgenerator', './DevTool/FormGenerator', 2, 1, 666473278365683712, '2020-10-13 09:12:11', '2020-10-23 10:35:56', '10001');
COMMIT;

-- ----------------------------
-- Table structure for mscode_sys_menu_button
-- ----------------------------
DROP TABLE IF EXISTS `mscode_sys_menu_button`;
CREATE TABLE `mscode_sys_menu_button` (
  `id` bigint(20) NOT NULL COMMENT '菜单与按钮关联主键ID',
  `menu_code` varchar(32) NOT NULL COMMENT '菜单编码',
  `menu_button` varchar(40) NOT NULL COMMENT '按钮',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='菜单与按钮关联表';

-- ----------------------------
-- Records of mscode_sys_menu_button
-- ----------------------------
BEGIN;
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (690886272663080960, 'sysrole', 'add');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (690886272767938560, 'sysrole', 'update');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (690886272872796160, 'sysrole', 'delete');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (690886272986042368, 'sysrole', 'export');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (690886273086705664, 'sysrole', 'authorize');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (690886417148465152, 'sysurl', 'add');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (690886417240739840, 'sysurl', 'update');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (690886417341403136, 'sysurl', 'delete');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (690886417442066432, 'sysurl', 'export');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (690886417559506944, 'sysurl', 'authorize');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (690886572505485312, 'datapermission', 'authorize');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (690886745692491776, 'sysuser', 'add');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (690886745797349376, 'sysuser', 'update');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (690886745927372800, 'sysuser', 'delete');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (690886746032230400, 'sysuser', 'export');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (690886883357937664, 'sysmenu', 'add');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (690886883462795264, 'sysmenu', 'update');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (690886883563458560, 'sysmenu', 'delete');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (690886883664121856, 'sysmenu', 'export');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (690886984344195072, 'sysorg', 'add');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (690886984470024192, 'sysorg', 'update');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (690886984579076096, 'sysorg', 'delete');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (690886984679739392, 'sysorg', 'export');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (690887118322847744, 'sysdict', 'add');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (690887118427705344, 'sysdict', 'update');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (690887118540951552, 'sysdict', 'delete');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (690887118650003456, 'sysdict', 'export');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (690887277790285824, 'sysregion', 'add');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (690887277895143424, 'sysregion', 'update');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (690887278000001024, 'sysregion', 'delete');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (690887278113247232, 'sysregion', 'export');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (690887642933809152, 'sysparam', 'add');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (690887643034472448, 'sysparam', 'update');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (690887643139330048, 'sysparam', 'delete');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (690887643244187648, 'sysparam', 'export');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (690887758210060288, 'notification', 'add');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (690887758310723584, 'notification', 'update');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (690887758402998272, 'notification', 'delete');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (690887942629412864, 'systenant', 'add');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (690887942730076160, 'systenant', 'update');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (690887942839128064, 'systenant', 'delete');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (690887942939791360, 'systenant', 'export');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (690888369387261952, 'startprocess', 'preview');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (690888369483730944, 'startprocess', 'start');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (690889637128228864, 'model', 'add');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (690889637233086464, 'model', 'update');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (690889637346332672, 'model', 'delete');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (690889637451190272, 'model', 'design');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (690889637551853568, 'model', 'deploy');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (690889807416971264, 'deployment', 'delete');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (690889807521828864, 'deployment', 'download');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (690889807626686464, 'deployment', 'preview');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (690890090238889984, 'processdefinition', 'download');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (690890090343747584, 'processdefinition', 'preview');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (690890090465382400, 'processdefinition', 'suspend');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (690890090574434304, 'processdefinition', 'activate');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (690890400390893568, 'processinstance', 'delete');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (690890400499945472, 'processinstance', 'track');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (690890400608997376, 'processinstance', 'suspend');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (690890400718049280, 'processinstance', 'activate');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (690890400818712576, 'processinstance', 'execution');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (690890958535315456, 'historicprocessinstance', 'delete');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (690890958635978752, 'historicprocessinstance', 'activity');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (690890958757613568, 'historicprocessinstance', 'detail');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (690890958862471168, 'historicprocessinstance', 'variable');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (690891368851492864, 'uploaddownload', 'delete');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (690891368952156160, 'uploaddownload', 'upload');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (690891369061208064, 'uploaddownload', 'download');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (693344019832819712, 'generator', 'add');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (693344019958648832, 'generator', 'update');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (693344020092866560, 'generator', 'delete');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (693344020206112768, 'generator', 'export');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (693344020336136192, 'generator', 'generate');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (693790288543928320, 'historictaskinstance', 'delete');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (693790288632008704, 'historictaskinstance', 'details');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (693790517292879872, 'task', 'track');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (693790517385154560, 'task', 'execution');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (693790517464846336, 'task', 'details');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (693791070404136960, 'myprocess', 'track');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (693791070496411648, 'myprocess', 'details');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (693791130684674048, 'candidatetask', 'track');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (693791130781143040, 'candidatetask', 'assign');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (693791130898583552, 'candidatetask', 'details');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (693791160086745088, 'assigneetask', 'track');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (693791160174825472, 'assigneetask', 'complete');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (693791160271294464, 'assigneetask', 'delegate');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (693791160413900800, 'assigneetask', 'regress');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (693791160518758400, 'assigneetask', 'reject');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (693791160606838784, 'assigneetask', 'terminate');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (693791160711696384, 'assigneetask', 'details');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (693791186443751424, 'finishedtask', 'track');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (693791186577969152, 'finishedtask', 'details');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (699081037065932800, 'appclient', 'add');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (699081037200150528, 'appclient', 'update');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (699081037309202432, 'appclient', 'delete');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (699081037489557504, 'appclient', 'export');
INSERT INTO `mscode_sys_menu_button` (`id`, `menu_code`, `menu_button`) VALUES (726975396599746560, 'mynotification', 'view');
COMMIT;

-- ----------------------------
-- Table structure for mscode_sys_org
-- ----------------------------
DROP TABLE IF EXISTS `mscode_sys_org`;
CREATE TABLE `mscode_sys_org` (
  `id` bigint(20) NOT NULL COMMENT '机构主键ID',
  `org_name` varchar(64) NOT NULL COMMENT '机构名称',
  `org_type` varchar(32) NOT NULL COMMENT '机构类型',
  `org_description` varchar(256) DEFAULT NULL COMMENT '机构描述',
  `org_sequence` bigint(20) DEFAULT NULL COMMENT '排序',
  `parent_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '上级机构ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `tenant_code` varchar(64) DEFAULT '10001' COMMENT '租户编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='机构表';

-- ----------------------------
-- Records of mscode_sys_org
-- ----------------------------
BEGIN;
INSERT INTO `mscode_sys_org` (`id`, `org_name`, `org_type`, `org_description`, `org_sequence`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (1, '恒星科创', 'company', '广州恒星科创信息技术有限公司', 1, 0, '2019-08-27 15:29:11', '2019-09-24 18:13:02', '10001');
INSERT INTO `mscode_sys_org` (`id`, `org_name`, `org_type`, `org_description`, `org_sequence`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (2, '研发部', 'department', '这是研发部门', 1, 1, '2019-08-30 22:30:51', '2019-08-30 22:34:32', '10001');
INSERT INTO `mscode_sys_org` (`id`, `org_name`, `org_type`, `org_description`, `org_sequence`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (666664834108411904, '开发三组', 'team', '开发三组研发框架', 1, 2, '2020-01-14 23:28:03', '2020-03-18 10:36:57', '10001');
INSERT INTO `mscode_sys_org` (`id`, `org_name`, `org_type`, `org_description`, `org_sequence`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (666665278205513728, '行政部', 'department', '行政部门服务员工', 2, 1, '2020-01-14 23:29:49', NULL, '10001');
INSERT INTO `mscode_sys_org` (`id`, `org_name`, `org_type`, `org_description`, `org_sequence`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (666858728934789120, '测试一组', 'team', '测试一组测试框架', 2, 2, '2020-01-15 12:18:32', NULL, '10001');
INSERT INTO `mscode_sys_org` (`id`, `org_name`, `org_type`, `org_description`, `org_sequence`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (713570638321078272, 'A公司', 'company', 'A公司是专业的电信服务提供商', 2, 0, '2020-05-23 09:55:01', NULL, '10001');
INSERT INTO `mscode_sys_org` (`id`, `org_name`, `org_type`, `org_description`, `org_sequence`, `parent_id`, `create_time`, `update_time`, `tenant_code`) VALUES (785354103659614208, '研发部', 'department', '这是A公司的研发部', 1, 713570638321078272, '2020-12-07 11:56:50', NULL, '10001');
COMMIT;

-- ----------------------------
-- Table structure for mscode_sys_param
-- ----------------------------
DROP TABLE IF EXISTS `mscode_sys_param`;
CREATE TABLE `mscode_sys_param` (
  `id` bigint(20) NOT NULL COMMENT '参数主键ID',
  `param_name` varchar(64) NOT NULL COMMENT '参数名称',
  `param_key` varchar(256) NOT NULL COMMENT '参数键名',
  `param_value` varchar(2048) DEFAULT NULL COMMENT '参数键值',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `tenant_code` varchar(64) DEFAULT '10001' COMMENT '租户编码',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_param_name` (`param_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='参数表';

-- ----------------------------
-- Records of mscode_sys_param
-- ----------------------------
BEGIN;
INSERT INTO `mscode_sys_param` (`id`, `param_name`, `param_key`, `param_value`, `create_time`, `update_time`, `tenant_code`) VALUES (1, '账户初始密码', 'account.initPassword', '123456', '2019-09-23 16:54:15', '2020-01-15 12:20:32', '10001');
COMMIT;

-- ----------------------------
-- Table structure for mscode_sys_region
-- ----------------------------
DROP TABLE IF EXISTS `mscode_sys_region`;
CREATE TABLE `mscode_sys_region` (
  `id` bigint(20) NOT NULL COMMENT '区域主键ID',
  `region_name` varchar(40) NOT NULL COMMENT '区域名称',
  `region_code` varchar(20) NOT NULL COMMENT '区域代码',
  `region_type` varchar(32) NOT NULL COMMENT '区域类型',
  `parent_region_code` varchar(20) NOT NULL COMMENT '上级区域代码',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `tenant_code` varchar(64) DEFAULT '10001' COMMENT '租户编码',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_region_code` (`region_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='区域表';

-- ----------------------------
-- Records of mscode_sys_region
-- ----------------------------
BEGIN;
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (1, '北京市', '110000', 'province', '0', '2019-02-28 17:16:58', '2019-09-16 22:04:01', '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (2, '天津市', '120000', 'province', '0', '2019-02-28 17:16:58', '2019-09-24 18:13:48', '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (3, '河北省', '130000', 'province', '0', '2019-02-28 17:16:58', '2019-09-16 22:04:01', '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (4, '山西省', '140000', 'province', '0', '2019-02-28 17:16:58', '2019-09-16 22:04:01', '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (5, '内蒙古自治区', '150000', 'province', '0', '2019-02-28 17:16:58', '2019-09-16 22:04:01', '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (6, '辽宁省', '210000', 'province', '0', '2019-02-28 17:16:58', '2019-09-16 22:04:01', '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (7, '吉林省', '220000', 'province', '0', '2019-02-28 17:16:58', '2019-09-16 22:04:01', '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (8, '黑龙江省', '230000', 'province', '0', '2019-02-28 17:16:58', '2019-09-16 22:04:01', '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (9, '上海市', '310000', 'province', '0', '2019-02-28 17:16:58', '2019-09-16 22:04:01', '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (10, '江苏省', '320000', 'province', '0', '2019-02-28 17:16:58', '2019-09-16 22:04:01', '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (11, '浙江省', '330000', 'province', '0', '2019-02-28 17:16:58', '2019-09-16 22:04:01', '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (12, '安徽省', '340000', 'province', '0', '2019-02-28 17:16:58', '2019-09-16 22:04:01', '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (13, '福建省', '350000', 'province', '0', '2019-02-28 17:16:58', '2019-09-16 22:04:01', '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (14, '江西省', '360000', 'province', '0', '2019-02-28 17:16:58', '2019-09-16 22:04:01', '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (15, '山东省', '370000', 'province', '0', '2019-02-28 17:16:58', '2019-09-16 22:04:01', '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (16, '河南省', '410000', 'province', '0', '2019-02-28 17:16:58', '2019-09-16 22:04:01', '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (17, '湖北省', '420000', 'province', '0', '2019-02-28 17:16:58', '2019-09-16 22:04:01', '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (18, '湖南省', '430000', 'province', '0', '2019-02-28 17:16:58', '2019-09-16 22:04:01', '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (19, '广东省', '440000', 'province', '0', '2019-02-28 17:16:58', '2019-09-16 22:04:01', '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (20, '广西壮族自治区', '450000', 'province', '0', '2019-02-28 17:16:58', '2019-09-16 22:04:01', '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (21, '海南省', '460000', 'province', '0', '2019-02-28 17:16:58', '2019-09-16 22:04:01', '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (22, '重庆市', '500000', 'province', '0', '2019-02-28 17:16:58', '2019-09-16 22:04:01', '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (23, '四川省', '510000', 'province', '0', '2019-02-28 17:16:58', '2019-09-16 22:04:01', '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (24, '贵州省', '520000', 'province', '0', '2019-02-28 17:16:58', '2019-09-16 22:04:01', '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (25, '云南省', '530000', 'province', '0', '2019-02-28 17:16:58', '2019-09-16 22:04:01', '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (26, '西藏自治区', '540000', 'province', '0', '2019-02-28 17:16:58', '2019-09-16 22:04:01', '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (27, '陕西省', '610000', 'province', '0', '2019-02-28 17:16:58', '2019-09-16 22:04:01', '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (28, '甘肃省', '620000', 'province', '0', '2019-02-28 17:16:58', '2019-09-16 22:04:01', '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (29, '青海省', '630000', 'province', '0', '2019-02-28 17:16:58', '2019-09-16 22:04:01', '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (30, '宁夏回族自治区', '640000', 'province', '0', '2019-02-28 17:16:58', '2019-09-16 22:04:01', '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (31, '新疆维吾尔自治区', '650000', 'province', '0', '2019-02-28 17:16:58', '2019-09-16 22:04:01', '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (32, '台湾省', '710000', 'province', '0', '2019-02-28 17:16:58', '2019-09-16 22:04:01', '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (33, '香港特别行政区', '810000', 'province', '0', '2019-02-28 17:16:58', '2019-09-16 22:04:01', '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (34, '澳门特别行政区', '820000', 'province', '0', '2019-02-28 17:16:58', '2019-09-16 22:04:01', '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (35, '北京市', '110100', 'city', '110000', '2019-02-28 17:16:58', '2019-09-24 14:02:08', '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (36, '天津市', '120100', 'city', '120000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (37, '石家庄市', '130100', 'city', '130000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (38, '唐山市', '130200', 'city', '130000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (39, '秦皇岛市', '130300', 'city', '130000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (40, '邯郸市', '130400', 'city', '130000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (41, '邢台市', '130500', 'city', '130000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (42, '保定市', '130600', 'city', '130000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (43, '张家口市', '130700', 'city', '130000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (44, '承德市', '130800', 'city', '130000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (45, '沧州市', '130900', 'city', '130000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (46, '廊坊市', '131000', 'city', '130000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (47, '衡水市', '131100', 'city', '130000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (48, '太原市', '140100', 'city', '140000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (49, '大同市', '140200', 'city', '140000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (50, '阳泉市', '140300', 'city', '140000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (51, '长治市', '140400', 'city', '140000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (52, '晋城市', '140500', 'city', '140000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (53, '朔州市', '140600', 'city', '140000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (54, '晋中市', '140700', 'city', '140000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (55, '运城市', '140800', 'city', '140000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (56, '忻州市', '140900', 'city', '140000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (57, '临汾市', '141000', 'city', '140000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (58, '吕梁市', '141100', 'city', '140000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (59, '呼和浩特市', '150100', 'city', '150000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (60, '包头市', '150200', 'city', '150000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (61, '乌海市', '150300', 'city', '150000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (62, '赤峰市', '150400', 'city', '150000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (63, '通辽市', '150500', 'city', '150000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (64, '鄂尔多斯市', '150600', 'city', '150000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (65, '呼伦贝尔市', '150700', 'city', '150000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (66, '巴彦淖尔市', '150800', 'city', '150000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (67, '乌兰察布市', '150900', 'city', '150000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (68, '兴安盟', '152200', 'city', '150000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (69, '锡林郭勒盟', '152500', 'city', '150000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (70, '阿拉善盟', '152900', 'city', '150000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (71, '沈阳市', '210100', 'city', '210000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (72, '大连市', '210200', 'city', '210000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (73, '鞍山市', '210300', 'city', '210000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (74, '抚顺市', '210400', 'city', '210000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (75, '本溪市', '210500', 'city', '210000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (76, '丹东市', '210600', 'city', '210000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (77, '锦州市', '210700', 'city', '210000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (78, '营口市', '210800', 'city', '210000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (79, '阜新市', '210900', 'city', '210000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (80, '辽阳市', '211000', 'city', '210000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (81, '盘锦市', '211100', 'city', '210000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (82, '铁岭市', '211200', 'city', '210000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (83, '朝阳市', '211300', 'city', '210000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (84, '葫芦岛市', '211400', 'city', '210000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (85, '长春市', '220100', 'city', '220000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (86, '吉林市', '220200', 'city', '220000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (87, '四平市', '220300', 'city', '220000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (88, '辽源市', '220400', 'city', '220000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (89, '通化市', '220500', 'city', '220000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (90, '白山市', '220600', 'city', '220000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (91, '松原市', '220700', 'city', '220000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (92, '白城市', '220800', 'city', '220000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (93, '延边朝鲜族自治州', '222400', 'city', '220000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (94, '哈尔滨市', '230100', 'city', '230000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (95, '齐齐哈尔市', '230200', 'city', '230000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (96, '鸡西市', '230300', 'city', '230000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (97, '鹤岗市', '230400', 'city', '230000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (98, '双鸭山市', '230500', 'city', '230000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (99, '大庆市', '230600', 'city', '230000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (100, '伊春市', '230700', 'city', '230000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (101, '佳木斯市', '230800', 'city', '230000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (102, '七台河市', '230900', 'city', '230000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (103, '牡丹江市', '231000', 'city', '230000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (104, '黑河市', '231100', 'city', '230000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (105, '绥化市', '231200', 'city', '230000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (106, '大兴安岭地区', '232700', 'city', '230000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (107, '上海市', '310100', 'city', '310000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (108, '南京市', '320100', 'city', '320000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (109, '无锡市', '320200', 'city', '320000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (110, '徐州市', '320300', 'city', '320000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (111, '常州市', '320400', 'city', '320000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (112, '苏州市', '320500', 'city', '320000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (113, '南通市', '320600', 'city', '320000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (114, '连云港市', '320700', 'city', '320000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (115, '淮安市', '320800', 'city', '320000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (116, '盐城市', '320900', 'city', '320000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (117, '扬州市', '321000', 'city', '320000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (118, '镇江市', '321100', 'city', '320000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (119, '泰州市', '321200', 'city', '320000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (120, '宿迁市', '321300', 'city', '320000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (121, '杭州市', '330100', 'city', '330000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (122, '宁波市', '330200', 'city', '330000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (123, '温州市', '330300', 'city', '330000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (124, '嘉兴市', '330400', 'city', '330000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (125, '湖州市', '330500', 'city', '330000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (126, '绍兴市', '330600', 'city', '330000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (127, '金华市', '330700', 'city', '330000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (128, '衢州市', '330800', 'city', '330000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (129, '舟山市', '330900', 'city', '330000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (130, '台州市', '331000', 'city', '330000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (131, '丽水市', '331100', 'city', '330000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (132, '合肥市', '340100', 'city', '340000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (133, '芜湖市', '340200', 'city', '340000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (134, '蚌埠市', '340300', 'city', '340000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (135, '淮南市', '340400', 'city', '340000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (136, '马鞍山市', '340500', 'city', '340000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (137, '淮北市', '340600', 'city', '340000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (138, '铜陵市', '340700', 'city', '340000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (139, '安庆市', '340800', 'city', '340000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (140, '黄山市', '341000', 'city', '340000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (141, '滁州市', '341100', 'city', '340000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (142, '阜阳市', '341200', 'city', '340000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (143, '宿州市', '341300', 'city', '340000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (144, '六安市', '341500', 'city', '340000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (145, '亳州市', '341600', 'city', '340000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (146, '池州市', '341700', 'city', '340000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (147, '宣城市', '341800', 'city', '340000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (148, '福州市', '350100', 'city', '350000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (149, '厦门市', '350200', 'city', '350000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (150, '莆田市', '350300', 'city', '350000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (151, '三明市', '350400', 'city', '350000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (152, '泉州市', '350500', 'city', '350000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (153, '漳州市', '350600', 'city', '350000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (154, '南平市', '350700', 'city', '350000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (155, '龙岩市', '350800', 'city', '350000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (156, '宁德市', '350900', 'city', '350000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (157, '南昌市', '360100', 'city', '360000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (158, '景德镇市', '360200', 'city', '360000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (159, '萍乡市', '360300', 'city', '360000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (160, '九江市', '360400', 'city', '360000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (161, '新余市', '360500', 'city', '360000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (162, '鹰潭市', '360600', 'city', '360000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (163, '赣州市', '360700', 'city', '360000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (164, '吉安市', '360800', 'city', '360000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (165, '宜春市', '360900', 'city', '360000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (166, '抚州市', '361000', 'city', '360000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (167, '上饶市', '361100', 'city', '360000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (168, '济南市', '370100', 'city', '370000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (169, '青岛市', '370200', 'city', '370000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (170, '淄博市', '370300', 'city', '370000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (171, '枣庄市', '370400', 'city', '370000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (172, '东营市', '370500', 'city', '370000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (173, '烟台市', '370600', 'city', '370000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (174, '潍坊市', '370700', 'city', '370000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (175, '济宁市', '370800', 'city', '370000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (176, '泰安市', '370900', 'city', '370000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (177, '威海市', '371000', 'city', '370000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (178, '日照市', '371100', 'city', '370000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (179, '莱芜市', '371200', 'city', '370000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (180, '临沂市', '371300', 'city', '370000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (181, '德州市', '371400', 'city', '370000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (182, '聊城市', '371500', 'city', '370000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (183, '滨州市', '371600', 'city', '370000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (184, '菏泽市', '371700', 'city', '370000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (185, '郑州市', '410100', 'city', '410000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (186, '开封市', '410200', 'city', '410000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (187, '洛阳市', '410300', 'city', '410000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (188, '平顶山市', '410400', 'city', '410000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (189, '安阳市', '410500', 'city', '410000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (190, '鹤壁市', '410600', 'city', '410000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (191, '新乡市', '410700', 'city', '410000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (192, '焦作市', '410800', 'city', '410000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (193, '济源市', '410881', 'city', '410000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (194, '濮阳市', '410900', 'city', '410000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (195, '许昌市', '411000', 'city', '410000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (196, '漯河市', '411100', 'city', '410000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (197, '三门峡市', '411200', 'city', '410000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (198, '南阳市', '411300', 'city', '410000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (199, '商丘市', '411400', 'city', '410000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (200, '信阳市', '411500', 'city', '410000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (201, '周口市', '411600', 'city', '410000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (202, '驻马店市', '411700', 'city', '410000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (203, '武汉市', '420100', 'city', '420000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (204, '黄石市', '420200', 'city', '420000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (205, '十堰市', '420300', 'city', '420000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (206, '宜昌市', '420500', 'city', '420000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (207, '襄阳市', '420600', 'city', '420000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (208, '鄂州市', '420700', 'city', '420000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (209, '荆门市', '420800', 'city', '420000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (210, '孝感市', '420900', 'city', '420000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (211, '荆州市', '421000', 'city', '420000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (212, '黄冈市', '421100', 'city', '420000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (213, '咸宁市', '421200', 'city', '420000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (214, '随州市', '421300', 'city', '420000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (215, '恩施土家族苗族自治州', '422800', 'city', '420000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (216, '仙桃市', '429004', 'city', '420000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (217, '潜江市', '429005', 'city', '420000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (218, '天门市', '429006', 'city', '420000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (219, '神农架林区', '429021', 'city', '420000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (220, '长沙市', '430100', 'city', '430000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (221, '株洲市', '430200', 'city', '430000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (222, '湘潭市', '430300', 'city', '430000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (223, '衡阳市', '430400', 'city', '430000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (224, '邵阳市', '430500', 'city', '430000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (225, '岳阳市', '430600', 'city', '430000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (226, '常德市', '430700', 'city', '430000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (227, '张家界市', '430800', 'city', '430000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (228, '益阳市', '430900', 'city', '430000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (229, '郴州市', '431000', 'city', '430000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (230, '永州市', '431100', 'city', '430000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (231, '怀化市', '431200', 'city', '430000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (232, '娄底市', '431300', 'city', '430000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (233, '湘西土家族苗族自治州', '433100', 'city', '430000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (234, '广州市', '440100', 'city', '440000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (235, '韶关市', '440200', 'city', '440000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (236, '深圳市', '440300', 'city', '440000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (237, '珠海市', '440400', 'city', '440000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (238, '汕头市', '440500', 'city', '440000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (239, '佛山市', '440600', 'city', '440000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (240, '江门市', '440700', 'city', '440000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (241, '湛江市', '440800', 'city', '440000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (242, '茂名市', '440900', 'city', '440000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (243, '肇庆市', '441200', 'city', '440000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (244, '惠州市', '441300', 'city', '440000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (245, '梅州市', '441400', 'city', '440000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (246, '汕尾市', '441500', 'city', '440000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (247, '河源市', '441600', 'city', '440000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (248, '阳江市', '441700', 'city', '440000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (249, '清远市', '441800', 'city', '440000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (250, '东莞市', '441900', 'city', '440000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (251, '中山市', '442000', 'city', '440000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (252, '东沙群岛', '442101', 'city', '440000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (253, '潮州市', '445100', 'city', '440000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (254, '揭阳市', '445200', 'city', '440000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (255, '云浮市', '445300', 'city', '440000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (256, '南宁市', '450100', 'city', '450000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (257, '柳州市', '450200', 'city', '450000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (258, '桂林市', '450300', 'city', '450000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (259, '梧州市', '450400', 'city', '450000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (260, '北海市', '450500', 'city', '450000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (261, '防城港市', '450600', 'city', '450000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (262, '钦州市', '450700', 'city', '450000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (263, '贵港市', '450800', 'city', '450000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (264, '玉林市', '450900', 'city', '450000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (265, '百色市', '451000', 'city', '450000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (266, '贺州市', '451100', 'city', '450000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (267, '河池市', '451200', 'city', '450000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (268, '来宾市', '451300', 'city', '450000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (269, '崇左市', '451400', 'city', '450000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (270, '海口市', '460100', 'city', '460000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (271, '三亚市', '460200', 'city', '460000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (272, '三沙市', '460300', 'city', '460000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (273, '五指山市', '469001', 'city', '460000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (274, '琼海市', '469002', 'city', '460000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (275, '儋州市', '469003', 'city', '460000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (276, '文昌市', '469005', 'city', '460000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (277, '万宁市', '469006', 'city', '460000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (278, '东方市', '469007', 'city', '460000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (279, '定安县', '469025', 'city', '460000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (280, '屯昌县', '469026', 'city', '460000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (281, '澄迈县', '469027', 'city', '460000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (282, '临高县', '469028', 'city', '460000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (283, '白沙黎族自治县', '469030', 'city', '460000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (284, '昌江黎族自治县', '469031', 'city', '460000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (285, '乐东黎族自治县', '469033', 'city', '460000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (286, '陵水黎族自治县', '469034', 'city', '460000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (287, '保亭黎族苗族自治县', '469035', 'city', '460000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (288, '琼中黎族苗族自治县', '469036', 'city', '460000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (289, '重庆市', '500100', 'city', '500000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (290, '成都市', '510100', 'city', '510000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (291, '自贡市', '510300', 'city', '510000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (292, '攀枝花市', '510400', 'city', '510000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (293, '泸州市', '510500', 'city', '510000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (294, '德阳市', '510600', 'city', '510000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (295, '绵阳市', '510700', 'city', '510000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (296, '广元市', '510800', 'city', '510000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (297, '遂宁市', '510900', 'city', '510000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (298, '内江市', '511000', 'city', '510000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (299, '乐山市', '511100', 'city', '510000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (300, '南充市', '511300', 'city', '510000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (301, '眉山市', '511400', 'city', '510000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (302, '宜宾市', '511500', 'city', '510000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (303, '广安市', '511600', 'city', '510000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (304, '达州市', '511700', 'city', '510000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (305, '雅安市', '511800', 'city', '510000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (306, '巴中市', '511900', 'city', '510000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (307, '资阳市', '512000', 'city', '510000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (308, '阿坝藏族羌族自治州', '513200', 'city', '510000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (309, '甘孜藏族自治州', '513300', 'city', '510000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (310, '凉山彝族自治州', '513400', 'city', '510000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (311, '贵阳市', '520100', 'city', '520000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (312, '六盘水市', '520200', 'city', '520000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (313, '遵义市', '520300', 'city', '520000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (314, '安顺市', '520400', 'city', '520000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (315, '铜仁市', '522200', 'city', '520000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (316, '黔西南布依族苗族自治州', '522300', 'city', '520000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (317, '毕节市', '522400', 'city', '520000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (318, '黔东南苗族侗族自治州', '522600', 'city', '520000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (319, '黔南布依族苗族自治州', '522700', 'city', '520000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (320, '昆明市', '530100', 'city', '530000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (321, '曲靖市', '530300', 'city', '530000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (322, '玉溪市', '530400', 'city', '530000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (323, '保山市', '530500', 'city', '530000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (324, '昭通市', '530600', 'city', '530000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (325, '丽江市', '530700', 'city', '530000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (326, '普洱市', '530800', 'city', '530000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (327, '临沧市', '530900', 'city', '530000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (328, '楚雄彝族自治州', '532300', 'city', '530000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (329, '红河哈尼族彝族自治州', '532500', 'city', '530000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (330, '文山壮族苗族自治州', '532600', 'city', '530000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (331, '西双版纳傣族自治州', '532800', 'city', '530000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (332, '大理白族自治州', '532900', 'city', '530000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (333, '德宏傣族景颇族自治州', '533100', 'city', '530000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (334, '怒江傈僳族自治州', '533300', 'city', '530000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (335, '迪庆藏族自治州', '533400', 'city', '530000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (336, '拉萨市', '540100', 'city', '540000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (337, '昌都地区', '542100', 'city', '540000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (338, '山南地区', '542200', 'city', '540000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (339, '日喀则地区', '542300', 'city', '540000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (340, '那曲地区', '542400', 'city', '540000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (341, '阿里地区', '542500', 'city', '540000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (342, '林芝地区', '542600', 'city', '540000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (343, '西安市', '610100', 'city', '610000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (344, '铜川市', '610200', 'city', '610000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (345, '宝鸡市', '610300', 'city', '610000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (346, '咸阳市', '610400', 'city', '610000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (347, '渭南市', '610500', 'city', '610000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (348, '延安市', '610600', 'city', '610000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (349, '汉中市', '610700', 'city', '610000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (350, '榆林市', '610800', 'city', '610000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (351, '安康市', '610900', 'city', '610000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (352, '商洛市', '611000', 'city', '610000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (353, '兰州市', '620100', 'city', '620000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (354, '嘉峪关市', '620200', 'city', '620000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (355, '金昌市', '620300', 'city', '620000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (356, '白银市', '620400', 'city', '620000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (357, '天水市', '620500', 'city', '620000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (358, '武威市', '620600', 'city', '620000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (359, '张掖市', '620700', 'city', '620000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (360, '平凉市', '620800', 'city', '620000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (361, '酒泉市', '620900', 'city', '620000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (362, '庆阳市', '621000', 'city', '620000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (363, '定西市', '621100', 'city', '620000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (364, '陇南市', '621200', 'city', '620000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (365, '临夏回族自治州', '622900', 'city', '620000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (366, '甘南藏族自治州', '623000', 'city', '620000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (367, '西宁市', '630100', 'city', '630000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (368, '海东市', '632100', 'city', '630000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (369, '海北藏族自治州', '632200', 'city', '630000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (370, '黄南藏族自治州', '632300', 'city', '630000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (371, '海南藏族自治州', '632500', 'city', '630000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (372, '果洛藏族自治州', '632600', 'city', '630000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (373, '玉树藏族自治州', '632700', 'city', '630000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (374, '海西蒙古族藏族自治州', '632800', 'city', '630000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (375, '银川市', '640100', 'city', '640000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (376, '石嘴山市', '640200', 'city', '640000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (377, '吴忠市', '640300', 'city', '640000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (378, '固原市', '640400', 'city', '640000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (379, '中卫市', '640500', 'city', '640000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (380, '乌鲁木齐市', '650100', 'city', '650000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (381, '克拉玛依市', '650200', 'city', '650000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (382, '吐鲁番地区', '652100', 'city', '650000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (383, '哈密地区', '652200', 'city', '650000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (384, '昌吉回族自治州', '652300', 'city', '650000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (385, '博尔塔拉蒙古自治州', '652700', 'city', '650000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (386, '巴音郭楞蒙古自治州', '652800', 'city', '650000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (387, '阿克苏地区', '652900', 'city', '650000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (388, '克孜勒苏柯尔克孜自治州', '653000', 'city', '650000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (389, '喀什地区', '653100', 'city', '650000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (390, '和田地区', '653200', 'city', '650000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (391, '伊犁哈萨克自治州', '654000', 'city', '650000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (392, '塔城地区', '654200', 'city', '650000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (393, '阿勒泰地区', '654300', 'city', '650000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (394, '石河子市', '659001', 'city', '650000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (395, '阿拉尔市', '659002', 'city', '650000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (396, '图木舒克市', '659003', 'city', '650000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (397, '五家渠市', '659004', 'city', '650000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (398, '台北市', '710100', 'city', '710000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (399, '高雄市', '710200', 'city', '710000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (400, '台南市', '710300', 'city', '710000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (401, '台中市', '710400', 'city', '710000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (402, '金门县', '710500', 'city', '710000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (403, '南投县', '710600', 'city', '710000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (404, '基隆市', '710700', 'city', '710000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (405, '新竹市', '710800', 'city', '710000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (406, '嘉义市', '710900', 'city', '710000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (407, '新北市', '711100', 'city', '710000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (408, '宜兰县', '711200', 'city', '710000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (409, '新竹县', '711300', 'city', '710000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (410, '桃园县', '711400', 'city', '710000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (411, '苗栗县', '711500', 'city', '710000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (412, '彰化县', '711700', 'city', '710000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (413, '嘉义县', '711900', 'city', '710000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (414, '云林县', '712100', 'city', '710000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (415, '屏东县', '712400', 'city', '710000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (416, '台东县', '712500', 'city', '710000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (417, '花莲县', '712600', 'city', '710000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (418, '澎湖县', '712700', 'city', '710000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (419, '连江县', '712800', 'city', '710000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (420, '香港岛', '810100', 'city', '810000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (421, '九龙', '810200', 'city', '810000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (422, '新界', '810300', 'city', '810000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (423, '澳门半岛', '820100', 'city', '820000', '2019-02-28 17:16:58', NULL, '10001');
INSERT INTO `mscode_sys_region` (`id`, `region_name`, `region_code`, `region_type`, `parent_region_code`, `create_time`, `update_time`, `tenant_code`) VALUES (424, '离岛', '820200', 'city', '820000', '2019-02-28 17:16:58', NULL, '10001');
COMMIT;

-- ----------------------------
-- Table structure for mscode_sys_role
-- ----------------------------
DROP TABLE IF EXISTS `mscode_sys_role`;
CREATE TABLE `mscode_sys_role` (
  `id` bigint(20) NOT NULL COMMENT '角色主键ID',
  `role_code` varchar(32) NOT NULL COMMENT '角色编码',
  `role_name` varchar(64) NOT NULL COMMENT '角色名称',
  `role_description` varchar(256) DEFAULT NULL COMMENT '角色描述',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `tenant_code` varchar(64) DEFAULT '10001' COMMENT '租户编码',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_role_code` (`role_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='角色表';

-- ----------------------------
-- Records of mscode_sys_role
-- ----------------------------
BEGIN;
INSERT INTO `mscode_sys_role` (`id`, `role_code`, `role_name`, `role_description`, `create_time`, `update_time`, `tenant_code`) VALUES (665499597804064768, 'ROLE_ADMIN', '超级管理员', '超级管理员拥有所有权限', '2020-01-11 18:17:48', NULL, '10001');
INSERT INTO `mscode_sys_role` (`id`, `role_code`, `role_name`, `role_description`, `create_time`, `update_time`, `tenant_code`) VALUES (666858336536678400, 'ROLE_DEV', '开发角色', '开发人员属于开发角色', '2020-01-15 12:16:58', '2020-03-18 10:14:39', '10001');
INSERT INTO `mscode_sys_role` (`id`, `role_code`, `role_name`, `role_description`, `create_time`, `update_time`, `tenant_code`) VALUES (666858434746306560, 'ROLE_TEST', '测试角色', '测试人员属于测试角色', '2020-01-15 12:17:22', '2020-03-18 10:15:04', '10001');
INSERT INTO `mscode_sys_role` (`id`, `role_code`, `role_name`, `role_description`, `create_time`, `update_time`, `tenant_code`) VALUES (685031431038488576, 'ROLE_ANONYMOUS', '匿名角色', '无需登录就可以拥有的权限，比如注册', '2020-01-05 15:50:22', '2020-03-16 00:22:32', '10001');
INSERT INTO `mscode_sys_role` (`id`, `role_code`, `role_name`, `role_description`, `create_time`, `update_time`, `tenant_code`) VALUES (689659913718648832, 'ROLE_MANAGER', '管理角色', '管理人员属于管理角色', '2020-03-18 10:22:21', NULL, '10001');
INSERT INTO `mscode_sys_role` (`id`, `role_code`, `role_name`, `role_description`, `create_time`, `update_time`, `tenant_code`) VALUES (689660323321794560, 'ROLE_AGENT', '行政角色', '行政人员属于行政角色', '2020-03-18 10:23:58', NULL, '10001');
COMMIT;

-- ----------------------------
-- Table structure for mscode_sys_role_data
-- ----------------------------
DROP TABLE IF EXISTS `mscode_sys_role_data`;
CREATE TABLE `mscode_sys_role_data` (
  `id` bigint(20) NOT NULL COMMENT '角色与过滤数据关联主键ID',
  `role_code` varchar(32) NOT NULL COMMENT '角色编码',
  `menu_code` varchar(32) NOT NULL COMMENT '菜单编码',
  `data_field` varchar(40) NOT NULL COMMENT '过滤数据',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='角色与过滤数据关联表';

-- ----------------------------
-- Records of mscode_sys_role_data
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for mscode_sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `mscode_sys_role_menu`;
CREATE TABLE `mscode_sys_role_menu` (
  `id` bigint(20) NOT NULL COMMENT '角色与菜单关联主键ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色主键ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单主键ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='角色与菜单关联表';

-- ----------------------------
-- Records of mscode_sys_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (693699450014978048, 689659913718648832, 663854683370475520);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (693699450145001472, 689659913718648832, 687514791186976768);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (693699450254053376, 689659913718648832, 663854974853632000);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (693699450379882496, 689659913718648832, 693434079391436800);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (693699450497323008, 689659913718648832, 687563817764704256);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (693699450614763520, 689659913718648832, 665197875319721984);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (693699450715426816, 689659913718648832, 663863400497336320);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (693699450824478720, 689659913718648832, 663750580350930944);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (693699450929336320, 689659913718648832, 693698880994725888);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (693699451046776832, 689659913718648832, 663862460172128256);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (693699451164217344, 689659913718648832, 663863146888744960);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (693699451302629376, 689659913718648832, 663863700486541312);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (693699451403292672, 689659913718648832, 665198396457799680);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (693699451529121792, 689659913718648832, 665198241801228288);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (693699451680116736, 689659913718648832, 665198079427137536);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (693699451784974336, 689659913718648832, 663862916743090176);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (693699451902414848, 689659913718648832, 663862096987344896);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (693699494290051072, 689660323321794560, 663854683370475520);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (693699495976161280, 689660323321794560, 687514791186976768);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (693699499822338048, 689660323321794560, 663854974853632000);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (693699501500059648, 689660323321794560, 693434079391436800);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (693699502213091328, 689660323321794560, 687563817764704256);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (693699503492354048, 689660323321794560, 665197875319721984);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (693699503723040768, 689660323321794560, 663863400497336320);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (693699504046002176, 689660323321794560, 663750580350930944);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (693699507208507392, 689660323321794560, 693698880994725888);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (693699507640520704, 689660323321794560, 663862460172128256);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (693699508332580864, 689660323321794560, 663863146888744960);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (693699508525518848, 689660323321794560, 663863700486541312);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (693699508785565696, 689660323321794560, 665198396457799680);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (693699509326630912, 689660323321794560, 665198241801228288);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (693699509788004352, 689660323321794560, 665198079427137536);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (693699514204606464, 689660323321794560, 663862916743090176);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (693699514594676736, 689660323321794560, 663862096987344896);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495380777979904, 666858336536678400, 663857014669496320);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495380949946368, 666858336536678400, 687514791186976768);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495381038026752, 666858336536678400, 693434079391436800);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495381130301440, 666858336536678400, 663855944106954752);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495381214187520, 666858336536678400, 663866117546496000);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495381310656512, 666858336536678400, 699081036910743552);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495381423902720, 666858336536678400, 665197875319721984);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495381507788800, 666858336536678400, 663856793264771072);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495381608452096, 666858336536678400, 663863400497336320);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495381709115392, 666858336536678400, 663750580350930944);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495381805584384, 666858336536678400, 663865201925738496);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495381897859072, 666858336536678400, 693698880994725888);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495381990133760, 666858336536678400, 663862460172128256);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495382086602752, 666858336536678400, 684185040317763584);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495382174683136, 666858336536678400, 663856139884482560);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495382266957824, 666858336536678400, 663867140080062464);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495382363426816, 666858336536678400, 665198396457799680);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495382459895808, 666858336536678400, 663857253375725568);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495382560559104, 666858336536678400, 663865503307452416);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495382665416704, 666858336536678400, 663864697992695808);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495382761885696, 666858336536678400, 665496626324230144);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495382849966080, 666858336536678400, 663865799052021760);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495382946435072, 666858336536678400, 665198079427137536);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495383042904064, 666858336536678400, 663864025209556992);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495383147761664, 666858336536678400, 663854683370475520);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495383240036352, 666858336536678400, 663854974853632000);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495383332311040, 666858336536678400, 663866797015355392);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495383424585728, 666858336536678400, 693762978637860864);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495383521054720, 666858336536678400, 693762431952277504);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495383625912320, 666858336536678400, 663867636220088320);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495383718187008, 666858336536678400, 690019670816116736);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495383856599040, 666858336536678400, 663856370193715200);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495383953068032, 666858336536678400, 687563817764704256);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495384066314240, 666858336536678400, 663867371509174272);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495384171171840, 666858336536678400, 663864915588993024);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495384267640832, 666858336536678400, 663855709905408000);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495384380887040, 666858336536678400, 663863146888744960);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495384468967424, 666858336536678400, 663863700486541312);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495384561242112, 666858336536678400, 663866457184456704);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495384661905408, 666858336536678400, 663864263244697600);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495384762568704, 666858336536678400, 665198241801228288);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495384859037696, 666858336536678400, 663855492212641792);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495384951312384, 666858336536678400, 663862916743090176);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495385043587072, 666858336536678400, 663856596409307136);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495385144250368, 666858336536678400, 663862096987344896);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495733544112128, 666858434746306560, 687514791186976768);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495733665746944, 666858434746306560, 693434079391436800);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495733795770368, 666858434746306560, 663866117546496000);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495733938376704, 666858434746306560, 665197875319721984);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495734039040000, 666858434746306560, 663863400497336320);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495734131314688, 666858434746306560, 663750580350930944);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495734261338112, 666858434746306560, 693698880994725888);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495734420721664, 666858434746306560, 663865201925738496);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495734529773568, 666858434746306560, 663862460172128256);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495734668185600, 666858434746306560, 663867140080062464);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495734785626112, 666858434746306560, 665198396457799680);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495734936621056, 666858434746306560, 663865503307452416);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495735041478656, 666858434746306560, 663864697992695808);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495735167307776, 666858434746306560, 663865799052021760);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495735284748288, 666858434746306560, 665198079427137536);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495735406383104, 666858434746306560, 663864025209556992);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495735532212224, 666858434746306560, 663854683370475520);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495735641264128, 666858434746306560, 663866797015355392);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495735771287552, 666858434746306560, 663854974853632000);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495735884533760, 666858434746306560, 693762978637860864);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495735981002752, 666858434746306560, 693762431952277504);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495736186523648, 666858434746306560, 663867636220088320);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495736287186944, 666858434746306560, 687563817764704256);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495736396238848, 666858434746306560, 663867371509174272);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495736505290752, 666858434746306560, 663864915588993024);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495736618536960, 666858434746306560, 663855709905408000);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495736715005952, 666858434746306560, 663863146888744960);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495736815669248, 666858434746306560, 663863700486541312);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495736916332544, 666858434746306560, 663866457184456704);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495737016995840, 666858434746306560, 663864263244697600);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495737117659136, 666858434746306560, 665198241801228288);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495737218322432, 666858434746306560, 663855492212641792);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495737331568640, 666858434746306560, 663862916743090176);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (708495737428037632, 666858434746306560, 663862096987344896);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381806433685504, 665499597804064768, 687514791186976768);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381807012499456, 665499597804064768, 665197381171990528);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381807201243136, 665499597804064768, 665564620060545024);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381807310295040, 665499597804064768, 699081036910743552);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381807473872896, 665499597804064768, 665006035807162368);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381807591313408, 665499597804064768, 665197875319721984);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381807704559616, 665499597804064768, 665198983094128640);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381807809417216, 665499597804064768, 663863400497336320);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381807947829248, 665499597804064768, 705593293912068096);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381808048492544, 665499597804064768, 665004888883122176);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381808165933056, 665499597804064768, 693698880994725888);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381808266596352, 665499597804064768, 666473278365683712);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381808908324864, 665499597804064768, 684185040317763584);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381809029959680, 665499597804064768, 663862460172128256);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381809143205888, 665499597804064768, 663867140080062464);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381809629745152, 665499597804064768, 663868238819938304);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381810057564160, 665499597804064768, 663857253375725568);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381810204364800, 665499597804064768, 663867981964955648);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381810325999616, 665499597804064768, 665564219978469376);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381810464411648, 665499597804064768, 663864697992695808);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381810737041408, 665499597804064768, 665197527700000768);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381811047419904, 665499597804064768, 665198079427137536);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381811227774976, 665499597804064768, 663864025209556992);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381811403935744, 665499597804064768, 692361087815176192);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381811559124992, 665499597804064768, 663854683370475520);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381811722702848, 665499597804064768, 665199423219224576);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381812049858560, 665499597804064768, 663866797015355392);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381812372819968, 665499597804064768, 663854974853632000);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381812473483264, 665499597804064768, 663856370193715200);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381812578340864, 665499597804064768, 690019670816116736);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381812691587072, 665499597804064768, 663867371509174272);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381812800638976, 665499597804064768, 665199936786583552);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381812926468096, 665499597804064768, 663861613581225984);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381813111017472, 665499597804064768, 665007802225709056);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381813253623808, 665499597804064768, 663864915588993024);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381813375258624, 665499597804064768, 665009153424936960);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381813517864960, 665499597804064768, 663868640676204544);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381813626916864, 665499597804064768, 665005583355006976);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381813752745984, 665499597804064768, 665010791703302144);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381813886963712, 665499597804064768, 665010520889675776);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381814457389056, 665499597804064768, 665199632426913792);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381814700658688, 665499597804064768, 665198241801228288);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381814809710592, 665499597804064768, 663855492212641792);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381814914568192, 665499597804064768, 665192716074143744);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381815023620096, 665499597804064768, 663857014669496320);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381815141060608, 665499597804064768, 665007437736497152);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381815350775808, 665499597804064768, 665003871265280000);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381815841509376, 665499597804064768, 665007146580496384);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381816273522688, 665499597804064768, 663855944106954752);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381816822976512, 665499597804064768, 693434079391436800);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381817393401856, 665499597804064768, 663866117546496000);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381817556979712, 665499597804064768, 663868873103560704);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381817678614528, 665499597804064768, 665006303672193024);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381817812832256, 665499597804064768, 663856793264771072);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381817921884160, 665499597804064768, 705595098737856512);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381818022547456, 665499597804064768, 666473881804394496);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381818127405056, 665499597804064768, 663750580350930944);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381818253234176, 665499597804064768, 663865201925738496);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381818362286080, 665499597804064768, 663856139884482560);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381818462949376, 665499597804064768, 665191788055023616);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381818769133568, 665499597804064768, 665199223704571904);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381818903351296, 665499597804064768, 665199774022422528);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381819033374720, 665499597804064768, 665010657795952640);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381819167592448, 665499597804064768, 665198396457799680);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381819293421568, 665499597804064768, 663865503307452416);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381819402473472, 665499597804064768, 665006779776028672);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381819536691200, 665499597804064768, 663869085146599424);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381819645743104, 665499597804064768, 665496626324230144);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381819750600704, 665499597804064768, 663865799052021760);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381819863846912, 665499597804064768, 765381334624817152);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381819981287424, 665499597804064768, 663861404352565248);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381820119699456, 665499597804064768, 665006482060136448);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381820325220352, 665499597804064768, 665197219141832704);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381820509769728, 665499597804064768, 693762978637860864);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381820648181760, 665499597804064768, 693762431952277504);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381820786593792, 665499597804064768, 663867636220088320);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381821050834944, 665499597804064768, 665734849524846592);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381821294104576, 665499597804064768, 687563817764704256);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381821411545088, 665499597804064768, 665009726589161472);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381821566734336, 665499597804064768, 663855709905408000);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381821717729280, 665499597804064768, 663863146888744960);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381821839364096, 665499597804064768, 663863700486541312);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381821965193216, 665499597804064768, 665004465291972608);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381822065856512, 665499597804064768, 665730162285268992);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381822166519808, 665499597804064768, 663866457184456704);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381822275571712, 665499597804064768, 663864263244697600);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381822401400832, 665499597804064768, 665192197972742144);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381822795665408, 665499597804064768, 663856596409307136);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381823550640128, 665499597804064768, 663862916743090176);
INSERT INTO `mscode_sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (765381824288837632, 665499597804064768, 663862096987344896);
COMMIT;

-- ----------------------------
-- Table structure for mscode_sys_role_menubutton
-- ----------------------------
DROP TABLE IF EXISTS `mscode_sys_role_menubutton`;
CREATE TABLE `mscode_sys_role_menubutton` (
  `id` bigint(20) NOT NULL COMMENT '角色与菜单按钮关联主键ID',
  `role_code` varchar(32) NOT NULL COMMENT '角色编码',
  `menu_button` varchar(40) NOT NULL COMMENT '菜单按钮',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='角色与菜单按钮关联表';

-- ----------------------------
-- Records of mscode_sys_role_menubutton
-- ----------------------------
BEGIN;
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690844739284946944, 'ROLE_AGENT', 'mynotification:view');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690897292378951680, 'ROLE_MANAGER', 'mynotification:view');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690897328621932533, 'ROLE_TEST', 'generator:generate');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690897328621932544, 'ROLE_TEST', 'mynotification:view');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898181374267392, 'ROLE_ANONYMOUS', 'mynotification:view');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898181474930688, 'ROLE_ANONYMOUS', 'sysrole:add');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898181567205376, 'ROLE_ANONYMOUS', 'sysrole:update');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898181659480064, 'ROLE_ANONYMOUS', 'sysrole:delete');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898181751754752, 'ROLE_ANONYMOUS', 'sysrole:export');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898181848223744, 'ROLE_ANONYMOUS', 'sysrole:authorize');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898181953081344, 'ROLE_ANONYMOUS', 'sysurl:update');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898182041161728, 'ROLE_ANONYMOUS', 'sysurl:add');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898182137630720, 'ROLE_ANONYMOUS', 'sysurl:delete');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898182234099712, 'ROLE_ANONYMOUS', 'sysurl:export');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898182326374400, 'ROLE_ANONYMOUS', 'sysurl:authorize');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898182422843392, 'ROLE_ANONYMOUS', 'datapermission:authorize');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898182515118080, 'ROLE_ANONYMOUS', 'sysuser:delete');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898182624169984, 'ROLE_ANONYMOUS', 'sysuser:export');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898182708056064, 'ROLE_ANONYMOUS', 'sysuser:add');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898182804525056, 'ROLE_ANONYMOUS', 'sysuser:update');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898182905188352, 'ROLE_ANONYMOUS', 'sysmenu:add');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898183001657344, 'ROLE_ANONYMOUS', 'sysmenu:update');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898183098126336, 'ROLE_ANONYMOUS', 'sysmenu:delete');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898183190401024, 'ROLE_ANONYMOUS', 'sysmenu:export');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898183291064320, 'ROLE_ANONYMOUS', 'sysorg:export');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898183383339008, 'ROLE_ANONYMOUS', 'sysorg:add');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898183492390912, 'ROLE_ANONYMOUS', 'sysorg:update');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898183593054208, 'ROLE_ANONYMOUS', 'sysorg:delete');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898183714689024, 'ROLE_ANONYMOUS', 'sysdict:delete');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898183806963712, 'ROLE_ANONYMOUS', 'sysdict:add');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898183907627008, 'ROLE_ANONYMOUS', 'sysdict:update');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898183999901696, 'ROLE_ANONYMOUS', 'sysdict:export');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898184092176384, 'ROLE_ANONYMOUS', 'sysregion:export');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898184197033984, 'ROLE_ANONYMOUS', 'sysregion:delete');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898184297697280, 'ROLE_ANONYMOUS', 'sysregion:update');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898184385777664, 'ROLE_ANONYMOUS', 'sysregion:add');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898184490635264, 'ROLE_ANONYMOUS', 'sysparam:update');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898184599687168, 'ROLE_ANONYMOUS', 'sysparam:add');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898184691961856, 'ROLE_ANONYMOUS', 'sysparam:delete');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898184792625152, 'ROLE_ANONYMOUS', 'sysparam:export');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898184897482752, 'ROLE_ANONYMOUS', 'notification:add');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898185010728960, 'ROLE_ANONYMOUS', 'notification:update');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898185098809344, 'ROLE_ANONYMOUS', 'notification:delete');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898185199472640, 'ROLE_ANONYMOUS', 'systenant:delete');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898185300135936, 'ROLE_ANONYMOUS', 'systenant:export');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898185396604928, 'ROLE_ANONYMOUS', 'systenant:update');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898185484685312, 'ROLE_ANONYMOUS', 'systenant:add');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898185589542912, 'ROLE_ANONYMOUS', 'startprocess:start');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898185694400512, 'ROLE_ANONYMOUS', 'startprocess:preview');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898185782480896, 'ROLE_ANONYMOUS', 'myprocess:track');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898185887338496, 'ROLE_ANONYMOUS', 'candidatetask:track');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898185979613184, 'ROLE_ANONYMOUS', 'candidatetask:assign');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898186076082176, 'ROLE_ANONYMOUS', 'assigneetask:track');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898186168356864, 'ROLE_ANONYMOUS', 'assigneetask:complete');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898186269020160, 'ROLE_ANONYMOUS', 'assigneetask:delegate');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898186373877760, 'ROLE_ANONYMOUS', 'assigneetask:regress');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898186487123968, 'ROLE_ANONYMOUS', 'assigneetask:reject');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898186579398656, 'ROLE_ANONYMOUS', 'assigneetask:terminate');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898186675867648, 'ROLE_ANONYMOUS', 'finishedtask:track');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898186768142336, 'ROLE_ANONYMOUS', 'model:update');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898186881388544, 'ROLE_ANONYMOUS', 'model:add');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898186982051840, 'ROLE_ANONYMOUS', 'model:delete');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898187074326528, 'ROLE_ANONYMOUS', 'model:design');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898187174989824, 'ROLE_ANONYMOUS', 'model:deploy');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898187267264512, 'ROLE_ANONYMOUS', 'deployment:delete');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898187372122112, 'ROLE_ANONYMOUS', 'deployment:preview');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898187476979712, 'ROLE_ANONYMOUS', 'deployment:download');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898187586031616, 'ROLE_ANONYMOUS', 'processdefinition:activate');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898187720249344, 'ROLE_ANONYMOUS', 'processdefinition:suspend');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898187820912640, 'ROLE_ANONYMOUS', 'processdefinition:preview');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898187921575936, 'ROLE_ANONYMOUS', 'processdefinition:download');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898188013850624, 'ROLE_ANONYMOUS', 'processinstance:execution');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898188106125312, 'ROLE_ANONYMOUS', 'processinstance:activate');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898188206788608, 'ROLE_ANONYMOUS', 'processinstance:suspend');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898188299063296, 'ROLE_ANONYMOUS', 'processinstance:track');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898188395532288, 'ROLE_ANONYMOUS', 'processinstance:delete');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898188492001280, 'ROLE_ANONYMOUS', 'task:track');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898188596858880, 'ROLE_ANONYMOUS', 'task:execution');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898188701716480, 'ROLE_ANONYMOUS', 'historicprocessinstance:delete');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898188789796864, 'ROLE_ANONYMOUS', 'historicprocessinstance:activity');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898188882071552, 'ROLE_ANONYMOUS', 'historicprocessinstance:detail');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898188995317760, 'ROLE_ANONYMOUS', 'historicprocessinstance:variable');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898189154701312, 'ROLE_ANONYMOUS', 'historictaskinstance:delete');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898189246976000, 'ROLE_ANONYMOUS', 'uploaddownload:delete');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898189347639296, 'ROLE_ANONYMOUS', 'uploaddownload:upload');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898189448302592, 'ROLE_ANONYMOUS', 'uploaddownload:download');
INSERT INTO `mscode_sys_role_menubutton` (`id`, `role_code`, `menu_button`) VALUES (690898189540577280, 'ROLE_ANONYMOUS', 'generator:generate');
COMMIT;

-- ----------------------------
-- Table structure for mscode_sys_role_url
-- ----------------------------
DROP TABLE IF EXISTS `mscode_sys_role_url`;
CREATE TABLE `mscode_sys_role_url` (
  `id` bigint(20) NOT NULL COMMENT '接口与角色关联主键ID',
  `url_id` bigint(20) NOT NULL COMMENT '接口主键ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色主键ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='接口与角色关联表';

-- ----------------------------
-- Records of mscode_sys_role_url
-- ----------------------------
BEGIN;
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689707686501470208, 688745051211616256, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689707686627299328, 688745051211616256, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689707686723768320, 688745051211616256, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689707686841208832, 688745051211616256, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689707686971232256, 688745051211616256, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689707890181066752, 688744859523534848, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689707899798605824, 688744859523534848, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689707900004126720, 688744859523534848, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689707900113178624, 688744859523534848, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689707900222230528, 688744859523534848, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689707937278906368, 688682790149345280, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689707937379569664, 688682790149345280, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689707937471844352, 688682790149345280, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689707937568313344, 688682790149345280, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689707937694142464, 688682790149345280, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689707970627817472, 684889310419668992, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689707971005304832, 684889310419668992, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689707971160494080, 684889310419668992, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689707971277934592, 684889310419668992, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689707971458289664, 684889310419668992, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708003959951360, 684889214944727040, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708004069003264, 684889214944727040, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708004178055168, 684889214944727040, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708004278718464, 684889214944727040, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708004370993152, 684889214944727040, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708050558668800, 684889142488125440, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708050650943488, 684889142488125440, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708050751606784, 684889142488125440, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708050852270080, 684889142488125440, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708050952933376, 684889142488125440, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708115511660544, 684889046551810048, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708115612323840, 684889046551810048, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708115721375744, 684889046551810048, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708115826233344, 684889046551810048, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708115960451072, 684889046551810048, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708151813361664, 684888965530439680, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708151909830656, 684888965530439680, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708152018882560, 684888965530439680, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708152106962944, 684888965530439680, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708152211820544, 684888965530439680, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708183002206208, 684888875461955584, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708183237087232, 684888875461955584, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708183333556224, 684888875461955584, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708183438413824, 684888875461955584, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708183534882816, 684888875461955584, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708208281276416, 684888798362259456, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708208377745408, 684888798362259456, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708208490991616, 684888798362259456, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708208583266304, 684888798362259456, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708208700706816, 684888798362259456, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708359142002688, 684888723024171008, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708359292997632, 684888723024171008, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708359385272320, 684888723024171008, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708359485935616, 684888723024171008, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708359586598912, 684888723024171008, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708409100357632, 684888629210173440, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708409209409536, 684888629210173440, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708409310072832, 684888629210173440, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708409414930432, 684888629210173440, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708409586896896, 684888629210173440, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708452788228096, 684888543952556032, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708453006331904, 684888543952556032, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708453106995200, 684888543952556032, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708453199269888, 684888543952556032, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708453295738880, 684888543952556032, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708524343054336, 684887626117206016, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708524426940416, 684887626117206016, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708524540186624, 684887626117206016, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708524636655616, 684887626117206016, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708524745707520, 684887626117206016, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708573483520000, 684887550225469440, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708573575794688, 684887550225469440, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708573663875072, 684887550225469440, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708573777121280, 684887550225469440, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708573869395968, 684887550225469440, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708619713138688, 684887466700099584, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708619906076672, 684887466700099584, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708620019322880, 684887466700099584, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708620119986176, 684887466700099584, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708620212260864, 684887466700099584, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708669684076544, 684887386920243200, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708669784739840, 684887386920243200, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708669889597440, 684887386920243200, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708669990260736, 684887386920243200, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708670082535424, 684887386920243200, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708705964806144, 684887315247976448, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708706061275136, 684887315247976448, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708706161938432, 684887315247976448, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708706275184640, 684887315247976448, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708706375847936, 684887315247976448, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708738768457728, 684887237313613824, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708738873315328, 684887237313613824, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708738961395712, 684887237313613824, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708739057864704, 684887237313613824, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708739183693824, 684887237313613824, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708772608102400, 684887164995424256, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708772712960000, 684887164995424256, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708772817817600, 684887164995424256, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708772918480896, 684887164995424256, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708773014949888, 684887164995424256, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708932377530368, 684887088273215488, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708932469805056, 684887088273215488, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708932566274048, 684887088273215488, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708932658548736, 684887088273215488, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708932771794944, 684887088273215488, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708977441132544, 684887016458342400, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708977541795840, 684887016458342400, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708977646653440, 684887016458342400, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708977755705344, 684887016458342400, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689708977847980032, 684887016458342400, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689709020902510592, 684886934942044160, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689709020990590976, 684886934942044160, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689709021099642880, 684886934942044160, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689709021200306176, 684886934942044160, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689709021317746688, 684886934942044160, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689709076594479104, 684886859419406336, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689709076762251264, 684886859419406336, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689709076862914560, 684886859419406336, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689709076980355072, 684886859419406336, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689709077081018368, 684886859419406336, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689709119397351424, 684886776212803584, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689709119498014720, 684886776212803584, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689709119598678016, 684886776212803584, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689709119707729920, 684886776212803584, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689709119812587520, 684886776212803584, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689709160962904064, 684886692251226112, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689709161071955968, 684886692251226112, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689709161172619264, 684886692251226112, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689709161264893952, 684886692251226112, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689709161373945856, 684886692251226112, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689709196991975424, 684886297403641856, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689709197080055808, 684886297403641856, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689709197205884928, 684886297403641856, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689709197361074176, 684886297403641856, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689709197449154560, 684886297403641856, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689709226373074944, 684886223940407296, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689709226473738240, 684886223940407296, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689709226566012928, 684886223940407296, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689709226662481920, 684886223940407296, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689709226758950912, 684886223940407296, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689709262465060864, 684886153950056448, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689709262574112768, 684886153950056448, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689709262666387456, 684886153950056448, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689709262767050752, 684886153950056448, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689709262897074176, 684886153950056448, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689709293926535168, 684886071976579072, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689709294039781376, 684886071976579072, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689709294140444672, 684886071976579072, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689709294249496576, 684886071976579072, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689709294341771264, 684886071976579072, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689709443113734144, 684885993023000576, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689709444166504448, 684885993023000576, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689709444304916480, 684885993023000576, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689709444464300032, 684885993023000576, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689709444594323456, 684885993023000576, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689709838498189312, 684885537890684928, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689709838594658304, 684885537890684928, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689709838695321600, 684885537890684928, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689709838812762112, 684885537890684928, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689709838913425408, 684885537890684928, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689709977161879552, 684885464762994688, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689709977258348544, 684885464762994688, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689709977359011840, 684885464762994688, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689709977459675136, 684885464762994688, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689709977560338432, 684885464762994688, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689710042857263104, 684885277399240704, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689710043012452352, 684885277399240704, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689710043117309952, 684885277399240704, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689710043230556160, 684885277399240704, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689710043494797312, 684885277399240704, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689710138328010752, 684885190241603584, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689710139116539904, 684885190241603584, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689710139733102592, 684885190241603584, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689710140139950080, 684885190241603584, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689710140660043776, 684885190241603584, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689710192082210816, 684884374638219264, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689710192208039936, 684884374638219264, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689710192497446912, 684884374638219264, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689710192614887424, 684884374638219264, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689710192719745024, 684884374638219264, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689710290308616192, 684884281163960320, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689710290405085184, 684884281163960320, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689710290497359872, 684884281163960320, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689710290593828864, 684884281163960320, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689710290694492160, 684884281163960320, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689710331400212480, 684884189593915392, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689710331505070080, 684884189593915392, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689710331597344768, 684884189593915392, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689710331702202368, 684884189593915392, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689710331878363136, 684884189593915392, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689710361293017088, 684883976632324096, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689710361376903168, 684883976632324096, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689710361473372160, 684883976632324096, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689710361561452544, 684883976632324096, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689710361699864576, 684883976632324096, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689710424199188480, 684883899876560896, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689710425419730944, 684883899876560896, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689710427504300032, 684883899876560896, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689710433103695872, 684883899876560896, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689710437314777088, 684883899876560896, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689710598556405760, 684882948545499136, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689710598661263360, 684882948545499136, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689710598749343744, 684882948545499136, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689710598866784256, 684882948545499136, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689710599009390592, 684882948545499136, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689710644005883904, 684882871139618816, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689710644110741504, 684882871139618816, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689710644328845312, 684882871139618816, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689710644416925696, 684882871139618816, 685031431038488576);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689710644630835200, 684882871139618816, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689710644748275712, 684882871139618816, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689710683361038336, 684882799698038784, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689710683486867456, 684882799698038784, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689710683797245952, 684882799698038784, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689710684170539008, 684882799698038784, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689710684283785216, 684882799698038784, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689710728902791168, 684882726352244736, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689710728999260160, 684882726352244736, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689710730383380480, 684882726352244736, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689710731259990016, 684882726352244736, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689710731427762176, 684882726352244736, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689710784129191936, 684882639978942464, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689710784250826752, 684882639978942464, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689710784355684352, 684882639978942464, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689710784481513472, 684882639978942464, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689710786415087616, 684882639978942464, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689710910088335360, 684882564108177408, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689710910969139200, 684882564108177408, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689710911174660096, 684882564108177408, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689710911342432256, 684882564108177408, 685031431038488576);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689710911539564544, 684882564108177408, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689710911669587968, 684882564108177408, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689710983291523072, 684882482570907648, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689710983383797760, 684882482570907648, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689710983488655360, 684882482570907648, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689710983580930048, 684882482570907648, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689710983673204736, 684882482570907648, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689711033749000192, 684882225053224960, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689711033992269824, 684882225053224960, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689711036110393344, 684882225053224960, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689711038333374464, 684882225053224960, 685031431038488576);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689711042133413888, 684882225053224960, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689711045165895680, 684882225053224960, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689711165148155904, 684882140286341120, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689711166872014848, 684882140286341120, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689711168038031360, 684882140286341120, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689711176124649472, 684882140286341120, 685031431038488576);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689711185033351168, 684882140286341120, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689711186253893632, 684882140286341120, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689711408073854976, 684881588437569536, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689711408505868288, 684881588437569536, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689711408610725888, 684881588437569536, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689711409520889856, 684881588437569536, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689711409793519616, 684881588437569536, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689711549061189632, 684881491641421824, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689711549245739008, 684881491641421824, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689711549384151040, 684881491641421824, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689711549614837760, 684881491641421824, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689711549891661824, 684881491641421824, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689711676890992640, 684881405427503104, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689711683773845504, 684881405427503104, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689711684688203776, 684881405427503104, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689711685996826624, 684881405427503104, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689711687628410880, 684881405427503104, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689711832851992576, 684881326138380288, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689711834928173056, 684881326138380288, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689711836803026944, 684881326138380288, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689711837151154176, 684881326138380288, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689711837448949760, 684881326138380288, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689711907217002496, 684881249260982272, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689711908701786112, 684881249260982272, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689711910362730496, 684881249260982272, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689711911168036864, 684881249260982272, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689711913663647744, 684881249260982272, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689711967795335168, 684881171750244352, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689711968038604800, 684881171750244352, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689711968256708608, 684881171750244352, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689711968739053568, 684881171750244352, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689711968927797248, 684881171750244352, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712025412489216, 684881078250819584, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712044664344576, 684881078250819584, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712045029249024, 684881078250819584, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712045402542080, 684881078250819584, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712046509838336, 684881078250819584, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712106626797568, 684880978854203392, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712107281108992, 684880978854203392, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712110015795200, 684880978854203392, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712110804324352, 684880978854203392, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712111123091456, 684880978854203392, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712167112855552, 684880515022901248, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712167330959360, 684880515022901248, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712167423234048, 684880515022901248, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712167515508736, 684880515022901248, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712167670697984, 684880515022901248, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712212516196352, 684880444214661120, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712212612665344, 684880444214661120, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712212725911552, 684880444214661120, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712212818186240, 684880444214661120, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712212910460928, 684880444214661120, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712254199189504, 684880364602576896, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712254337601536, 684880364602576896, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712254652174336, 684880364602576896, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712255008690176, 684880364602576896, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712255092576256, 684880364602576896, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712373145456640, 684880293827891200, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712373472612352, 684880293827891200, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712373665550336, 684880293827891200, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712374013677568, 684880293827891200, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712374227587072, 684880293827891200, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712426215985152, 684880224517017600, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712428040507392, 684880224517017600, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712428896145408, 684880224517017600, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712430456426496, 684880224517017600, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712430762610688, 684880224517017600, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712515693072384, 684880149241843712, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712515823095808, 684880149241843712, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712516146057216, 684880149241843712, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712516523544576, 684880149241843712, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712516867477504, 684880149241843712, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712585008140288, 684880069084499968, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712586178351104, 684880069084499968, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712586841051136, 684880069084499968, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712587197566976, 684880069084499968, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712587356950528, 684880069084499968, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712662837645312, 684879626841280512, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712663026388992, 684879626841280512, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712663139635200, 684879626841280512, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712663240298496, 684879626841280512, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712664188211200, 684879626841280512, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712716608622592, 684879546537136128, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712716734451712, 684879546537136128, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712716847697920, 684879546537136128, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712716960944128, 684879546537136128, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712717061607424, 684879546537136128, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712757779910656, 684879476056051712, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712757893156864, 684879476056051712, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712758010597376, 684879476056051712, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712758132232192, 684879476056051712, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712758237089792, 684879476056051712, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712797185396736, 684879399543558144, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712797298642944, 684879399543558144, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712797399306240, 684879399543558144, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712797504163840, 684879399543558144, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712797613215744, 684879399543558144, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712832572739584, 684879309210832896, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712833201885184, 684879309210832896, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712834279821312, 684879309210832896, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712834481147904, 684879309210832896, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712835273871360, 684879309210832896, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712875715350528, 684878768925757440, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712875857956864, 684878768925757440, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712875962814464, 684878768925757440, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712876260610048, 684878768925757440, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712876382244864, 684878768925757440, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712979134304256, 684878665326448640, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712979599872000, 684878665326448640, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712980656836608, 684878665326448640, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712981646692352, 684878665326448640, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689712982158397440, 684878665326448640, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713030615191552, 684878582367309824, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713031101730816, 684878582367309824, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713031311446016, 684878582367309824, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713031965757440, 684878582367309824, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713032846561280, 684878582367309824, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713074953179136, 684878495394222080, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713075183865856, 684878495394222080, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713075355832320, 684878495394222080, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713075460689920, 684878495394222080, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713075649433600, 684878495394222080, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713115763757056, 684878411596222464, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713115881197568, 684878411596222464, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713116002832384, 684878411596222464, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713116107689984, 684878411596222464, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713116208353280, 684878411596222464, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713165139103744, 684878246143512576, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713165243961344, 684878246143512576, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713165361401856, 684878246143512576, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713165466259456, 684878246143512576, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713165596282880, 684878246143512576, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713251688566784, 684771532190699520, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713251793424384, 684771532190699520, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713251881504768, 684771532190699520, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713251986362368, 684771532190699520, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713252170911744, 684771532190699520, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713286476124160, 684771462737219584, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713286585176064, 684771462737219584, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713286673256448, 684771462737219584, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713286773919744, 684771462737219584, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713286987829248, 684771462737219584, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713321423065088, 684771386413469696, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713321632780288, 684771386413469696, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713321725054976, 684771386413469696, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713321838301184, 684771386413469696, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713321926381568, 684771386413469696, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713358827868160, 684771320659365888, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713359142440960, 684771320659365888, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713359662534656, 684771320659365888, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713359922581504, 684771320659365888, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713360094547968, 684771320659365888, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713471633674240, 684771247170965504, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713471784669184, 684771247170965504, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713471872749568, 684771247170965504, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713471969218560, 684771247170965504, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713472061493248, 684771247170965504, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713531687718912, 684771168280301568, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713533419966464, 684771168280301568, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713534019751936, 684771168280301568, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713534481125376, 684771168280301568, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713534791503872, 684771168280301568, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713580433920000, 684771102517809152, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713581067259904, 684771102517809152, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713584665972736, 684771102517809152, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713586654072832, 684771102517809152, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713587761369088, 684771102517809152, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713646825558016, 684771029394313216, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713646989135872, 684771029394313216, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713647387594752, 684771029394313216, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713647983185920, 684771029394313216, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713648289370112, 684771029394313216, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713697203343360, 684770954010087424, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713697308200960, 684770954010087424, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713697413058560, 684770954010087424, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713697656328192, 684770954010087424, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713697765380096, 684770954010087424, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713761707544576, 684770585469177856, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713764089909248, 684770585469177856, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713766426136576, 684770585469177856, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713769433452544, 684770585469177856, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713770033238016, 684770585469177856, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713834277392384, 684770515940200448, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713834424193024, 684770515940200448, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713834558410752, 684770515940200448, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713834667462656, 684770515940200448, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713834784903168, 684770515940200448, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713877852016640, 684770436755935232, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713880003694592, 684770436755935232, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713880670588928, 684770436755935232, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713881513644032, 684770436755935232, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713881735942144, 684770436755935232, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713952858755072, 684770356900581376, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713953236242432, 684770356900581376, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713953437569024, 684770356900581376, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713953739558912, 684770356900581376, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713954091880448, 684770356900581376, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713996773117952, 684770137630756864, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713996940890112, 684770137630756864, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713997687476224, 684770137630756864, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713998241124352, 684770137630756864, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689713998404702208, 684770137630756864, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714103333605376, 684769620938641408, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714103602040832, 684769620938641408, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714103757230080, 684769620938641408, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714103916613632, 684769620938641408, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714104134717440, 684769620938641408, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714155204562944, 684769547852894208, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714155460415488, 684769547852894208, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714155892428800, 684769547852894208, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714156282499072, 684769547852894208, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714156446076928, 684769547852894208, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714211391459328, 684769473689210880, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714211525677056, 684769473689210880, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714211672477696, 684769473689210880, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714211810889728, 684769473689210880, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714211945107456, 684769473689210880, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714263304359936, 684769405045231616, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714263526658048, 684769405045231616, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714263769927680, 684769405045231616, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714263954477056, 684769405045231616, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714264302604288, 684769405045231616, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714312646152192, 684769311214456832, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714312922976256, 684769311214456832, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714313124302848, 684769311214456832, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714313233354752, 684769311214456832, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714313405321216, 684769311214456832, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714361518182400, 684769228750245888, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714361723703296, 684769228750245888, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714362151522304, 684769228750245888, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714362512232448, 684769228750245888, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714362952634368, 684769228750245888, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714444401823744, 684769150585196544, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714444544430080, 684769150585196544, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714444770922496, 684769150585196544, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714445039357952, 684769150585196544, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714445236490240, 684769150585196544, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714516736790528, 684768417576046592, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714517198163968, 684768417576046592, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714517663731712, 684768417576046592, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714517986693120, 684768417576046592, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714518217379840, 684768417576046592, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714558285565952, 684768347812188160, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714558499475456, 684768347812188160, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714558927294464, 684768347812188160, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714559292198912, 684768347812188160, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714559506108416, 684768347812188160, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714594792787968, 684768272050475008, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714595107360768, 684768272050475008, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714595287715840, 684768272050475008, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714595455488000, 684768272050475008, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714595661008896, 684768272050475008, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714642876289024, 684768194908835840, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714643211833344, 684768194908835840, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714643459297280, 684768194908835840, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714643648040960, 684768194908835840, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714643861950464, 684768194908835840, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714710186479616, 684768109798019072, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714710312308736, 684768109798019072, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714710429749248, 684768109798019072, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714710626881536, 684768109798019072, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714710773682176, 684768109798019072, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714783435804672, 684767949105844224, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714783557439488, 684767949105844224, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714783674880000, 684767949105844224, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714783825874944, 684767949105844224, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714784006230016, 684767949105844224, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714838779645952, 684767840410456064, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714838955806720, 684767840410456064, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714839211659264, 684767840410456064, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714840344121344, 684767840410456064, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714844915912704, 684767840410456064, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714893980880896, 684767758093045760, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714894249316352, 684767758093045760, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714894677135360, 684767758093045760, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714895075594240, 684767758093045760, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714895281115136, 684767758093045760, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714939459719168, 684767185939648512, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714939627491328, 684767185939648512, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714939723960320, 684767185939648512, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714939874955264, 684767185939648512, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714940042727424, 684767185939648512, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714980945580032, 684767088023621632, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714981071409152, 684767088023621632, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714981335650304, 684767088023621632, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714981453090816, 684767088023621632, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689714981612474368, 684767088023621632, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715024012693504, 684766992989081600, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715024205631488, 684766992989081600, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715024608284672, 684766992989081600, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715024893497344, 684766992989081600, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715025493282816, 684766992989081600, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715074784743424, 684766909853782016, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715074923155456, 684766909853782016, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715075095121920, 684766909853782016, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715075279671296, 684766909853782016, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715075392917504, 684766909853782016, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715111417794560, 684766829339922432, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715111581372416, 684766829339922432, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715111803670528, 684766829339922432, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715111946276864, 684766829339922432, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715112218906624, 684766829339922432, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715245484527616, 684766729536458752, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715245887180800, 684766729536458752, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715246541492224, 684766729536458752, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715248215019520, 684766729536458752, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715249309732864, 684766729536458752, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715295593877504, 684766600121208832, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715295841341440, 684766600121208832, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715296042668032, 684766600121208832, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715296457904128, 684766600121208832, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715297300959232, 684766600121208832, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715337163624448, 684766110310387712, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715337713078272, 684766110310387712, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715338426109952, 684766110310387712, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715338585493504, 684766110310387712, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715338786820096, 684766110310387712, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715391626661888, 684765849919606784, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715396785655808, 684765849919606784, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715398580817920, 684765849919606784, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715403878223872, 684765849919606784, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715404188602368, 684765849919606784, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715451345162240, 684765755581321216, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715453513617408, 684765755581321216, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715453899493376, 684765755581321216, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715454767714304, 684765755581321216, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715455510106112, 684765755581321216, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715514469437440, 684765368463839232, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715514695929856, 684765368463839232, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715514951782400, 684765368463839232, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715516252016640, 684765368463839232, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715516906328064, 684765368463839232, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715553258360832, 684765290013577216, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715553468076032, 684765290013577216, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715553812008960, 684765290013577216, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715554059472896, 684765290013577216, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715554327908352, 684765290013577216, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715601417359360, 684765185906757632, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715602566598656, 684765185906757632, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715603044749312, 684765185906757632, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715603476762624, 684765185906757632, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715604026216448, 684765185906757632, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715643268124672, 684764953525538816, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715643612057600, 684764953525538816, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715643767246848, 684764953525538816, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715644031488000, 684764953525538816, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715644442529792, 684764953525538816, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715768925278208, 684764200656359424, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715769088856064, 684764200656359424, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715769889968128, 684764200656359424, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715772381384704, 684764200656359424, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715772511408128, 684764200656359424, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715819663773696, 684764111070220288, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715820397776896, 684764111070220288, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715820653629440, 684764111070220288, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715820792041472, 684764111070220288, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715821001756672, 684764111070220288, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715870314188800, 684763362160463872, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715870540681216, 684763362160463872, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715870817505280, 684763362160463872, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715871090135040, 684763362160463872, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715871413096448, 684763362160463872, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715930569560064, 684763231684055040, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715930854772736, 684763231684055040, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715931018350592, 684763231684055040, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715931202899968, 684763231684055040, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715931328729088, 684763231684055040, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715976371359744, 684763121432580096, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715976652378112, 684763121432580096, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715976832733184, 684763121432580096, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715976962756608, 684763121432580096, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689715977172471808, 684763121432580096, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689716034584104960, 684763025919889408, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689716034714128384, 684763025919889408, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689716034827374592, 684763025919889408, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689716034957398016, 684763025919889408, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689716035070644224, 684763025919889408, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689716200737263616, 684762152007290880, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689716200900841472, 684762152007290880, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689716201366409216, 684762152007290880, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689716201597095936, 684762152007290880, 685031431038488576);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689716201743896576, 684762152007290880, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689716201911668736, 684762152007290880, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689716252142653440, 684761983555653632, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689716253417721856, 684761983555653632, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689716253971369984, 684761983555653632, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689716254332080128, 684761983555653632, 685031431038488576);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689716254734733312, 684761983555653632, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689716255263215616, 684761983555653632, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689716353485426688, 684761661194031104, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689716353615450112, 684761661194031104, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689716353871302656, 684761661194031104, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689716354009714688, 684761661194031104, 685031431038488576);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689716354156515328, 684761661194031104, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689716354357841920, 684761661194031104, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689716383625695232, 684761237170868224, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689716383818633216, 684761237170868224, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689716384032542720, 684761237170868224, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689716384422612992, 684761237170868224, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689716386867892224, 684761237170868224, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689716420246163456, 684699656554729472, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689716420359409664, 684699656554729472, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689716420472655872, 684699656554729472, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689716420569124864, 684699656554729472, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (689716420669788160, 684699656554729472, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (690111143435751424, 690111008978948096, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (690111145293828096, 690111008978948096, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (690111148410195968, 690111008978948096, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (690111148548608000, 690111008978948096, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (690111148951261184, 690111008978948096, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (690135415927525376, 690135197945352192, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (690135416044965888, 690135197945352192, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (690135416174989312, 690135197945352192, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (690135416271458304, 690135197945352192, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (690135416363732992, 690135197945352192, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (690173213229371392, 690173141578076160, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (690173213351006208, 690173141578076160, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (690173213455863808, 690173141578076160, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (690173213548138496, 690173141578076160, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (690173213661384704, 690173141578076160, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (690383002534334464, 690382874859720704, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (690383003163480064, 690382874859720704, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (690383003792625664, 690382874859720704, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (690383004937670656, 690382874859720704, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (690383005055111168, 690382874859720704, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (690485526889156608, 690485368247996416, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (690485526985625600, 690485368247996416, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (690485527086288896, 690485368247996416, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (690485527195340800, 690485368247996416, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (690485527300198400, 690485368247996416, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (690750992920530944, 690750917917986816, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (690750993025388544, 690750917917986816, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (690750993138634752, 690750917917986816, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (690750993251880960, 690750917917986816, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (690750993335767040, 690750917917986816, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (691916998195990528, 691916931959541760, 685031431038488576);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (692510761956069376, 692510664132317184, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (692510762056732672, 692510664132317184, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (692510762174173184, 692510664132317184, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (692510762274836480, 692510664132317184, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (692510762371305472, 692510664132317184, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (693341615703904256, 693341512515637248, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (693341615800373248, 693341512515637248, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (693341615892647936, 693341512515637248, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (693341615989116928, 693341512515637248, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (693341616098168832, 693341512515637248, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (693341816929832960, 693341780049317888, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (693341817026301952, 693341780049317888, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (693341817110188032, 693341780049317888, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (693341817202462720, 693341780049317888, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (693341817290543104, 693341780049317888, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (693342062699270144, 693342004549439488, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (693342062791544832, 693342004549439488, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (693342062896402432, 693342004549439488, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (693342062984482816, 693342004549439488, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (693342063064174592, 693342004549439488, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (693342290672275456, 693342244245524480, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (693342290764550144, 693342244245524480, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (693342290865213440, 693342244245524480, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (693342290961682432, 693342244245524480, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (693342291066540032, 693342244245524480, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (693342524735410176, 693342483048222720, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (693342524815101952, 693342483048222720, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (693342524903182336, 693342483048222720, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (693342525041594368, 693342483048222720, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (693342525188395008, 693342483048222720, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (693343838559195136, 693343792476377088, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (693343838676635648, 693343792476377088, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (693343838794076160, 693343792476377088, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (693343838907322368, 693343792476377088, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (693343839033151488, 693343792476377088, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (693669405548531712, 693669358446497792, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (693669405661777920, 693669358446497792, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (693669405770829824, 693669358446497792, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (693669405879881728, 693669358446497792, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (693669406001516544, 693669358446497792, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (695448345975902208, 684762298745016320, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (695448346097537024, 684762298745016320, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (695448346240143360, 684762298745016320, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (695448346340806656, 684762298745016320, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (695448346441469952, 684762298745016320, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (696612575156555776, 684762891240787968, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (696612575710203904, 684762891240787968, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (696612576037359616, 684762891240787968, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (696612576276434944, 684762891240787968, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (696612576687476736, 684762891240787968, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (698888765602975744, 684878135778791424, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (698888765691056128, 684878135778791424, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (698888765783330816, 684878135778791424, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (698888765863022592, 684878135778791424, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (698888765959491584, 684878135778791424, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (699091039629529088, 699090906305187840, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (699091039734386688, 699090906305187840, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (699091039847632896, 699090906305187840, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (699091039960879104, 699090906305187840, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (699091040069931008, 699090906305187840, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (699091071497850880, 699090853381459968, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (699091071606902784, 699090853381459968, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (699091071699177472, 699090853381459968, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (699091071791452160, 699090853381459968, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (699091071896309760, 699090853381459968, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (699091101772337152, 699090780341850112, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (699091101956886528, 699090780341850112, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (699091102141435904, 699090780341850112, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (699091102246293504, 699090780341850112, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (699091102363734016, 699090780341850112, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (699091133019901952, 699090650482003968, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (699091133162508288, 699090650482003968, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (699091133384806400, 699090650482003968, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (699091133506441216, 699090650482003968, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (699091133598715904, 699090650482003968, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (699091161885102080, 699082950205427712, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (699091161981571072, 699082950205427712, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (699091162115788800, 699082950205427712, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (699091162203869184, 699082950205427712, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (699091162291949568, 699082950205427712, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (764228653420040192, 764228555768254464, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (764228653541675008, 764228555768254464, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (764228653667504128, 764228555768254464, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (764228653885607936, 764228555768254464, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (764228654036602880, 764228555768254464, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (785353639371132928, 785353565261975552, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (785353639475990528, 785353565261975552, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (785353639576653824, 785353565261975552, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (785353639677317120, 785353565261975552, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (785353639794757632, 785353565261975552, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (790388190849978368, 790387958623948800, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (790388190959030272, 790387958623948800, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (790388191068082176, 790387958623948800, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (790388191185522688, 790387958623948800, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (790388191323934720, 790387958623948800, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (790388247254978560, 790388051003494400, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (790388247393390592, 790388051003494400, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (790388247494053888, 790388051003494400, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (790388247640854528, 790388051003494400, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (790388247775072256, 790388051003494400, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (798064805818060800, 798064739279622144, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (798064805939695616, 798064739279622144, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (798064806036164608, 798064739279622144, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (798064806136827904, 798064739279622144, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (798064806245879808, 798064739279622144, 689659913718648832);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (798064983459418112, 798064945379332096, 665499597804064768);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (798064983564275712, 798064945379332096, 689660323321794560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (798064983664939008, 798064945379332096, 666858336536678400);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (798064983765602304, 798064945379332096, 666858434746306560);
INSERT INTO `mscode_sys_role_url` (`id`, `url_id`, `role_id`) VALUES (798064983887237120, 798064945379332096, 689659913718648832);
COMMIT;

-- ----------------------------
-- Table structure for mscode_sys_role_user
-- ----------------------------
DROP TABLE IF EXISTS `mscode_sys_role_user`;
CREATE TABLE `mscode_sys_role_user` (
  `id` bigint(20) NOT NULL COMMENT '角色与用户关联主键ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色主键ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户主键ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='角色与用户关联表';

-- ----------------------------
-- Records of mscode_sys_role_user
-- ----------------------------
BEGIN;
INSERT INTO `mscode_sys_role_user` (`id`, `role_id`, `user_id`) VALUES (4, 689660323321794560, 656413611073654784);
INSERT INTO `mscode_sys_role_user` (`id`, `role_id`, `user_id`) VALUES (5, 689659913718648832, 656414601122336768);
INSERT INTO `mscode_sys_role_user` (`id`, `role_id`, `user_id`) VALUES (6, 689660323321794560, 689718972811497472);
INSERT INTO `mscode_sys_role_user` (`id`, `role_id`, `user_id`) VALUES (782852045593300992, 689659913718648832, 689732941378932736);
INSERT INTO `mscode_sys_role_user` (`id`, `role_id`, `user_id`) VALUES (782909074710122496, 666858336536678400, 782909074190028800);
INSERT INTO `mscode_sys_role_user` (`id`, `role_id`, `user_id`) VALUES (782909074810785792, 685031431038488576, 782909074190028800);
INSERT INTO `mscode_sys_role_user` (`id`, `role_id`, `user_id`) VALUES (785353078617853952, 689659913718648832, 689734818510327808);
INSERT INTO `mscode_sys_role_user` (`id`, `role_id`, `user_id`) VALUES (785353135350009856, 666858434746306560, 653918847061381120);
INSERT INTO `mscode_sys_role_user` (`id`, `role_id`, `user_id`) VALUES (785353224579633152, 665499597804064768, 653917974152592329);
INSERT INTO `mscode_sys_role_user` (`id`, `role_id`, `user_id`) VALUES (785353224676102144, 666858336536678400, 653917974152592329);
COMMIT;

-- ----------------------------
-- Table structure for mscode_sys_tenant
-- ----------------------------
DROP TABLE IF EXISTS `mscode_sys_tenant`;
CREATE TABLE `mscode_sys_tenant` (
  `id` bigint(20) NOT NULL COMMENT '租户主键ID',
  `tenant_code` varchar(64) NOT NULL COMMENT '租户编码',
  `tenant_name` varchar(64) NOT NULL COMMENT '租户名称',
  `tenant_contact` varchar(64) DEFAULT NULL COMMENT '联系人',
  `tenant_email` varchar(100) DEFAULT NULL COMMENT '联系邮箱',
  `tenant_tel` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_tenant_code` (`tenant_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='租户表';

-- ----------------------------
-- Records of mscode_sys_tenant
-- ----------------------------
BEGIN;
INSERT INTO `mscode_sys_tenant` (`id`, `tenant_code`, `tenant_name`, `tenant_contact`, `tenant_email`, `tenant_tel`, `create_time`, `update_time`) VALUES (1, '10001', '恒星科创', '管理员', '10000@qq.com', '123456789', '2019-09-03 09:54:20', '2020-01-15 12:21:56');
INSERT INTO `mscode_sys_tenant` (`id`, `tenant_code`, `tenant_name`, `tenant_contact`, `tenant_email`, `tenant_tel`, `create_time`, `update_time`) VALUES (713569479355191296, '10002', 'A公司', '李工', '123456@qq.com', '15011111111', '2020-05-23 09:50:25', NULL);
INSERT INTO `mscode_sys_tenant` (`id`, `tenant_code`, `tenant_name`, `tenant_contact`, `tenant_email`, `tenant_tel`, `create_time`, `update_time`) VALUES (713569744636530688, '100000003', 'B公司', '张部', '100000003@org.cn', '13988888888', '2020-05-23 09:51:28', NULL);
COMMIT;

-- ----------------------------
-- Table structure for mscode_sys_url
-- ----------------------------
DROP TABLE IF EXISTS `mscode_sys_url`;
CREATE TABLE `mscode_sys_url` (
  `id` bigint(20) NOT NULL COMMENT '接口主键ID',
  `url` varchar(512) NOT NULL COMMENT 'URL',
  `description` varchar(256) DEFAULT NULL COMMENT '描述',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `tenant_code` varchar(64) DEFAULT '10001' COMMENT '租户编码',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_url` (`url`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='接口表';

-- ----------------------------
-- Records of mscode_sys_url
-- ----------------------------
BEGIN;
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684699656554729472, '/statistics/statistics/insertSmsStatistics', '插入短信发送记录', '2020-03-04 17:51:59', '2020-03-05 11:26:40', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684761237170868224, '/statistics/statistics/querySmsRecord', '查询短信发送记录', '2020-03-04 21:56:42', '2020-03-05 11:26:46', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684761661194031104, '/notification/sms/sendSms', '阿里云发送短信', '2020-03-04 21:58:23', '2020-03-05 11:28:19', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684761983555653632, '/notification/sms/getRandomCode', '获取随机数验证码', '2020-03-04 21:59:40', '2020-03-05 11:28:22', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684762152007290880, '/notification/email/sendEmail', '发送邮件', '2020-03-04 22:00:20', '2020-03-05 11:28:26', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684762298745016320, '/notification/notification/queryNotification', '查询消息通知分页', '2020-03-04 22:00:55', '2020-03-05 11:28:28', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684762891240787968, '/notification/notification/queryMyNotification', '查询我的消息分页', '2020-03-04 22:03:16', '2020-03-05 11:28:32', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684763025919889408, '/notification/notification/queryHeadNotification', '查询顶部消息通知的数据', '2020-03-04 22:03:48', '2020-03-05 11:28:35', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684763121432580096, '/notification/notification/queryNotificationType', '查询类型的下拉框数据', '2020-03-04 22:04:11', '2020-03-05 11:28:38', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684763231684055040, '/notification/notification/queryNotificationPriority', '查询优先级的下拉框数据', '2020-03-04 22:04:37', '2020-03-05 11:28:40', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684763362160463872, '/notification/notification/addNotification', '新增消息通知', '2020-03-04 22:05:08', '2020-03-05 11:28:42', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684764111070220288, '/notification/notification/updateNotification', '编辑消息通知', '2020-03-04 22:08:07', '2020-03-05 11:28:46', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684764200656359424, '/notification/notification/deleteNotification', '删除消息通知', '2020-03-04 22:08:28', '2020-03-05 11:29:07', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684764953525538816, '/file/file/queryFile', '查询文件分页', '2020-03-04 22:11:28', '2020-03-05 11:30:02', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684765185906757632, '/file/file/deleteFile', '删除文件', '2020-03-04 22:12:23', '2020-03-05 11:30:05', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684765290013577216, '/file/file/uploadFile', '上传文件', '2020-03-04 22:12:48', '2020-03-05 11:30:08', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684765368463839232, '/file/file/downloadFile', '下载文件', '2020-03-04 22:13:07', '2020-03-05 11:30:12', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684765755581321216, '/chart/chart/queryAnalysisChartData', '查询图表的分析页数据', '2020-03-04 22:14:39', '2020-03-05 11:30:41', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684765849919606784, '/chart/chart/queryMonitorChartData', '查询图表的监控页数据', '2020-03-04 22:15:01', '2020-03-05 11:30:47', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684766110310387712, '/uaa/users/getSysUser', '查询当前用户信息', '2020-03-04 22:16:04', '2020-03-05 05:39:23', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684766600121208832, '/admin/sysdict/querySysDict', '查询字典分页', '2020-03-04 22:18:00', '2020-03-05 11:31:12', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684766729536458752, '/admin/sysdict/querySysDictTree', '查询字典的树数据', '2020-03-04 22:18:31', '2020-03-05 11:31:15', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684766829339922432, '/admin/sysdict/addSysDict', '新增字典', '2020-03-04 22:18:55', '2020-03-05 11:31:18', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684766909853782016, '/admin/sysdict/updateSysDict', '编辑字典', '2020-03-04 22:19:14', '2020-03-05 11:31:21', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684766992989081600, '/admin/sysdict/deleteSysDict', '删除字典', '2020-03-04 22:19:34', '2020-03-05 11:31:27', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684767088023621632, '/admin/sysdict/exportSysDict', '根据查询条件导出字典', '2020-03-04 22:19:57', '2020-03-05 11:31:30', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684767185939648512, '/admin/sysdict/queryDictByDictType', '根据字典类型查询下拉框数据列表', '2020-03-04 22:20:20', '2020-03-20 17:55:00', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684767758093045760, '/admin/sysmenu/querySysMenu', '查询菜单分页', '2020-03-04 22:22:36', '2020-03-05 11:31:53', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684767840410456064, '/admin/sysmenu/querySysMenuTree', '查询菜单的树数据', '2020-03-04 22:22:56', '2020-03-05 11:31:55', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684767949105844224, '/admin/sysmenu/queryMenuIdByRoleId', '根据角色ID查询对应的菜单ID', '2020-03-04 22:23:22', '2020-03-05 11:31:58', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684768109798019072, '/admin/sysmenu/addSysMenu', '新增菜单', '2020-03-04 22:24:00', '2020-03-05 11:32:03', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684768194908835840, '/admin/sysmenu/authorizeMenuToRole', '将对应的菜单授权给角色', '2020-03-04 22:24:21', '2020-03-05 11:32:05', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684768272050475008, '/admin/sysmenu/updateSysMenu', '编辑菜单', '2020-03-04 22:24:39', '2020-03-05 11:32:08', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684768347812188160, '/admin/sysmenu/deleteSysMenu', '删除菜单', '2020-03-04 22:24:57', '2020-03-05 11:32:09', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684768417576046592, '/admin/sysmenu/exportSysMenu', '根据查询条件导出菜单', '2020-03-04 22:25:14', '2020-03-05 11:32:12', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684769150585196544, '/admin/sysorg/querySysOrg', '查询机构分页', '2020-03-04 22:28:08', '2020-03-05 11:32:52', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684769228750245888, '/admin/sysorg/querySysOrgTree', '查询机构的树数据', '2020-03-04 22:28:27', '2020-03-05 11:32:55', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684769311214456832, '/admin/sysorg/queryOrgType', '查询机构类型的下拉框数据', '2020-03-04 22:28:47', '2020-03-05 11:32:59', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684769405045231616, '/admin/sysorg/addSysOrg', '新增机构', '2020-03-04 22:29:09', '2020-03-05 11:33:02', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684769473689210880, '/admin/sysorg/updateSysOrg', '编辑机构', '2020-03-04 22:29:25', '2020-03-05 11:33:04', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684769547852894208, '/admin/sysorg/deleteSysOrg', '删除机构', '2020-03-04 22:29:43', '2020-03-05 11:33:07', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684769620938641408, '/admin/sysorg/exportSysOrg', '根据查询条件导出机构', '2020-03-04 22:30:01', '2020-03-05 11:33:13', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684770137630756864, '/admin/sysparam/querySysParam', '查询参数分页', '2020-03-04 22:32:04', '2020-03-05 11:33:19', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684770356900581376, '/admin/sysparam/addSysParam', '新增参数', '2020-03-04 22:32:56', '2020-03-05 11:33:24', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684770436755935232, '/admin/sysparam/updateSysParam', '编辑参数', '2020-03-04 22:33:15', '2020-03-05 11:33:26', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684770515940200448, '/admin/sysparam/deleteSysParam', '删除参数', '2020-03-04 22:33:34', '2020-03-05 11:33:28', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684770585469177856, '/admin/sysparam/exportSysParam', '根据查询条件导出参数', '2020-03-04 22:33:50', '2020-03-05 11:33:30', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684770954010087424, '/admin/sysregion/querySysRegion', '查询区域分页', '2020-03-04 22:35:18', '2020-03-05 11:33:39', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684771029394313216, '/admin/sysregion/querySysRegionTree', '查询区域的树数据', '2020-03-04 22:35:36', '2020-03-05 11:34:24', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684771102517809152, '/admin/sysregion/queryRegionType', '查询区域类型的下拉框数据', '2020-03-04 22:35:54', '2020-03-05 11:34:27', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684771168280301568, '/admin/sysregion/queryProvince', '查询全部省份数据', '2020-03-04 22:36:09', '2020-03-05 11:34:29', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684771247170965504, '/admin/sysregion/queryCity', '根据省份代码查询对应地市数据', '2020-03-04 22:36:28', '2020-03-05 11:34:33', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684771320659365888, '/admin/sysregion/addSysRegion', '新增区域', '2020-03-04 22:36:46', '2020-03-05 11:34:41', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684771386413469696, '/admin/sysregion/updateSysRegion', '编辑区域', '2020-03-04 22:37:01', '2020-03-05 11:34:46', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684771462737219584, '/admin/sysregion/deleteSysRegion', '删除区域', '2020-03-04 22:37:20', '2020-03-05 11:35:25', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684771532190699520, '/admin/sysregion/exportSysRegion', '根据查询条件导出区域', '2020-03-04 22:37:36', '2020-03-05 11:35:28', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684878135778791424, '/admin/sysrole/querySysRole', '查询角色分页', '2020-03-05 05:41:14', '2020-03-05 11:57:46', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684878246143512576, '/admin/sysrole/queryRoleName', '查询角色名称的下拉框数据', '2020-03-05 05:41:40', '2020-03-19 16:12:07', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684878411596222464, '/admin/sysrole/queryRoleNameCheckbox', '查询角色的多选框数据', '2020-03-05 05:42:19', '2020-03-05 11:57:53', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684878495394222080, '/admin/sysrole/addSysRole', '新增角色', '2020-03-05 05:42:39', '2020-03-05 11:57:56', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684878582367309824, '/admin/sysrole/updateSysRole', '编辑角色', '2020-03-05 05:43:00', '2020-03-05 11:57:59', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684878665326448640, '/admin/sysrole/deleteSysRole', '删除角色', '2020-03-05 05:43:20', '2020-03-05 11:58:01', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684878768925757440, '/admin/sysrole/exportSysRole', '根据查询条件导出角色', '2020-03-05 05:43:45', '2020-03-05 11:58:04', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684879309210832896, '/admin/systenant/querySysTenant', '查询租户分页', '2020-03-05 05:45:53', '2020-03-05 11:58:06', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684879399543558144, '/admin/systenant/addSysTenant', '新增租户', '2020-03-05 05:46:15', '2020-03-05 11:58:09', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684879476056051712, '/admin/systenant/updateSysTenant', '编辑租户', '2020-03-05 05:46:33', '2020-03-05 11:58:13', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684879546537136128, '/admin/systenant/deleteSysTenant', '删除租户', '2020-03-05 05:46:50', '2020-03-05 11:58:16', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684879626841280512, '/admin/systenant/exportSysTenant', '根据查询条件导出租户', '2020-03-05 05:47:09', '2020-03-05 11:58:19', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684880069084499968, '/admin/sysurl/querySysUrl', '查询URL分页', '2020-03-05 05:48:55', '2020-03-05 11:58:22', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684880149241843712, '/admin/sysurl/addSysUrl', '新增URL', '2020-03-05 05:49:14', '2020-03-05 11:58:24', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684880224517017600, '/admin/sysurl/updateSysUrl', '编辑URL', '2020-03-05 05:49:32', '2020-03-05 11:58:26', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684880293827891200, '/admin/sysurl/deleteSysUrl', '删除URL', '2020-03-05 05:49:48', '2020-03-05 11:58:29', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684880364602576896, '/admin/sysurl/exportSysUrl', '根据查询条件导出URL', '2020-03-05 05:50:05', '2020-03-05 11:58:32', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684880444214661120, '/admin/sysurl/authorizeRoleToUrl', '将对应的角色授权给URL', '2020-03-05 05:50:24', '2020-03-05 11:59:05', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684880515022901248, '/admin/sysurl/queryRoleIdByUrlId', '根据URL的ID查询对应的角色ID', '2020-03-05 05:50:41', '2020-03-05 11:59:08', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684880978854203392, '/admin/sysuser/querySysUser', '查询用户分页', '2020-03-05 05:52:32', '2020-03-05 11:59:11', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684881078250819584, '/admin/sysuser/queryUsername', '查询用户名的下拉框数据', '2020-03-05 05:52:55', '2020-03-05 11:59:14', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684881171750244352, '/admin/sysuser/addSysUser', '新增用户', '2020-03-05 05:53:18', '2020-03-05 11:59:18', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684881249260982272, '/admin/sysuser/updateSysUser', '编辑用户', '2020-03-05 05:53:36', '2020-03-05 11:59:21', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684881326138380288, '/admin/sysuser/deleteSysUser', '删除用户', '2020-03-05 05:53:54', '2020-03-05 11:59:23', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684881405427503104, '/admin/sysuser/exportSysUser', '根据查询条件导出用户', '2020-03-05 05:54:13', '2020-03-05 11:59:25', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684881491641421824, '/admin/sysuser/queryUsernameBySysUserId', '根据用户ID查询用户名的数据列表', '2020-03-05 05:54:34', '2020-03-05 11:59:29', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684881588437569536, '/admin/sysuser/querySysUserIdByUsername', '根据用户名查询用户ID的数据列表', '2020-03-05 05:54:57', '2020-03-05 11:59:33', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684882140286341120, '/account/captcha/generateImageCaptcha', '生成图像验证码', '2020-03-05 05:57:08', '2020-03-05 12:00:04', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684882225053224960, '/account/captcha/getSmsCaptcha', '获取短信验证码并发送短信', '2020-03-05 05:57:29', '2020-03-05 12:00:06', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684882482570907648, '/account/sysuserdetail/queryCurrentAuthority', '查询当前用户的授权角色、菜单和按钮', '2020-03-05 05:58:30', '2020-03-16 12:31:01', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684882564108177408, '/account/sysuserdetail/registerAccount', '注册用户', '2020-03-05 05:58:50', '2020-03-05 12:00:11', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684882639978942464, '/account/sysuserdetail/updateSysUserDetail', '编辑用户详细信息', '2020-03-05 05:59:08', '2020-03-05 12:00:14', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684882726352244736, '/account/sysuserdetail/updateSysUserInfo', '根据字段编辑用户信息', '2020-03-05 05:59:28', '2020-03-05 12:00:16', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684882799698038784, '/account/sysuserdetail/updatePassword', '修改用户密码', '2020-03-05 05:59:46', '2020-03-05 12:00:19', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684882871139618816, '/account/sysuserdetail/retrievePassword', '找回密码', '2020-03-05 06:00:03', '2020-03-05 12:00:22', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684882948545499136, '/account/sysuserdetail/updateAvatar', '修改用户头像图片地址', '2020-03-05 06:00:21', '2020-03-05 12:00:29', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684883899876560896, '/activiti/deployment/queryDeployment', '查询已部署的模型分页', '2020-03-05 06:04:08', '2020-03-05 12:00:55', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684883976632324096, '/activiti/deployment/deleteDeployment', '删除已部署的模型', '2020-03-05 06:04:26', '2020-03-05 12:00:58', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684884189593915392, '/activiti/history/queryHistoricProcessInstance', '查询流程实例历史数据分页', '2020-03-05 06:05:17', '2020-03-05 12:01:00', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684884281163960320, '/activiti/history/queryHistoricActivityInstance', '查询节点执行历史数据分页', '2020-03-05 06:05:39', '2020-03-05 12:01:03', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684884374638219264, '/activiti/history/queryHistoricDetail', '查询流程实例和节点执行的详细信息历史数据分页', '2020-03-05 06:06:01', '2020-03-05 12:01:05', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684885190241603584, '/activiti/history/queryHistoricVariableInstance', '查询流程实例已结束的变量历史数据分页', '2020-03-05 06:09:16', '2020-03-05 12:01:08', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684885277399240704, '/activiti/history/queryHistoricTaskInstance', '查询流程任务历史数据分页', '2020-03-05 06:09:36', '2020-03-05 12:01:10', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684885464762994688, '/activiti/history/deleteHistoricProcessInstance', '删除流程实例历史数据', '2020-03-05 06:10:21', '2020-03-05 12:01:12', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684885537890684928, '/activiti/history/deleteHistoricTaskInstance', '删除流程任务历史数据', '2020-03-05 06:10:39', '2020-03-05 12:01:14', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684885993023000576, '/activiti/model/queryModel', '查询模型分页', '2020-03-05 06:12:27', '2020-03-05 12:01:17', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684886071976579072, '/activiti/model/addModel', '新增模型', '2020-03-05 06:12:46', '2020-03-05 12:01:24', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684886153950056448, '/activiti/model/updateModel', '编辑模型', '2020-03-05 06:13:05', '2020-03-05 12:01:27', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684886223940407296, '/activiti/model/deployModel', '部署模型', '2020-03-05 06:13:22', '2020-03-05 12:01:29', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684886297403641856, '/activiti/model/deleteModel', '删除模型', '2020-03-05 06:13:40', '2020-03-05 12:01:31', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684886692251226112, '/activiti/process/queryProcessDefinition', '查询流程定义分页', '2020-03-05 06:15:14', '2020-03-05 12:01:33', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684886776212803584, '/activiti/process/queryProcessInstance', '查询流程实例分页', '2020-03-05 06:15:34', '2020-03-05 12:01:35', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684886859419406336, '/activiti/process/queryExecution', '查询流程实例执行路径分页', '2020-03-05 06:15:54', '2020-03-05 12:01:38', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684886934942044160, '/activiti/process/getProcessResource', '获取流程定义XML', '2020-03-05 06:16:12', '2020-03-05 12:01:39', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684887016458342400, '/activiti/process/getHighLightedProcessDiagram', '获取高亮跟踪流程图', '2020-03-05 06:16:31', '2020-03-05 12:01:42', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684887088273215488, '/activiti/process/getProcessImage', '获取流程定义图片', '2020-03-05 06:16:48', '2020-03-05 12:01:44', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684887164995424256, '/activiti/process/persistProcess', '持久化流程', '2020-03-05 06:17:06', '2020-03-05 12:01:46', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684887237313613824, '/activiti/process/startProcessInstance', '发起流程', '2020-03-05 06:17:24', '2020-03-05 12:01:49', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684887315247976448, '/activiti/process/suspendProcessDefinition', '挂起流程定义', '2020-03-05 06:17:42', '2020-03-05 12:01:57', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684887386920243200, '/activiti/process/activateProcessDefinition', '激活流程定义', '2020-03-05 06:17:59', '2020-03-05 12:02:03', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684887466700099584, '/activiti/process/suspendProcessInstance', '挂起流程实例', '2020-03-05 06:18:18', '2020-03-05 12:02:05', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684887550225469440, '/activiti/process/activateProcessInstance', '激活流程实例', '2020-03-05 06:18:38', '2020-03-05 12:02:08', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684887626117206016, '/activiti/process/deleteProcessInstance', '删除流程实例', '2020-03-05 06:18:56', '2020-03-05 12:02:09', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684888543952556032, '/activiti/task/queryTask', '查询任务分页', '2020-03-05 06:22:35', '2020-03-05 12:02:16', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684888629210173440, '/activiti/task/claimTask', '签收任务', '2020-03-05 06:22:56', '2020-03-05 12:02:18', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684888723024171008, '/activiti/task/completeTask', '完结任务，任务进入下一节点', '2020-03-05 06:23:18', '2020-03-05 12:02:23', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684888798362259456, '/activiti/task/delegateTask', '委派任务', '2020-03-05 06:23:36', '2020-03-05 12:02:28', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684888875461955584, '/activiti/task/resolveTask', '被委派人完结任务并返回', '2020-03-05 06:23:54', '2020-03-05 12:02:29', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684888965530439680, '/activiti/task/regressTask', '回退任务', '2020-03-05 06:24:16', '2020-03-05 12:02:31', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684889046551810048, '/activiti/task/rejectTask', '驳回任务', '2020-03-05 06:24:35', '2020-03-05 12:02:33', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684889142488125440, '/activiti/task/terminateTask', '终止任务', '2020-03-05 06:24:58', '2020-03-05 12:02:34', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684889214944727040, '/activiti/task/queryPersonalTask', '查询个人任务分页', '2020-03-05 06:25:15', '2020-03-05 12:02:37', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (684889310419668992, '/activiti/task/queryUsername', '查询代理人的下拉框数据', '2020-03-05 06:25:38', '2020-03-05 12:02:39', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (688682790149345280, '/admin/sysmenu/querySysMenuButtonTree', '查询菜单按钮的树数据', '2020-03-15 17:39:32', NULL, '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (688744859523534848, '/admin/sysmenu/queryMenuButtonByRoleCode', '根据角色编码查询对应的菜单按钮', '2020-03-15 21:46:12', '2020-03-16 00:20:29', '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (688745051211616256, '/admin/sysmenu/authorizeMenuButtonToRole', '将对应的菜单按钮授权给角色', '2020-03-15 21:46:57', NULL, '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (690111008978948096, '/admin/sysrole/queryRoleCode', '查询角色编码的下拉框数据', '2020-03-19 16:14:46', NULL, '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (690135197945352192, '/admin/sysmenu/authorizeMenuDataToRole', '将对应的过滤数据字段授权给角色', '2020-03-19 17:50:53', NULL, '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (690173141578076160, '/admin/sysmenu/queryDataFieldByMenuCode', '根据菜单编码查询对应的过滤数据字段', '2020-03-19 20:21:39', NULL, '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (690382874859720704, '/admin/sysmenu/deleteDataField', '删除过滤数据字段', '2020-03-20 10:15:07', NULL, '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (690485368247996416, '/admin/sysmenu/queryMenuButtonCheckbox', '查询菜单按钮的多选框数据', '2020-03-20 17:02:20', NULL, '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (690750917917986816, '/admin/sysmenu/queryCheckedMenuButton', '查询菜单包含的按钮', '2020-03-21 10:37:34', NULL, '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (691916931959541760, '/account/sysuserdetail/compareCaptcha', '比对验证码', '2020-03-24 15:50:55', NULL, '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (692510664132317184, '/chart/chart/queryProduct', '查询商品报表数据', '2020-03-26 07:10:17', NULL, '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (693341512515637248, '/generator/generator/queryGenerator', '查询代码信息分页', '2020-03-28 14:11:40', NULL, '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (693341780049317888, '/generator/generator/addGenerator', '新增代码信息', '2020-03-28 14:12:44', NULL, '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (693342004549439488, '/generator/generator/updateGenerator', '编辑代码信息', '2020-03-28 14:13:37', NULL, '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (693342244245524480, '/generator/generator/deleteGenerator', '删除代码信息', '2020-03-28 14:14:35', NULL, '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (693342483048222720, '/generator/generator/exportGenerator', '根据查询条件导出代码信息', '2020-03-28 14:15:32', NULL, '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (693343792476377088, '/generator/generator/generateResource', '生成代码资源', '2020-03-28 14:20:44', NULL, '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (693669358446497792, '/activiti/task/queryTaskComment', '查询任务批注', '2020-03-29 11:54:24', NULL, '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (699082950205427712, '/uaa/appclient/exportAppClient', '根据查询条件导出应用', '2020-04-13 10:26:04', NULL, '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (699090650482003968, '/uaa/appclient/deleteAppClient', '删除应用', '2020-04-13 10:56:39', NULL, '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (699090780341850112, '/uaa/appclient/updateAppClient', '编辑应用', '2020-04-13 10:57:10', NULL, '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (699090853381459968, '/uaa/appclient/addAppClient', '新增应用', '2020-04-13 10:57:28', NULL, '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (699090906305187840, '/uaa/appclient/queryAppClient', '查询应用分页', '2020-04-13 10:57:40', NULL, '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (764228555768254464, '/generator/generator/queryFieldByGeneratorId', '根据代码信息ID查询对应的实体字段', '2020-10-10 04:51:28', NULL, '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (785353565261975552, '/admin/sysorg/queryOrgUserTree', '查询机构用户的树数据', '2020-12-07 11:54:41', NULL, '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (790387958623948800, '/admin/sysrole/authorizeUserToRole', '将对应的用户授权给角色', '2020-12-21 09:19:36', NULL, '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (790388051003494400, '/admin/sysuser/authorizeRoleToUser', '将对应的角色授予用户', '2020-12-21 09:19:58', NULL, '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (798064739279622144, '/file/file/addFolder', '新增文件夹', '2021-01-11 13:44:21', NULL, '10001');
INSERT INTO `mscode_sys_url` (`id`, `url`, `description`, `create_time`, `update_time`, `tenant_code`) VALUES (798064945379332096, '/file/file/queryFileTypeName', '查询文件类型名称', '2021-01-11 13:45:11', NULL, '10001');
COMMIT;

-- ----------------------------
-- Table structure for mscode_sys_user
-- ----------------------------
DROP TABLE IF EXISTS `mscode_sys_user`;
CREATE TABLE `mscode_sys_user` (
  `id` bigint(20) NOT NULL COMMENT '用户主键ID',
  `username` varchar(64) NOT NULL COMMENT '用户名',
  `password` varchar(256) NOT NULL COMMENT '密码',
  `email` varchar(100) NOT NULL COMMENT '邮箱',
  `mobile` varchar(20) NOT NULL COMMENT '手机号',
  `prefix` varchar(10) DEFAULT NULL COMMENT '手机号国家代码',
  `nickname` varchar(64) DEFAULT NULL COMMENT '昵称',
  `phone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `province_regioncode` varchar(20) DEFAULT NULL COMMENT '省份区域代码',
  `city_regioncode` varchar(20) DEFAULT NULL COMMENT '地市区域代码',
  `address` varchar(40) DEFAULT NULL COMMENT '街道地址',
  `profile` varchar(256) DEFAULT NULL COMMENT '个人简介',
  `avatar` varchar(256) DEFAULT NULL COMMENT '头像',
  `org_id` bigint(20) NOT NULL COMMENT '所属机构ID',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态 0：禁用 1：正常',
  `notify_message` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否通知系统消息 0：关 1：开',
  `notify_todo` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否通知待办任务 0：关 1：开',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `tenant_code` varchar(64) DEFAULT '10001' COMMENT '租户编码',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_user_username` (`username`) USING BTREE,
  UNIQUE KEY `idx_user_email` (`email`) USING BTREE,
  UNIQUE KEY `idx_user_mobile` (`mobile`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='用户表';

-- ----------------------------
-- Records of mscode_sys_user
-- ----------------------------
BEGIN;
INSERT INTO `mscode_sys_user` (`id`, `username`, `password`, `email`, `mobile`, `prefix`, `nickname`, `phone`, `province_regioncode`, `city_regioncode`, `address`, `profile`, `avatar`, `org_id`, `status`, `notify_message`, `notify_todo`, `create_time`, `update_time`, `tenant_code`) VALUES (653917974152592329, 'admin', '$2a$10$0Gh0i/roNUhOHnEXTpn3WexRsc8RfhxAaumD.KdzUtmxesVwHH8q6', 'admin@mscodecloud.com', '12222222229', '86', '超级管理员', '0755-55556666', '440000', '440100', '花都区永福路1号', '我的简介', '/api/file/static/upload/20200224110421638.png', 666664834108411904, 1, 1, 1, '2019-06-13 11:40:14', '2021-01-27 21:38:34', '10001');
INSERT INTO `mscode_sys_user` (`id`, `username`, `password`, `email`, `mobile`, `prefix`, `nickname`, `phone`, `province_regioncode`, `city_regioncode`, `address`, `profile`, `avatar`, `org_id`, `status`, `notify_message`, `notify_todo`, `create_time`, `update_time`, `tenant_code`) VALUES (653918847061381120, 'test', '$2a$10$0Gh0i/roNUhOHnEXTpn3WexRsc8RfhxAaumD.KdzUtmxesVwHH8q6', 'test@mscodecloud.com', '15011112222', '86', '王雪红', NULL, '440000', '440100', NULL, NULL, '/api/file/static/upload/20200224110421638.png', 666858728934789120, 1, 1, 1, '2019-12-10 19:20:04', '2020-12-07 11:52:59', '10001');
INSERT INTO `mscode_sys_user` (`id`, `username`, `password`, `email`, `mobile`, `prefix`, `nickname`, `phone`, `province_regioncode`, `city_regioncode`, `address`, `profile`, `avatar`, `org_id`, `status`, `notify_message`, `notify_todo`, `create_time`, `update_time`, `tenant_code`) VALUES (656413611073654784, 'attendance', '$2a$10$0Gh0i/roNUhOHnEXTpn3WexRsc8RfhxAaumD.KdzUtmxesVwHH8q6', 'attendance@mscodecloud.com', '12111111113', '86', '人事专员', NULL, '440000', '440100', NULL, NULL, '/api/file/static/upload/20200224110421638.png', 666665278205513728, 1, 1, 1, '2019-12-17 16:33:22', '2020-03-18 15:17:28', '10001');
INSERT INTO `mscode_sys_user` (`id`, `username`, `password`, `email`, `mobile`, `prefix`, `nickname`, `phone`, `province_regioncode`, `city_regioncode`, `address`, `profile`, `avatar`, `org_id`, `status`, `notify_message`, `notify_todo`, `create_time`, `update_time`, `tenant_code`) VALUES (656414601122336768, 'manager', '$2a$10$0Gh0i/roNUhOHnEXTpn3WexRsc8RfhxAaumD.KdzUtmxesVwHH8q6', 'manager@mscodecloud.com', '13333333339', '86', '李总', '0755-55556666', '350000', '350100', '西湖区工专路 77 号', '我的简介', '/api/file/static/upload/20200224110421638.png', 666665278205513728, 1, 1, 1, '2019-12-17 16:37:18', '2020-03-18 14:14:03', '10001');
INSERT INTO `mscode_sys_user` (`id`, `username`, `password`, `email`, `mobile`, `prefix`, `nickname`, `phone`, `province_regioncode`, `city_regioncode`, `address`, `profile`, `avatar`, `org_id`, `status`, `notify_message`, `notify_todo`, `create_time`, `update_time`, `tenant_code`) VALUES (689718972811497472, 'personnel', '$2a$10$0Gh0i/roNUhOHnEXTpn3WexRsc8RfhxAaumD.KdzUtmxesVwHH8q6', 'personnel@mscodecloud.com', '15666666667', '86', '人事经理', '020-22222222', '440000', '440100', NULL, NULL, '/api/file/static/upload/20200224110421638.png', 666665278205513728, 1, 1, 1, '2020-03-18 14:16:57', '2020-03-18 15:17:31', '10001');
INSERT INTO `mscode_sys_user` (`id`, `username`, `password`, `email`, `mobile`, `prefix`, `nickname`, `phone`, `province_regioncode`, `city_regioncode`, `address`, `profile`, `avatar`, `org_id`, `status`, `notify_message`, `notify_todo`, `create_time`, `update_time`, `tenant_code`) VALUES (689732941378932736, 'hrd', '$2a$10$0Gh0i/roNUhOHnEXTpn3WexRsc8RfhxAaumD.KdzUtmxesVwHH8q6', 'hrd@mscodecloud.com', '19999999999', '86', '人事总监', '020-22222222', '440000', '440100', NULL, NULL, '/api/file/static/upload/20200224110421638.png', 666665278205513728, 1, 1, 1, '2020-03-18 15:12:28', '2020-03-18 15:17:34', '10001');
INSERT INTO `mscode_sys_user` (`id`, `username`, `password`, `email`, `mobile`, `prefix`, `nickname`, `phone`, `province_regioncode`, `city_regioncode`, `address`, `profile`, `avatar`, `org_id`, `status`, `notify_message`, `notify_todo`, `create_time`, `update_time`, `tenant_code`) VALUES (689734818510327808, 'rdd', '$2a$10$0Gh0i/roNUhOHnEXTpn3WexRsc8RfhxAaumD.KdzUtmxesVwHH8q6', 'rdd@mscodecloud.com', '15688888888', '86', '张部', '020-22222222', '440000', '440100', NULL, NULL, '/api/file/static/upload/20200224110421638.png', 666664834108411904, 1, 1, 1, '2020-03-18 15:19:55', '2020-12-07 11:52:45', '10001');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
