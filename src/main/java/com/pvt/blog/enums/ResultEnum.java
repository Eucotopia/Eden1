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
     * 失败
     */
    FAIL(400, "失败"),
    /**
     * 用户注册成功
     */
    SUCCESS_USER_REGISTER(201, "用户注册成功!!!"),
    SUCCESS_POST_ADD(202, "添加文章成功!!!"),
    /**
     * 用户名已存在
     */
    FAIL_USER_EXIST(409, ResultConstant.USER_EXIST),
    /**
     * 邮箱格式错误
     */
    FAIL_EMAIL_FORMAT(410, "邮箱格式错误!!!"),
    FAIL_TITLE_EMPTY(411, "标题为空!!!"),
    FAIL_SUMMARY_EMPTY(412, "摘要为空!!!"),
    FAIL_CONTENT_EMPTY(412, "内容为空!!!");

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
