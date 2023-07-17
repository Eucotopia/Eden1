package com.pvt.blog.pojo.dto;

import jakarta.persistence.Transient;
import lombok.Data;

import java.io.Serializable;

/**
 * @author LW
 * @date 2023/7/14
 * @description 从前端接受的 User 对象
 */
@Data
public class LoginDto implements Serializable {
    @Transient
    public static final Long serialVersionUID = -6849794470753367710L;
    private String username;
    private String password;
    private String code;
}
