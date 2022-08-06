package com.ctf.component.commons.config;

import com.alibaba.druid.pool.DruidDataSource;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.TransactionManagementConfigurer;
import org.springframework.validation.beanvalidation.LocalValidatorFactoryBean;

import javax.sql.DataSource;
import javax.validation.Validator;
import java.io.IOException;

/**
 * 数据源配置类
 *
 *
 */
@Configuration
@EnableTransactionManagement
@MapperScan("com.ctf.*.mapper")
public class DataSourceConfig implements TransactionManagementConfigurer {

	/**
	 * 创建DruidDataSource数据源
	 *
	 * @return
	 */
	@Bean
	@ConfigurationProperties(prefix = "spring.datasource")
	public DataSource dataSource() {
		return DataSourceBuilder.create().type(DruidDataSource.class).build();
	}

	/**
	 * 实例化数据源事务管理器
	 *
	 * @return
	 */
	@Bean
	public PlatformTransactionManager txManager() {
		return new DataSourceTransactionManager(dataSource());
	}

	/**
	 * 指定默认数据源事务管理器，可扩展多数据源
	 */
	@Override
	public PlatformTransactionManager annotationDrivenTransactionManager() {
		return txManager();
	}

	/**
	 * 创建Mybatis的SqlSessionFactory，共享在Spring应用程序上下文，然后通过依赖注入将SqlSessionFactory传递给DAO
	 *
	 * @return
	 * @throws IOException
	 */
	@Bean
	public SqlSessionFactoryBean sqlSessionFactory() throws IOException {
		SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
		sqlSessionFactoryBean.setDataSource(dataSource());
		org.apache.ibatis.session.Configuration configuration = new org.apache.ibatis.session.Configuration();
		configuration.setCallSettersOnNulls(true);
		sqlSessionFactoryBean.setConfiguration(configuration);
		PathMatchingResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();
		sqlSessionFactoryBean.setMapperLocations(resolver.getResources("classpath:com/ctf/**/mapper/*.xml"));
		sqlSessionFactoryBean.setTypeAliasesPackage("com.ctf.*.entity");
		return sqlSessionFactoryBean;
	}

	/**
	 * 实例化Spring MVC数据校验器
	 *
	 * @return
	 */
	@Bean
	public Validator validator() {
		return new LocalValidatorFactoryBean();
	}

}
