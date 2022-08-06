package com.ctf.Interceptors;

import java.lang.annotation.*;

/**
 * 数据权限自定义注解
 * @author ALIEN-ZHU
 * @since 2020-05-07
 */
@Inherited
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface DataScope {

    // 权限的类型
    String type() default "";

    // 限制的字段
    String column() default "";

}