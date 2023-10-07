package com.pvt.blog.enums;

import com.pvt.blog.common.ResultConstant;
import lombok.Getter;

/**
 * @author LW
 */
@Getter
public enum ResultEnum {
    /**
     * 成功
     */
    SUCCESS(200, "成功"),
    /**
     * 用户注册成功
     */
    SUCCESS_USER_REGISTER(201, "用户注册成功!!!"),
    /**
     * 用户名已存在
     */
    FAIL_USER_EXIST(409, ResultConstant.USER_EXIST),
    /**
     * 邮箱格式错误
     */
    FAIL_EMAIL_FORMAT(410, "邮箱格式错误!!!");

    /**
     * 状态码
     */
    private final Integer code;

    /**
     * 响应消息
     */
    private final String message;

    ResultEnum(Integer code, String message) {
        this.code = code;
        this.message = message;
    }
}
