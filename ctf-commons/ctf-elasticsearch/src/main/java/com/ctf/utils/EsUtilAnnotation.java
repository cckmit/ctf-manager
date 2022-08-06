package com.ctf.utils;

import java.lang.annotation.*;

@Documented
@Retention(RetentionPolicy.RUNTIME)
@Target({ElementType.FIELD})
public @interface EsUtilAnnotation {

    String name() default "";

    String symbol() default "";

    boolean hidden() default false;
}
