package com.pvt.blog.service.serviceImpl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pvt.blog.mapper.UserMapper;
import com.pvt.blog.pojo.User;
import com.pvt.blog.service.UserService;
import org.springframework.stereotype.Service;

/**
 * @author LW
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {
}
