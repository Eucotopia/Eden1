package com.pvt.blog.common;

import com.pvt.blog.enums.ResultEnum;
import com.pvt.blog.utils.ResultResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import java.nio.file.AccessDeniedException;

/**
 * @author LIWEI
 */
@ControllerAdvice
@Slf4j
public class GlobalExceptionHandler {

    @ExceptionHandler(value = NullPointerException.class)
    @ResponseBody
    public ResultResponse nullPointerException(NullPointerException e) {
        log.error("NullPointerException:", e);
        return ResultResponse.error(ResultEnum.NULL_POINT_EXCEPTION);
    }

    @ExceptionHandler(value = UsernameNotFoundException.class)
    @ResponseBody
    public ResultResponse userNotFoundException(UsernameNotFoundException e) {
        log.error("UsernameNotFoundException:", e);
        return ResultResponse.error(ResultEnum.FAIL_USER_NOT_EXIST);
    }

}
