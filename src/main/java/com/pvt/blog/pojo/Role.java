package com.pvt.blog.pojo;

import jakarta.persistence.*;
import lombok.Data;

import java.io.Serializable;

/**
 * @author LW
 * @date 2023/7/15
 * @description 角色
 */
@Data
@Entity
@Table(name = "b_role")
public class Role implements Serializable {
    @Transient
    public static final Long serialVersionUID = -6849794470754623710L;
    @Id
    @Column(name = "role_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long role_id;
    @Column(name = "role_name")
    private String name;
}
