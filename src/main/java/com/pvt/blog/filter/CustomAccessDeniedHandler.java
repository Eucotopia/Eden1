package com.pvt.blog.filter;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.pvt.blog.enums.ResultEnum;
import com.pvt.blog.utils.ResultResponse;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.stereotype.Component;

import java.io.IOException;

@Component
public class CustomAccessDeniedHandler implements AccessDeniedHandler {

    private final ObjectMapper objectMapper = new ObjectMapper();

    @Override
    public void handle(HttpServletRequest request, HttpServletResponse response, AccessDeniedException accessDeniedException) throws IOException, ServletException {
        response.setStatus(HttpServletResponse.SC_FORBIDDEN);
        response.setContentType("application/json;charset=UTF-8");
        ResultResponse<Object> errorResult = new ResultResponse<>(ResultEnum.FAIL_NO_USER_PERMISSION);
        response.getWriter().write(objectMapper.writeValueAsString(errorResult));
        response.getWriter().flush();
    }
}
