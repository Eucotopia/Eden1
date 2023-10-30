package com.pvt.blog;

import com.pvt.blog.pojo.User;
import com.pvt.blog.repository.RoleRepository;
import com.pvt.blog.repository.UserRepository;
import jakarta.annotation.Resource;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Optional;

@SpringBootTest
class BlogApplicationTests {
    @Resource
    private UserRepository userRepository;

    @Resource
    private RoleRepository roleRepository;

    @Test
    void contextLoads() {
        Optional<User> userByUsername = userRepository.findByUsername("3499508634@qq.com");
        System.out.println(userByUsername);
    }

    @Test
    void test() {
        System.out.println(roleRepository.findByName("ADMIN"));
    }

}
