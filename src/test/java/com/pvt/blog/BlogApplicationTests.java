package com.pvt.blog;


import com.pvt.blog.pojo.Role;
import com.pvt.blog.pojo.User;
import com.pvt.blog.repository.RoleRepository;
import com.pvt.blog.repository.UserRepository;
import jakarta.annotation.Resource;
import jakarta.transaction.Transactional;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;


@SpringBootTest
class BlogApplicationTests {
    @Resource
    private RoleRepository roleRepository;
    @Resource
    private UserRepository userRepository;

    @Test
    void contextLoads() {
    }

    @Test
    void test() {
    }

}
