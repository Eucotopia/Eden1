package com.pvt.blog.aspect;

import java.time.LocalDateTime;

import java.time.temporal.ChronoUnit;

import java.util.Map;

import java.util.Objects;

import java.util.concurrent.Executor;


import cn.hutool.log.Log;
import com.pvt.blog.pojo.SysLog;
import com.pvt.blog.service.ISysLogService;
import jakarta.annotation.Resource;
import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.log4j.Log4j;
import lombok.extern.log4j.Log4j2;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;

import org.aspectj.lang.annotation.AfterReturning;

import org.aspectj.lang.annotation.AfterThrowing;

import org.aspectj.lang.annotation.Aspect;

import org.aspectj.lang.annotation.Before;

import org.aspectj.lang.annotation.Pointcut;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Component;

import org.springframework.web.context.request.RequestContextHolder;

import org.springframework.web.context.request.ServletRequestAttributes;

import cn.hutool.core.convert.Convert;

import cn.hutool.core.util.ArrayUtil;

import cn.hutool.core.util.StrUtil;

import cn.hutool.core.util.URLUtil;

import cn.hutool.extra.servlet.ServletUtil;

import cn.hutool.http.useragent.UserAgent;

import cn.hutool.http.useragent.UserAgentUtil;


/**
 * @author LIWEI
 */
@Slf4j
@Aspect
@Component
public class SysLogAspect {
    private final ThreadLocal<SysLog> sysLogThreadLocal = new ThreadLocal<>();
    @Resource
    private Executor customThreadPoolTaskExecutor;

    @Resource
    private ISysLogService sysLogService;

    @Pointcut("execution(* com.pvt.blog.controller.*.*(..))")
    public void sysLogAspect() {
    }

    /**
     * 前置通知
     *
     * @param joinPoint
     * @throws Throwable
     */
    @Before(value = "sysLogAspect()")
    public void doBefore(JoinPoint joinPoint) throws Throwable {
        HttpServletRequest request = ((ServletRequestAttributes) Objects
                .requireNonNull(RequestContextHolder.getRequestAttributes())).getRequest();

        SysLog sysLog = new SysLog();
        // 创建人信息请根据实际项目获取方式获取
        sysLog.setCreateUserCode("");
        sysLog.setCreateUserName("");
        sysLog.setStartTime(LocalDateTime.now());
        sysLog.setRequestUri(URLUtil.getPath(request.getRequestURI()));
        sysLog.setRequestParams(formatParams(request.getParameterMap()));
        sysLog.setRequestMethod(request.getMethod());
        String header = request.getHeader("x-forwarded-for");
//        sysLog.setRequestIp(ServletUtil.getClientIP(request));
        sysLog.setRequestIp(request.getRemoteAddr());
        sysLog.setServerAddress(request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort());
        String userAgentStr = request.getHeader("User-Agent");
        sysLog.setUserAgent(userAgentStr);
        UserAgent userAgent = UserAgentUtil.parse(userAgentStr);
        sysLog.setDeviceName(userAgent.getOs().getName());
        sysLog.setBrowserName(userAgent.getBrowser().getName());

        sysLogThreadLocal.set(sysLog);

        log.info("开始计时: {}  URI: {}  IP: {}", sysLog.getStartTime(), sysLog.getRequestUri(), sysLog.getRequestIp());
    }
    /**
     * 格式化参数
     *
     * @param parameterMap
     * @return
     */
    private String formatParams(Map<String, String[]> parameterMap) {
        if (parameterMap == null) {
            return null;
        }
        StringBuilder params = new StringBuilder();
        for (Map.Entry<String, String[]> param : (parameterMap).entrySet()) {
            if (params.length() != 0) {
                params.append("&");
            }
            params.append(param.getKey() + "=");
            if (StrUtil.endWithIgnoreCase(param.getKey(), "password")) {
                params.append("*");
            } else if (param.getValue() != null) {
                params.append(ArrayUtil.join(param.getValue(), ","));
            }
        }
        return params.toString();
    }


}
