package com.pvt.blog.service.serviceImpl;

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
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.Optional;

/**
 * @author LW
 */
@Service
@Slf4j
public class UserServiceImpl implements IUserService {
    @Resource
    private RedisTemplate<String, Object> redisTemplate;
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


        SecurityContextHolder.getContext().setAuthentication(authentication);

        String token = jwtTokenProvider.generateToken(authentication);

        // TODO 登录成功后，将对象存入 redis 中
        // JSON parse = JSONUtil.parse(loginDto);
        // redisTemplate.opsForValue().setIfAbsent(loginDto.getUsername(),parse, RedisConstant.USER_TTL, TimeUnit.HOURS);
        // Object o = redisTemplate.opsForValue().get(loginDto.getUsername());
        // JSONUtil.toBean(o,LoginDto.class);
        log.info("token:" + token);
        return new ResultResponse<>(ResultEnum.SUCCESS, token);
    }

    @Override
    public ResultResponse<String> userRegister(SignUpDto signUpDto) {
        // 检查数据库中是否存在该用户
        if (userRepository.existsUserByUsername(signUpDto.getUsername())) {
            return new ResultResponse<>(ResultEnum.FAIL_USER_EXIST);
        }
        User user = new User();
        user.setNickname(signUpDto.getNickname());
        user.setPassword(new BCryptPasswordEncoder().encode(signUpDto.getPassword()));
        user.setUsername(signUpDto.getUsername());
        user.setState(0);
        // TODO 未完
        Optional<Role> role = roleRepository.findByName(RoleConstant.ADMIN);
        // role.orElse(null):表示如果 role 为空，则返回括号中的内容，否则就返回实体
        user.setRoles(Collections.singleton(role.orElse(null)));
        userRepository.save(user);
        return new ResultResponse<>(ResultEnum.SUCCESS);
    }
}