package com.pvt.blog.pojo;

import jakarta.persistence.*;
import lombok.Data;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;
import java.util.UUID;

@Table(name = "user")
@Data
@Entity
@EntityListeners(AuditingEntityListener.class)
public class User implements Serializable {
    @Transient
    private static final Long serialVersionUid = -6849794470754667710L;
    /**
     * 用户 ID
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
     * 昵称
     */
    @Column(name = "nickname", nullable = false)
    private String nickname;
    /**
     * 密码
     */
    @Column(name = "password", nullable = false)
    private String password;
    /**
     * 座右铭
     */
    @Column(name = "motto", nullable = false)
    private String motto;
    /**
     * 创建时间
     */
    @CreatedDate
    @Column(name = "create_time", nullable = false)
    private Date CreateTime;

    /**
     * 头像地址
     */
    @Column(name = "image")
    private String image;
    /**
     * 角色
     */
    @ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL,targetEntity = Role.class)
    @JoinTable(name = "user_role",
            joinColumns = @JoinColumn(name = "user_id", referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(name = "role_id", referencedColumnName = "id")
    )
    private Set<Role> roles;
}
