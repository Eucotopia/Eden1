package com.pvt.blog.enums;

import lombok.Getter;

/**
 * @author LW
 */
@Getter
public enum ResultEnum {
    SUCCESS(200, "成功"),
    SUCCESS_USER_REGISTER(201, "用户注册成功!!!"),
    FAIL_USER_EXIST(409, "用户已存在!!!"),
    FAIL_EMEAIL_FORMAT(410, "邮箱格式错误!!!");
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
