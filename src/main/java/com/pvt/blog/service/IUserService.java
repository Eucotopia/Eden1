package com.pvt.blog.service;

import com.pvt.blog.pojo.dto.UserDto;
import com.pvt.blog.util.ResultResponse;
import org.springframework.stereotype.Service;

/**
 * @author LW
 */
@Service
public interface IUserService {
    ResultResponse<String> userLogin(UserDto userDto);
}
