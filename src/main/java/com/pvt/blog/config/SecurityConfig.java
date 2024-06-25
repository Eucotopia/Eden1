package com.pvt.blog.config;

import com.pvt.blog.filter.CustomAccessDeniedHandler;
import com.pvt.blog.filter.CustomAuthenticationEntryPoint;
import com.pvt.blog.filter.JwtAuthenticationFilter;
import jakarta.annotation.Resource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

/**
 * @author LW
 * @date 2023/7/14
 * @description Security configuration for the application
 */
@Configuration
@EnableJpaAuditing
@EnableMethodSecurity
public class SecurityConfig {


    @Resource
    private JwtAuthenticationFilter jwtAuthenticationFilter;

    @Resource
    private CustomAccessDeniedHandler customAccessDeniedHandler;

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Resource
    private CustomAuthenticationEntryPoint customAuthenticationEntryPoint;

    @Bean
    SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
                .csrf(AbstractHttpConfigurer::disable)
                .cors((cors) -> {
                    UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
                    CorsConfiguration configuration = new CorsConfiguration();
                    configuration.addAllowedOriginPattern("*");
                    configuration.addAllowedHeader("*");
                    configuration.addAllowedMethod("*");
                    source.registerCorsConfiguration("/**", configuration);
                    cors.configurationSource(source);
                })
                .authorizeHttpRequests((authorize) -> {
                    authorize
                            .requestMatchers(HttpMethod.POST, "/user/login").permitAll()
                            .requestMatchers(HttpMethod.POST, "/user").permitAll()
                            .anyRequest().permitAll();
                })
                .exceptionHandling(exceptionHandling -> {
                    exceptionHandling.authenticationEntryPoint(customAuthenticationEntryPoint);
                    exceptionHandling.accessDeniedHandler(customAccessDeniedHandler);
                })
        ;

        http.addFilterBefore(jwtAuthenticationFilter, UsernamePasswordAuthenticationFilter.class);

        return http.build();
    }

    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration configuration) throws Exception {
        return configuration.getAuthenticationManager();
    }
}
