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
