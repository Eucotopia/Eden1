package com.pvt.blog.service;

import com.pvt.blog.pojo.User;

import com.pvt.blog.util.ResultResponse;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author LW
 */
@Service
public interface IUserService {
    ResultResponse<String> userLogin(User user);

    ResultResponse<String> userRegister(User user);

    ResultResponse<List<User>> getAllUser();

}
