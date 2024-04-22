package com.pvt.blog.annotations;

import cn.hutool.http.Method;

import java.lang.annotation.*;

/**
 * @author LIWEI
 */
@Target({ElementType.PARAMETER,ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface Log {
    /**
     * 描述
     */
    String description() default "";
    /**
     * 方法类型 INSERT DELETE UPDATE OTHER
     */
    Method methodType() default Method.OPTIONS; ;
}
