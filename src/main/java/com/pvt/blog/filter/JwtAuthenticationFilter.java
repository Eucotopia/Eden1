package com.pvt.blog.filter;

import com.pvt.blog.pojo.User;
import com.pvt.blog.repository.UserRepository;
import com.pvt.blog.utils.JwtTokenProvider;
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
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;
import java.util.Optional;

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

    @Resource
    private UserRepository userRepository;

    @Override
    protected void doFilterInternal(@Nonnull HttpServletRequest request, @Nonnull HttpServletResponse response, @Nonnull FilterChain filterChain) throws ServletException, IOException {

        // get token from http request
        String authorization = getTokenFromRequest(request);

        // validate token
        if (StringUtils.hasText(authorization) && jwtTokenProvider.validateToken(authorization)) {

            // get username from token
            String username = jwtTokenProvider.getUsername(authorization);

            // load the user associated with token
            UserDetails userDetails = userDetailsService.loadUserByUsername(username);

            UsernamePasswordAuthenticationToken authenticationToken = new UsernamePasswordAuthenticationToken(
                    userDetails,
                    null,
                    userDetails.getAuthorities()
            );

//            // get user email
            Optional<User> user = userRepository.findByEmail(userDetails.getUsername());

            user.ifPresent(value -> authenticationToken.setDetails(new CustomWebAuthenticationDetails(request, value.getId())));

            SecurityContextHolder.getContext().setAuthentication(authenticationToken);

        }
        filterChain.doFilter(request, response);
    }

    /**
     * get token from http request
     *
     * @param request request
     * @return bearerToken
     */
    private String getTokenFromRequest(HttpServletRequest request) {

        String bearerToken = request.getHeader("Authorization");

        if (StringUtils.hasText(bearerToken) && bearerToken.startsWith("Bearer ")) {
            return bearerToken.substring(7);
        }
        return bearerToken;
    }

}
