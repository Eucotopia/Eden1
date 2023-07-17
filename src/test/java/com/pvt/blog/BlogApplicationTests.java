package com.pvt.blog;

import com.pvt.blog.mapper.UserRepository;
import com.pvt.blog.util.JwtTokenProvider;
import jakarta.annotation.Resource;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

@SpringBootTest
class BlogApplicationTests {
    @Resource
    private JwtTokenProvider jwtTokenProvider;
    @Resource
    private AuthenticationManager authenticationManager;
    @Resource
    private UserRepository userRepository;
    @Test
    void contextLoads() {

    }
    @Test
    void Q(){
        // 在 loadUserByUsername 中已经存储登录对象，在这里只需要进行校验即可
        Authentication authentication = authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(
                "3499508634@qq.com", "$2a$10$eYkxDRIRetP9WDvdDjWYt.NcswtLV/Ir042ue0Jq37fnkSN3IF5uW"));
        System.out.println(authentication.getName());

        SecurityContextHolder.getContext().setAuthentication(authentication);

        String token = jwtTokenProvider.generateToken(authentication);

        // 登录成功后，将对象存入 redis 中

        System.out.println(token);

    }

}
