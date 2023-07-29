package com.pvt.blog.util;

import com.pvt.blog.enums.ResultEnum;
import lombok.Data;

/**
 * @author LW
 */
@Data
public class ResultResponse<T> {
    /**
     * 状态码
     */
    private Integer code;
    /**
     * 响应信息
     */
    private String message;
    /**
     * 返回结果
     */
    private T data;
    
    public ResultResponse(ResultEnum resultEnum, T data) {
        this(resultEnum);
        this.data = data;
    }

    public ResultResponse(ResultEnum resultEnum) {
        this.code = resultEnum.getCode();
        this.message = resultEnum.getMessage();
    }

    public static <T> ResultResponse<T> success(ResultEnum resultEnum, T data) {
        return new ResultResponse<>(resultEnum, data);
    }

    public static <T> ResultResponse<T> fail(ResultEnum resultEnum) {
        return new ResultResponse<>(resultEnum);
    }

}
