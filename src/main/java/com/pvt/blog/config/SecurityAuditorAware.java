package com.pvt.blog.config;

import cn.hutool.log.Log;
import com.pvt.blog.pojo.User;
import com.pvt.blog.repository.UserRepository;
import jakarta.annotation.Resource;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.AuditorAware;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
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
    private UserRepository userRepository;

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
        User user = userRepository.findByEmail(username).orElseThrow(() -> new UsernameNotFoundException("User not found with username:" + username));
        log.info("userId:{}", user.getId());
        return Optional.ofNullable(user.getId());
    }
}