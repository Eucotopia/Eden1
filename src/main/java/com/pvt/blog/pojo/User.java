package com.pvt.blog.pojo;


import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import lombok.Data;

import java.time.LocalDateTime;
import java.util.Set;

/**
 * 用户
 *
 * @author LW
 */
@Table(name = "b_user")
@Data
@Entity
public class User {
    /**
     * 用户 id
     */
    @Id
    private Integer id;
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
    /**
     * 创建时间
     */
    private LocalDateTime createTime;
    /**
     * 最后一次登陆的时间
     */
    private LocalDateTime lastLoginTime;
    /**
     * 状态
     */
    private Integer state;
    /**
     * 最后一次登陆的 ip
     */
    private String lastLoginIp;
    /**
     * 手机号
     */
    private String phone;
    /**
     * 头像地址
     */
    private String cover;
    /**
     * 角色
     */
    @Transient
    private Set<Role> roles;
}
