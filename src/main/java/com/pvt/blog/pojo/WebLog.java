package com.pvt.blog.pojo;

import lombok.Data;

import java.io.Serial;
import java.io.Serializable;

/**
 * Controller层的日志封装
 * @author Summerday
 */
@Data
public class WebLog implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    // 操作描述
    private String description;

    // 操作时间
    private Long startTime;

    // 消耗时间
    private Integer timeCost;

    // URL
    private String url;

    // URI
    private String uri;

    // 请求类型
    private String httpMethod;

    // IP地址
    private String ipAddress;

    // 请求参数
    private Object params;

    // 请求返回的结果
    private Object result;

    // 操作类型
    private String methodType;
}
