package com.pvt.blog.service.serviceImpl;

import com.pvt.blog.enums.ResultEnum;
import com.pvt.blog.pojo.dto.UserDto;
import com.pvt.blog.service.IUserService;
import com.pvt.blog.util.JwtTokenProvider;
import com.pvt.blog.util.ResultResponse;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

/**
 * @author LW
 */
@Service
public class UserServiceImpl implements IUserService {

    private AuthenticationManager authenticationManager;
    private PasswordEncoder passwordEncoder;
    private JwtTokenProvider jwtTokenProvider;


    public UserServiceImpl(
            JwtTokenProvider jwtTokenProvider,
            PasswordEncoder passwordEncoder,
            AuthenticationManager authenticationManager) {
        this.authenticationManager = authenticationManager;
        this.passwordEncoder = passwordEncoder;
        this.jwtTokenProvider = jwtTokenProvider;
    }

    // @Resource
    // private AuthenticationManager authenticationManager;
    @Override
    public ResultResponse<String> userLogin(UserDto userDto) {
        Authentication authentication = authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(
                userDto.getUsername(), userDto.getPassword()));

        SecurityContextHolder.getContext().setAuthentication(authentication);

        String token = jwtTokenProvider.generateToken(authentication);

        return new ResultResponse<String>(ResultEnum.SUCCESS);
    }
}
