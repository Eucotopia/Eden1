package com.pvt.blog.config;

import com.pvt.blog.filter.CustomWebAuthenticationDetails;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.AuditorAware;
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

    @Override
    public @NonNull Optional<Integer> getCurrentAuditor() {

        // 获取当前登录用户
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        // 如果没有登录，返回空
        if (authentication == null || !authentication.isAuthenticated()) {
            return Optional.empty();
        }

        // 获取当前登录用户信息
        CustomWebAuthenticationDetails details = (CustomWebAuthenticationDetails) authentication.getDetails();

        return Optional.of(details.getId());
    }
}