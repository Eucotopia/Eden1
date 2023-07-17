package com.pvt.blog.service.serviceImpl;

import com.pvt.blog.common.ResultConstant;
import com.pvt.blog.common.RoleConstant;
import com.pvt.blog.enums.ResultEnum;
import com.pvt.blog.mapper.RoleRepository;
import com.pvt.blog.mapper.UserRepository;
import com.pvt.blog.pojo.Role;
import com.pvt.blog.pojo.User;
import com.pvt.blog.pojo.dto.LoginDto;
import com.pvt.blog.pojo.dto.SignUpDto;
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
    public ResultResponse<String> userLogin(LoginDto loginDto) {
        // 在 loadUserByUsername 中已经存储登录对象，在这里只需要进行校验即可
        Authentication authentication = authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(
                loginDto.getUsername(), loginDto.getPassword()));

        log.info(authentication.getPrincipal().toString());

        SecurityContextHolder.getContext().setAuthentication(authentication);

        String token = jwtTokenProvider.generateToken(authentication);

        // 登录成功后，将对象存入 redis 中


        return new ResultResponse<>(ResultEnum.SUCCESS, token);
    }

    @Override
    public ResultResponse<String> userRegister(SignUpDto signUpDto) {
        // 检查数据库中是否存在该用户
        if (userRepository.existsUserByUsername(signUpDto.getUsername())) {
            return new ResultResponse<>(ResultEnum.SUCCESS, ResultConstant.USER_EXIST);
        }
        User user = new User();
        user.setNickname(signUpDto.getNickname());
        user.setPassword(signUpDto.getPassword());
        user.setUsername(new BCryptPasswordEncoder().encode(signUpDto.getUsername()));
        //TODO 未完
        Role role = roleRepository.findByName(RoleConstant.ADMIN).get();
        user.setRoles(Collections.singleton(role));
        userRepository.save(user);
        return new ResultResponse<>(ResultEnum.SUCCESS);
    }
}