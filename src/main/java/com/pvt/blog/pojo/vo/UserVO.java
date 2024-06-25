package com.pvt.blog.pojo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.UUID;

/**
 * @author LIWEI
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
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
     * authorization
     */
    private String authorization;

    /**
     * 用户头像
     */
    private String avatar;
}
