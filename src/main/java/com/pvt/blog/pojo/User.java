package com.pvt.blog.pojo;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import java.io.Serializable;
import java.util.Date;
import java.util.Objects;
import java.util.Set;
import java.util.UUID;

/**
 * @author eucotopia
 */
@Table(name = "user")
@Entity
@Setter
@Getter
@EntityListeners(AuditingEntityListener.class)
public class User implements Serializable {
    @Transient
    private static final Long SERIAL_VERSION_UID = -6249794470754667710L;
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
     * 邮箱
     */
    @Column(name = "email", nullable = false,unique = false)
    private String email;
    /**
     * 年龄
     */
    @Column(name = "age", nullable = true)
    private Integer age;
    /**
     * 密码
     */
    @Column(name = "password", nullable = false)
    private String password;
    /**
     * 座右铭
     */
    @Column(name = "motto", nullable = true)
    private String motto;
    /**
     * 创建时间
     */
    @CreatedDate
    @Column(name = "create_time", nullable = false)
    private Date createTime;

    /**
     * 头像地址
     */
    @Column(name = "avatar")
    private String avatar;
    /**
     * 账号状态
     */
    @Column(name = "status")
    private Integer status;

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", email='" + email + '\'' +
                ", age=" + age +
                ", password='" + password + '\'' +
                ", motto='" + motto + '\'' +
                ", createTime=" + createTime +
                ", avatar='" + avatar + '\'' +
                ", status=" + status +
                ", status='" + status + '\'' +
                ", address='" + address + '\'' +
                '}';
    }
    /**
     * 地址
     */
    @Column(name = "address")
    private String address;
    /**
     * 角色
     */
    @ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinTable(
            name = "user_role",
            joinColumns = @JoinColumn(
                    name = "user_id", referencedColumnName = "id"
            ),
            inverseJoinColumns = @JoinColumn(
                    name = "role_id", referencedColumnName = "id"
            )
    )
    private Set<Role> roles;
}
