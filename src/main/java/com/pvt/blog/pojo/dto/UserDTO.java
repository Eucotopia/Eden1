package com.pvt.blog.pojo.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

/**
 * @author LIWEI
 */
@Data
@AllArgsConstructor
public class UserDTO {
    /**
     * ID
     */
    private Long id;

    /**
     * name
     */
    private String name;

    /**
     * role
     */
    private String role;

    /**
     * age
     */
    private Integer age;

    /**
     * 邮箱
     */
    private String email;

    /**
     * avatar
     */
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
