package com.pvt.blog.controller;

import java.util.List;

import com.pvt.blog.pojo.dto.UserDTO;
import com.pvt.blog.pojo.vo.UserVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import com.pvt.blog.pojo.User;

import com.pvt.blog.service.IUserService;
import com.pvt.blog.util.ResultResponse;

import jakarta.annotation.Resource;

/**
 * @author LW
 */
@RestController
@RequestMapping("/user")
@Slf4j
public class UserController {
    @Resource
    private IUserService userService;

    // 用户登录
    @PostMapping("/login")
    public ResultResponse<UserVO> userLogin(@RequestBody UserDTO userdto) {
        log.info(userdto.toString());
        return userService.userLogin(userdto);
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

    @GetMapping("/{id}")
    public User getUserById(@PathVariable String id){
        return userService.getUserById(id);
    }
}
