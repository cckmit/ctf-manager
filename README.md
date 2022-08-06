#项目介绍
智人App（简称智人）主要服务于周大福内部员工，能基本满足各职能部门的自我管理、考勤管理、移动打卡、移动学习、电子签署和绩效考核等功能需要。由于智人系统是早期研发，多年以来未进行大的技术升级，随着时间的推移和新技术的更新迭代，现产品在安全性、灵活度及扩展性方面都比较差，严重制约了平台的功能扩展。因此为了保障系统数据安全，满足周大福各职能部门个性化需求功能的建设需求，智人产品希望可以进行重构，以公司实际发展需要为导向，为公司的快速发展提供强有力的支持。

# 项目要点
**请一定要遵守研发规范**  地址：ctf-platform\file

#项目特性
* 为了规范项目结构
* 项目采用服服务框架，确保所有服务独立运行，互不影响
* 项目结构
  * 服务注册与发现，配置中心[nacos]
    * 具体地址周大福提供
  * 消息中间件[kafka]
  * 分布式系统协调[zookeeper与kafka结合使用]
  * 镜像中心地址[Harbor]
    * 具体地址周大福提供
  * Feign[声明式服务调用]
  * SpringCloud Gateway[API网关]
  * 缓存采用redis
  * 文件服务器FasfDFs
  * 定时任务采用XXL-JOB


# 项目目录结构
* ctf-common  帮助类
  * ctf-elasticsearch   ES帮助类
  * ctf-emaill 邮件
  * ctf-file 统一文件上传
  * ctf-report 报价表
  * ctf-utils  工具类
  * ctf-mybatisplus mybatis配置
  * ctf-msg 消息中心
  * ctf-redis redis帮助类
  
* ctf-gateway 统一路由转发
* ctf-auth  统一授权服务
  
* ctf-service 微服务
  * ctf-account-service  账号服务
  * ctf-admin-service 运营后台
  * ctf-generator-service  代码生成器
  
* ctf-service-api 微服务对内API
  * `ctf-account-api`账号服务对内API
  * ctf-admin-api 运营后台对内API

GIT版本管理规则
master分支
用于更新生产，必须保持与生产代码一致
master-年月日
develop分支
由开发人员在各自的feature分支开发完成后，合并至该分支
develop分支-年月日
release分支
测试环境中出现的bug，统一在该分支下进行修改，并推送至远程分支。修改内容必须合并回develop分支和master分支

项目规则
由于项目模块多，导致整个项目SQL脚本、不能及时同步，所以每个子项目必须加一个SQL文件夹，每当有增加或修改SQL时将脚本维护进去
注释规则:年月日研发人员，功能描述

配置文件规则
nacos自己新建命名空间标注为开发自己用的以后TEST标注测试环境，部署上线时会以此配置中为准