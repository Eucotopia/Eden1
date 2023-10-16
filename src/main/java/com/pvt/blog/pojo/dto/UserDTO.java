package com.pvt.blog.pojo.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
@Data
@AllArgsConstructor
public class UserDTO {
    /**
     * 用户名
     */
    private String email;
    /**
     * 密码
     */
    private String password;

}
