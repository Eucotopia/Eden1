package com.pvt.blog.pojo;


import jakarta.persistence.*;
import lombok.Data;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.Set;

/**
 * 用户
 *
 * @author LW
 */
@Table(name = "b_user")
@Data
@Entity
@EntityListeners(AuditingEntityListener.class)
public class User implements Serializable {
    @Transient
    private static final Long serialVersionUID = -6849794470754667710L;

    /**
     * 用户 id
     * strategy 表示主键生成策略
     */
    @Id
    @Column(name = "user_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer userId;

    /**
     * 用户名
     */
    @Column(name = "username", nullable = false, unique = true)
    private String username;

    /**
     * 密码
     */
    @Column(name = "password",nullable = false)
    private String password;

    /**
     * 创建时间
     */
    @CreatedDate
    @Column(name = "create_time")
    private Date createTime;

    /**
     * 性别
     */
    @Column(name = "gender",columnDefinition = "int default 0")
    private Integer gender;

    /**
     * 手机号
     */
    @Column(name="phone")
    private String phone;
    /**
     * 账号状态
     */
    @Column(name = "state",columnDefinition = "int default 0")
    private Integer state;

    /**
     * 用户简介
     */
    @Column(name = "biography")
    private String biography;

    /**
     * 最后一次登陆的时间
     */
    @Column(name = "login_time")
    private LocalDateTime lastLoginTime;

    /**
     * 头像地址
     */
    @Column(name = "avatar")
    private String avatar;

    /**
     * 最后一次登陆的 ip 地址
     */
    @Column(name = "ip_address")
    private String ip_address;

    /**
     * 角色
     */
    @ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL,targetEntity = Role.class)
    @JoinTable(name = "b_user_role",
            joinColumns = @JoinColumn(name = "user_id", referencedColumnName = "user_id"),
            inverseJoinColumns = @JoinColumn(name = "role_id", referencedColumnName = "role_id")
    )
    private Set<Role> roles;
}
