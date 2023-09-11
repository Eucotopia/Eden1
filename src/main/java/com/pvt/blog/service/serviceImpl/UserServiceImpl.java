package com.pvt.blog.service.serviceImpl;

import cn.hutool.core.lang.Validator;
import com.pvt.blog.repository.RoleRepository;
import com.pvt.blog.repository.UserRepository;
import com.pvt.blog.common.RoleConstant;
import com.pvt.blog.enums.ResultEnum;

import com.pvt.blog.pojo.Role;
import com.pvt.blog.pojo.User;
import com.pvt.blog.service.IUserService;
import com.pvt.blog.util.JwtTokenProvider;
import com.pvt.blog.util.ResultResponse;
import jakarta.annotation.Resource;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

/**
 * @author LW
 */
@Service
@Slf4j
public class UserServiceImpl implements IUserService {
    @Resource
    private AuthenticationManager authenticationManager;
    @Resource
    private JwtTokenProvider jwtTokenProvider;

    @Resource
    private UserRepository userRepository;

    @Resource
    private RoleRepository roleRepository;


    @Override
    public ResultResponse<String> userLogin(User user) {
        // 在 loadUserByUsername 中已经存储登录对象，在这里只需要进行校验即可
        Authentication authentication = authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(
                user.getEmail(), user.getPassword()));


        SecurityContextHolder.getContext().setAuthentication(authentication);

        String token = jwtTokenProvider.generateToken(authentication);

        /*
         TODO 登录成功后，将对象存入 redis 中
         JSON parse = JSONUtil.parse(loginDto);
         redisTemplate.opsForValue().setIfAbsent(loginDto.getUsername(),parse, RedisConstant.USER_TTL, TimeUnit.HOURS);
         Object o = redisTemplate.opsForValue().get(loginDto.getUsername());
         JSONUtil.toBean(o,LoginDto.class);
        */
        log.info("token:" + token);
        return ResultResponse.success(ResultEnum.SUCCESS,token);
    }

    /*
        1. 判断用户输入的用户名是否为邮箱
        2. 检查数据库中是否存在该用户（用户名重复）
        3. 创建该用户并保存进数据库
     */
    @Override
    public ResultResponse<String> userRegister(User user) {
        if (!Validator.isEmail(user.getEmail())) {
            // email 格式不正确
            return new ResultResponse<>(ResultEnum.FAIL_EMAIL_FORMAT);
        }
        if (userRepository.existsUserByUsername(user.getEmail())) {
            // 注册的用户已存在
            return new ResultResponse<>(ResultEnum.FAIL_USER_EXIST);
        }
        User newUser = new User();
        newUser.setPassword(new BCryptPasswordEncoder().encode(user.getPassword()));
        newUser.setUsername(user.getUsername());
        newUser.setEmail(user.getEmail());
        Optional<Role> role = roleRepository.findByName(RoleConstant.GUEST);
        // role.orElse(null):表示如果 role 为空，则返回括号中的内容，否则就返回实体
        newUser.setRoles(Collections.singleton(role.orElse(null)));
        userRepository.save(newUser);
        return ResultResponse.success(ResultEnum.SUCCESS_USER_REGISTER,null);
    }

    /*
        获取所有用户
     */
    @Override
    public ResultResponse<List<User>> getAllUser() {
        List<User> userList = userRepository.findAll();
        return new ResultResponse<>(ResultEnum.SUCCESS, userList);
    }

}
