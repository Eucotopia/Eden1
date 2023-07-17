package com.pvt.blog.controller;

import com.pvt.blog.pojo.dto.LoginDto;
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
        log.info(loginDto.toString());
        return userService.userLogin(loginDto);
    }
    @GetMapping("/ok")
    public String OK(){
        return "OK";
    }

    @PostMapping("/qwe")
    public String userLogin(String username){
        return username;
    }
}
