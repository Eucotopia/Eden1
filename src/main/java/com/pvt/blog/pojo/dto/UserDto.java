package com.pvt.blog.pojo.dto;

import lombok.Data;

/**
 * @author LW
 * @date 2023/7/14
 * @description 从前端接受的 User 对象
 */
@Data
public class UserDto {
    private String username;
    private String password;
    private String code;
}
