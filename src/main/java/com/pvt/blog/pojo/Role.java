package com.pvt.blog.pojo;

import jakarta.persistence.*;
import lombok.Data;

/**
 * @author LW
 * @date 2023/7/15
 * @description 角色
 */
@Data
@Entity
@Table(name = "b_role")
public class Role {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
}
