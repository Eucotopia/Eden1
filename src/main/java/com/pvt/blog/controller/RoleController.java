package com.pvt.blog.controller;

import com.pvt.blog.pojo.Role;
import com.pvt.blog.repository.RoleRepository;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/role")
public class RoleController {
    @Resource
    private RoleRepository roleRepository;

    @GetMapping
    public List<Role> getAll() {
        List<Role> all = roleRepository.findAll();
        return all;
    }
}
