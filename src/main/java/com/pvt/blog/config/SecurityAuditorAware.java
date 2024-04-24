package com.pvt.blog.config;

import cn.hutool.core.util.NumberUtil;
import com.pvt.blog.repository.UserRepository;
import com.pvt.blog.utils.RedisUtil;
import jakarta.annotation.Resource;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.AuditorAware;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import reactor.util.annotation.NonNull;

import java.util.Optional;

/**
 * @author LIWEI
 */
@Component
@Slf4j
public class SecurityAuditorAware implements AuditorAware<Integer> {
    @Resource
    private RedisTemplate<String, Object> redisTemplate;
    @Resource
    private UserRepository userRepository;
    @Resource
    private RedisUtil redisUtil;
    @Override
    public @NonNull Optional<Integer> getCurrentAuditor() {
        // 获取当前登录用户
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        log.info("authentication:{}", authentication);
        // 如果没有登录，返回空
        if (authentication == null || !authentication.isAuthenticated()) {
            return Optional.empty();
        }
        // 获取当前登录用户
        org.springframework.security.core.userdetails.User userDetail = (org.springframework.security.core.userdetails.User) authentication.getPrincipal();
        // 获取当前登录用户的用户名
        String username = userDetail.getUsername();
        log.info("username:{}", username);
        // 查询用户
        Object o = redisUtil.get("currentUser");
        if (NumberUtil.isInteger(o.toString())){
            return Optional.of(Integer.valueOf(o.toString()));
        }
        return Optional.empty();
    }
}