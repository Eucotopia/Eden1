package com.pvt.blog.pojo;


import jakarta.persistence.*;
import lombok.Data;

import java.io.Serializable;
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
public class User implements Serializable {
    @Transient
    public static final Long serialVersionUID = -6849794470754667710L;
    /**
     * 用户 id
     */
    @Id
    // 设置主键生成策略:自增
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    /**
     * 用户名
     */
    @Column(name = "username", nullable = false, unique = true)
    private String username;
    /**
     * 密码
     */
    @Column(name = "password", unique = false, nullable = false)
    private String password;
    /**
     * 昵称
     */
    @Column(name = "nickname", unique = false, nullable = false)
    private String nickname;
    /**
     * 创建时间
     */
    @Column(name = "create_time", unique = false, nullable = true)
    private LocalDateTime createTime;
    /**
     * 最后一次登陆的时间
     */
    @Column(name = "last_login_time")
    private LocalDateTime lastLoginTime;
    /**
     * 状态
     */
    @Column(name = "state", nullable = false)
    private Integer state;
    /**
     * 最后一次登陆的 ip
     */
    @Column(name = "last_login_ip")
    private String lastLoginIp;
    /**
     * 手机号
     */
    @Column(name = "phone")
    private String phone;
    /**
     * 头像地址
     */
    @Column(name = "cover")
    private String cover;
    /**
     * 角色
     */
    @ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL,targetEntity = Role.class)
    @JoinTable(name = "users_roles",
            joinColumns = @JoinColumn(name = "user_id", referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(name = "role_id", referencedColumnName = "id")
    )
    private Set<Role> roles;
}
