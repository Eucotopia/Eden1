package com.pvt.blog.filter;

import com.pvt.blog.util.JwtTokenProvider;
import jakarta.annotation.Nonnull;
import jakarta.annotation.Resource;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;

/**
 * @author LW
 * @date 2023/7/15
 */
@Component
@Slf4j
public class JwtAuthenticationFilter extends OncePerRequestFilter {
    @Resource
    protected JwtTokenProvider jwtTokenProvider;
    @Resource
    protected UserDetailsService userDetailsService;

    @Override
    protected void doFilterInternal(HttpServletRequest request, @Nonnull HttpServletResponse response, @Nonnull FilterChain filterChain) throws ServletException, IOException {

        // get token from http request
        String authorization = request.getHeader("Authorization");


        // validate token
        if (StringUtils.hasText(authorization) && jwtTokenProvider.validateToken(authorization)) {

            // get username from token
            String username = jwtTokenProvider.getEmail(authorization);

            // load the user associated with token
            // TODO 这里需要修改，应该是从 Redis 中读取该数据（需要考虑这里是否一定可以获取到该对象，如果是的话，那就在 Redis 中查询，如果不是那就读取 loadUserByUsername）
            UserDetails userDetails = userDetailsService.loadUserByUsername(username);

            UsernamePasswordAuthenticationToken authenticationToken = new UsernamePasswordAuthenticationToken(
                    userDetails,
                    null,
                    userDetails.getAuthorities()
            );
            authenticationToken.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));

            SecurityContextHolder.getContext().setAuthentication(authenticationToken);
        }
        filterChain.doFilter(request, response);
    }

}
