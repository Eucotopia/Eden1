package com.pvt.blog.controller;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.pvt.blog.pojo.User;
import com.pvt.blog.pojo.dto.LoginDto;
import com.pvt.blog.pojo.dto.SignUpDto;
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
    public ResultResponse<String> userLogin(@RequestBody LoginDto loginDto) {
        return userService.userLogin(loginDto);
    }

    // 用户注册
    @PostMapping("/register")
    public ResultResponse<String> userRegister(@RequestBody SignUpDto signUpDto) {
        return userService.userRegister(signUpDto);
    }

    // 获取所有用户
    @GetMapping
    public ResultResponse<List<User>> getAllUser() {
        return userService.getAllUser();
    }

    // 根据 id 获取用户
    @GetMapping("/{id}")
    public ResultResponse<User> getUserById(@PathVariable String id) throws Exception {
        return userService.getUserById(id);
    }

    @GetMapping("/ok")
    public String ok() {
        return "OK";
    }
}
