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

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        if (authentication == null || !authentication.isAuthenticated()) {
            return Optional.empty();
        }
        org.springframework.security.core.userdetails.User userDetail = (org.springframework.security.core.userdetails.User) authentication.getPrincipal();

        String username = userDetail.getUsername();

        User user = userRepository.findByUsername(username).orElseThrow(() -> new UsernameNotFoundException("User not found with username:" + username));

        return Optional.ofNullable(user.getId());
    }
}