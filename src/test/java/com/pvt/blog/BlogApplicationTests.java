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
    @Transactional
    void test() {
        List<Role> all2 = roleRepository.findAll();
        for (Role role : all2) {
            System.out.println("user"+role.getUsers());
        }
        all2.forEach((r) -> {
            System.out.println(r.getName());
            r.getUsers().forEach((u) -> {
                System.out.println(u.getUsername());
            });
        });
    }

    @Test
    void fetchRole() {
        List<User> all = userRepository.findAll();
        all.forEach((r) -> {
            System.out.println(r.getUsername());
            r.getRoles().forEach((u) -> {
                System.out.println(u.getName());
            });
        });
    }

}
