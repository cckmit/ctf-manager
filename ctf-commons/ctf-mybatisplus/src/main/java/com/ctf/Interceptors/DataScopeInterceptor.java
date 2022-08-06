package com.ctf.Interceptors;

import cn.hutool.core.util.ArrayUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.json.JSONArray;
import cn.hutool.json.JSONObject;
import cn.hutool.json.JSONUtil;
import com.baomidou.mybatisplus.core.toolkit.PluginUtils;
import com.baomidou.mybatisplus.extension.handlers.AbstractSqlParserHandler;
import com.ctf.RedisUtil;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.executor.statement.StatementHandler;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.mapping.SqlCommandType;
import org.apache.ibatis.plugin.*;
import org.apache.ibatis.reflection.MetaObject;
import org.apache.ibatis.reflection.SystemMetaObject;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;

@Slf4j
@AllArgsConstructor
@Intercepts({@Signature(type = StatementHandler.class, method = "prepare", args = {Connection.class, Integer.class})})
@Component
@Primary
public class DataScopeInterceptor extends AbstractSqlParserHandler implements Interceptor {

    @Override
    public Object intercept(Invocation invocation) throws Throwable {
        StatementHandler statementHandler = PluginUtils.realTarget(invocation.getTarget());
        MetaObject metaObject = SystemMetaObject.forObject(statementHandler);
        this.sqlParser(metaObject);
        // 先判断是不是SELECT操作 不是直接过滤
        MappedStatement mappedStatement = (MappedStatement) metaObject.getValue("delegate.mappedStatement");
        if (!SqlCommandType.SELECT.equals(mappedStatement.getSqlCommandType())) {
            return invocation.proceed();
        }
        String methodId = mappedStatement.getId();
        // 5.获取Mapper的Class名称
        String clazzName = methodId.substring(0, methodId.lastIndexOf("."));
        // 6.获取拦截的方法名
        String methodName = methodId.substring(methodId.lastIndexOf(".") + 1);
        // 7.反射获取方法上的注解内容
        Method[] methods = Class.forName(clazzName).getDeclaredMethods();
        DataScope dataScope = null;
        for (Method md : methods) {
            if (methodName.equalsIgnoreCase(md.getName())) {
                dataScope = md.getAnnotation(DataScope.class);
            }
        }
        if (dataScope == null) {
            return invocation.proceed();
        }
        HttpServletRequest request = WebUtil.getRequest();
        String token = request.getHeader("token");
        Object o = RedisUtil.get(AppConstant.USER_LOGIN_INFO_CACHE_NAME + token);
        Integer id = JSONUtil.parseObj(o).getInt("id");
        List<String> authorities = JSONUtil.parseObj(o).getJSONArray("authorities").toList(String.class);
        Iterator<String> iterator = authorities.iterator();
        while (iterator.hasNext()){
            String next = iterator.next();
            String authority = JSONUtil.parseObj(next).getStr("authority");
            if(authority.equalsIgnoreCase("Admin")){
                return invocation.proceed();
            }
        }
        List<Integer> jsonArray = JSONUtil.toList(JSONUtil.parseArray(RedisUtil.get(AppConstant.USER_INFO_SUPPLIER_CACHE_NAME + ":" + id)),Integer.class);
        log.info("user:==={}",jsonArray);
        BoundSql boundSql = (BoundSql) metaObject.getValue("delegate.boundSql");
        // 执行的SQL语句
        String originalSql = boundSql.getSql();
        String s = setSqlSupplierId(originalSql, dataScope, jsonArray);
        if(StrUtil.isNotEmpty(s)){
            Object parameterObject = boundSql.getParameterObject();
            metaObject.setValue("delegate.boundSql.sql", s);
        }
        return invocation.proceed();
    }

    /**
     * 生成拦截对象的代理
     *
     * @param target 目标对象
     * @return 代理对象
     */
    @Override
    public Object plugin(Object target) {
        if (target instanceof StatementHandler) {
            return Plugin.wrap(target, this);
        }
        return target;
    }

    /**
     * mybatis配置的属性
     *
     * @param properties mybatis配置的属性
     */
    @Override
    public void setProperties(Properties properties) {

    }

    public String setSqlSupplierId(String sql,DataScope dataScope,List<Integer> supplierIds){
        String where2 = "";
        String column = dataScope.column();
        if(StrUtil.isEmpty(column)){
            column = "id";
        }
        if(StrUtil.containsIgnoreCase(sql," where "+column+" in (")){
            return null;
        }
        Integer[] objects = ArrayUtil.toArray(supplierIds, Integer.class);
        if (EmptyUtils.isEmpty(objects)){
            objects =  ArrayUtil.addAll(new Integer[]{0});
        }
        if(StrUtil.containsIgnoreCase(sql,"where")){
            int where = StrUtil.lastIndexOfIgnoreCase(sql,"where")+5;
            where2 = sql.substring(where, sql.length());
            sql = sql.substring(0, where) + " "+column+" in ("+ArrayUtil.join(objects, ",")+") and "+where2;
            return sql;
        }
        //没有where的情况
        if(StrUtil.isEmpty(where2) && StrUtil.containsIgnoreCase(sql,"group by")){
            int where = StrUtil.lastIndexOfIgnoreCase(sql,"group by");
            where2 = sql.substring(where, sql.length());
            sql = sql.substring(0, where) + " where "+column+" in ("+ArrayUtil.join(objects, ",")+") " +where2;
            return sql;
        }

        if(StrUtil.isEmpty(where2) && StrUtil.containsIgnoreCase(sql,"order by")){
            int where = StrUtil.lastIndexOfIgnoreCase(sql,"order by");
            where2 = sql.substring(where, sql.length());
            sql = sql.substring(0, where) + " where "+column+" in ("+ArrayUtil.join(objects, ",")+") " +where2;
            return sql;
        }
        return "";
    }

}
