package com.pvt.blog.pojo;

import lombok.Data;
import org.springframework.data.annotation.Id;

/**
 * @author LW
 * @date 2023/7/15
 * @description 角色
 */
@Data
public class Role {
    @Id
    private Long id;
    private String name;
}
