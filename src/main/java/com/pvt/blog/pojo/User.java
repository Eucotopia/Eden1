package com.pvt.blog.pojo;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import org.springframework.cglib.core.Local;

import java.time.LocalDate;
import java.time.LocalDateTime;

/**
 * 用户
 *
 * @author LW
 */
@TableName("b_user")
@Data
public class User {
    /**
     * 用户 id
     */
    @TableId("id")
    private Integer id;
    /**
     * 用户名
     */
    private String userName;
    /**
     * 密码
     */
    private String password;
    /**
     * 昵称
     */
    private String nickName;
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
}
