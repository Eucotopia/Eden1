package com.pvt.blog.service;

import com.pvt.blog.pojo.User;

import com.pvt.blog.pojo.dto.UserDTO;
import com.pvt.blog.pojo.vo.UserVO;
import com.pvt.blog.util.ResultResponse;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author LW
 */
@Service
public interface IUserService {
    ResultResponse<UserVO> userLogin(UserDTO userDto);

    ResultResponse<String> userRegister(User user);

    ResultResponse<List<User>> getAllUser();


}
