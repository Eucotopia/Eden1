package com.pvt.blog.pojo;

import jakarta.persistence.*;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 系统用户
 *
 * @author CL
 */
@Data
@Entity
@Table(name = "sys_log")
public class SysLog implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 用户ID
     */
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    /**
     * 日志类型
     */
    @Column(name = "log_type")
    private String logType;

    /**
     * 创建用户编码
     */
    @Column(name = "create_user_code")
    private String createUserCode;

    /**
     * 创建用户名称
     */
    @Column(name = "create_user_name")
    private String createUserName;

    /**
     * 创建时间
     */
    @Column(name = "create_date")
    private LocalDateTime createDate;

    /**
     * 请求URI
     */
    @Column(name = "request_uri")
    private String requestUri;

    /**
     * 请求方式
     */
    @Column(name = "request_method")
    private String requestMethod;

    /**
     * 请求参数
     */
    @Column(name = "request_params")
    private String requestParams;

    /**
     * 请求IP
     */
    @Column(name = "request_ip")
    private String requestIp;

    /**
     * 请求服务器地址
     */
    @Column(name = "server_address")
    private String serverAddress;

    /**
     * 是否异常
     */
    @Column(name = "is_exception")
    private String isException;

    /**
     * 异常信息
     */
    @Column(name = "exception_info")
    private String exceptionInfo;

    /**
     * 开始时间
     */
    @Column(name = "start_time")
    private LocalDateTime startTime;

    /**
     * 结束时间
     */
    @Column(name = "end_time")
    private LocalDateTime endTime;

    /**
     * 执行时间
     */
    @Column(name = "execute_time")
    private Long executeTime;

    /**
     * 用户代理
     */
    @Column(name = "user_agent")
    private String userAgent;

    /**
     * 操作系统
     */
    @Column(name = "device_name")
    private String deviceName;

    /**
     * 浏览器名称
     */
    @Column(name = "browser_name")
    private String browserName;

}