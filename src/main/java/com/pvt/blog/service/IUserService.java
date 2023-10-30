package com.pvt.blog.service;

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

//    ResultResponse<String> userRegister(User1 user);

//    ResultResponse<List<User1>> getAllUser();
//
//    User1 getUserById(String id);

}
