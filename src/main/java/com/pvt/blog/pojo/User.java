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
@Table(name = "users")
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
    @Column(name = "id")
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
    @Column(name = "password",nullable = false)
    private String password;

    /**
     * 创建时间
     */
    @CreatedDate
    @Column(name = "registration_date")
    private Date registrationDate;

    @Column(name="email")
    private String email;


    /**
     * 用户简介
     */
    @Column(name = "bio")
    private String biography;


    /**
     * 头像地址
     */
    @Column(name = "profile_image")
    private String profileImage;


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
