package com.pvt.blog;

import cn.hutool.jwt.JWTPayload;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class BlogApplicationTests {
    @Test
    void contextLoads() {
        String token = JwtUtil.createToken("123");
        System.out.println(token);

    }
    @Test
    void Q(){
        JWTPayload jwtPayload = JwtUtil.parseToken("eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJuYmYiOjE2ODk0MTA0NjksImV4cCI6MTY4OTQxMDQ2OSwiaWF0IjoxNjg5NDEwNDY5LCJ1c2VySWQiOiIxMjMifQ.80b7Ipyf9XBXgbz-FRjG-UweetpvpPrscvbL7cLc4Qw");
        System.out.println(jwtPayload);
        String userId = (String) jwtPayload.getClaim("userId");
        System.out.println(userId);

    }

}
