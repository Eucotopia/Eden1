package com.pvt.blog.pojo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.util.UUID;

/**
 * @author LIWEI
 */
@Data
@AllArgsConstructor
public class UserVO {
    /**
     * 用户名
     */
    private String username;
    /**
     * 昵称
     */
    private String email;
    /**
     * token
     */
    private String authorization;

    /**
     * 用户头像
     */
    private String cover;
}
