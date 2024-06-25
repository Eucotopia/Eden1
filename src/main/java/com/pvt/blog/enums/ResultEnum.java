package com.pvt.blog.enums;

import com.pvt.blog.common.ResultConstant;
import lombok.Getter;

@Getter
public enum ResultEnum {
    SUCCESS(200, "成功"),
    FAIL(400, "失败"),
    FAIL_NO_USER_PERMISSION(403, ResultConstant.FAIL_NO_USER_PERMISSION),
    SUCCESS_USER_REGISTER(200, ResultConstant.SUCCESS_USER_REGISTER),
    SUCCESS_POST_ADD(202, ResultConstant.SUCCESS_POST_ADD),
    FAIL_USER_EXIST(409, ResultConstant.USER_EXIST),
    FAIL_EMAIL_FORMAT(410, ResultConstant.INVALID_EMAIL_FORMAT),
    FAIL_TITLE_EMPTY(411, ResultConstant.TITLE_EMPTY),
    FAIL_SUMMARY_EMPTY(412, ResultConstant.SUMMARY_EMPTY),
    FAIL_USER_NOT_EXIST(404, ResultConstant.USER_NOT_EXIST),
    FAIL_CONTENT_EMPTY(414, ResultConstant.CONTENT_EMPTY),
    FAIL_FAQ_EMPTY(416, ResultConstant.FAQ_EMPTY),
    NULL_POINT_EXCEPTION(415, ResultConstant.NULL_POINTER_EXCEPTION),
    FAIL_NO_LOGIN(401, ResultConstant.FAIL_NO_LOGIN);

    private final Integer code;
    private final String message;

    ResultEnum(Integer code, String message) {
        this.code = code;
        this.message = message;
    }
}
