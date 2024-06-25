package com.pvt.blog.filter;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.pvt.blog.enums.ResultEnum;
import com.pvt.blog.utils.ResultResponse;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.stereotype.Component;

import java.io.IOException;

@Component
public class CustomAuthenticationEntryPoint implements AuthenticationEntryPoint {

    private final ObjectMapper objectMapper = new ObjectMapper();

    @Override
    public void commence(HttpServletRequest request, HttpServletResponse response, AuthenticationException authException) throws IOException, ServletException {
        response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
        response.setContentType("application/json;charset=UTF-8");
        ResultResponse<Object> errorResult = new ResultResponse<>(ResultEnum.FAIL_NO_LOGIN);
        System.out.println(errorResult);
        response.getWriter().write(objectMapper.writeValueAsString(errorResult));
        response.getWriter().flush();
    }
}
