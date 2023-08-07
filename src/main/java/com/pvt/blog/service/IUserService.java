package com.pvt.blog.service;

import com.pvt.blog.pojo.User;
import com.pvt.blog.pojo.dto.LoginDto;
import com.pvt.blog.pojo.dto.SignUpDto;
import com.pvt.blog.util.ResultResponse;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author LW
 */
@Service
public interface IUserService {
    ResultResponse<String> userLogin(LoginDto loginDto);

    ResultResponse<String> userRegister(SignUpDto signUpDto);

    ResultResponse<List<User>> getAllUser();

    ResultResponse<User> getUserById(String id) throws Exception;
}
