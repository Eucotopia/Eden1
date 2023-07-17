package com.pvt.blog.enums;

/**
 * @author LW
 */
public enum ResultEnum {
    SUCCESS(200, "成功"),
    FAIL_USER_EXIST(409,"用户已存在！");
    /**
     * 状态码
     */
    private final Integer code;

    /**
     * 响应消息
     */
    private final String message;

    public Integer getCode() {
        return code;
    }

    public String getMessage() {
        return message;
    }


    ResultEnum(Integer code, String message) {
        this.code = code;
        this.message = message;
    }
}
