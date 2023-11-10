package com.pvt.blog.config;

import com.pvt.blog.pojo.User;
import com.pvt.blog.repository.UserRepository;
import jakarta.annotation.Resource;
import org.springframework.data.domain.AuditorAware;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;
import reactor.util.annotation.NonNull;

import java.util.Optional;

@Component
public class SecurityAuditorAware implements AuditorAware<Integer> {
    @Resource
    private UserRepository userRepository;

    @Override
    public @NonNull Optional<Integer> getCurrentAuditor() {
        // 获取当前登录用户
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        // 如果没有登录，返回空
        if (authentication == null || !authentication.isAuthenticated()) {
            return Optional.empty();
        }
        // 获取当前登录用户
        org.springframework.security.core.userdetails.User userDetail = (org.springframework.security.core.userdetails.User) authentication.getPrincipal();
        // 获取当前登录用户的用户名
        String username = userDetail.getUsername();
        // 根据用户名查询用户
        User user = userRepository.findByUsername(username).orElseThrow(() -> new UsernameNotFoundException("User not found with username:" + username));
        // 返回用户 id
        return Optional.ofNullable(user.getId());
    }
}