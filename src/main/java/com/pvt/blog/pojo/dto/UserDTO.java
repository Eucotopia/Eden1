package com.pvt.blog.pojo.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

/**
 * @author LIWEI
 */
@Data
@AllArgsConstructor
public class UserDTO {
    private Long id;
    private String name;
    private String role;
    private Integer age;
    /**
     * 邮箱
     */
    private String email;
    private String avatar;
    /**
     * 用户名
     */
    private String username;
    /**
     * 密码
     */
    private String password;
    /**
     * 昵称
     */
    private String nickname;
}
