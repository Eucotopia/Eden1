package com.pvt.blog.controller;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.pvt.blog.pojo.User;

import com.pvt.blog.service.IUserService;
import com.pvt.blog.util.ResultResponse;

import jakarta.annotation.Resource;

/**
 * @author LW
 */
@RestController
@RequestMapping("/user")
public class UserController {
    @Resource
    private IUserService userService;

    // 用户登录
    @PostMapping("/login")
    public ResultResponse<String> userLogin(@RequestBody User user) {
        return userService.userLogin(user);
    }

    // 用户注册
    @PostMapping
    public ResultResponse<String> userRegister(@RequestBody User user) {
        return userService.userRegister(user);
    }

    // 获取所有用户
    @GetMapping
    public ResultResponse<List<User>> getAllUser() {
        return userService.getAllUser();
    }

    @GetMapping("/ok")
    public String ok() {
        return "OK";
    }
}
