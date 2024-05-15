package com.pvt.blog.controller;

import java.util.List;
import java.util.Optional;

import com.pvt.blog.enums.ResultEnum;
import com.pvt.blog.pojo.User;
import com.pvt.blog.pojo.dto.UserDTO;
import com.pvt.blog.pojo.vo.UserVO;
import com.pvt.blog.repository.UserRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import com.pvt.blog.service.IUserService;
import com.pvt.blog.utils.ResultResponse;

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

    @Resource
    private UserRepository userRepository;

    // 用户登录
    @PostMapping("/login")
    public ResultResponse<UserVO> userLogin(@RequestBody UserDTO userdto) {
        return userService.userLogin(userdto);
    }

    @GetMapping("/{id}")
    public Optional<User> getUserById(@PathVariable("id") Integer id) {
        return userRepository.findById(Long.valueOf(id));
    }
    // 用户注册
    @PostMapping
    public ResultResponse<String> userRegister(@RequestBody UserDTO userDto) {
        return userService.userRegister(userDto);
    }

    // 获取所有用户
    @GetMapping
    public ResultResponse<List<User>> getAllUser() {
        return userService.getAllUser();
    }

    @GetMapping("/count")
    public ResultResponse<Long> getUserCount() {
        return userService.getUserCount();
    }

    @DeleteMapping("/{id}")
    public ResultResponse<String> deleteUser(@PathVariable("id") Long id) {
        return userService.deleteUser(id);
    }
}
