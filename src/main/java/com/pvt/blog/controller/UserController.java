package com.pvt.blog.controller;

import com.pvt.blog.pojo.dto.LoginDto;
import com.pvt.blog.pojo.dto.SignUpDto;
import com.pvt.blog.service.IUserService;
import com.pvt.blog.util.ResultResponse;
import jakarta.annotation.Resource;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

/**
 * @author LW
 */
@RestController
@Slf4j
@RequestMapping("/user")
public class UserController {
    @Resource
    private IUserService userService;
    // 用户登录
    @PostMapping("/login")
    public ResultResponse<String> userLogin(@RequestBody LoginDto loginDto){
        return userService.userLogin(loginDto);
    }
    // 用户注册
    @PostMapping("/register")
    public ResultResponse<String> userRegister(@RequestBody SignUpDto signUpDto){
        return userService.userRegister(signUpDto);
    }
    @GetMapping("/ok")
    public String FF(){
        return "asdf";
    }
    @GetMapping("/ww")
    public String aa(){
        return "ss";
    }
}
