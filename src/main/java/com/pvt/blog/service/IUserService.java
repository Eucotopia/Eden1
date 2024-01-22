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
    /**
     * 用户登录
     *
     * @param userDto userDto
     * @return ResultResponse<UserVO>
     */
    ResultResponse<UserVO> userLogin(UserDTO userDto);

    ResultResponse<String> userRegister(UserDTO user);

    ResultResponse<List<User>> getAllUser();
//
//    User1 getUserById(String id);

    ResultResponse<Long> getUserCount();

}
