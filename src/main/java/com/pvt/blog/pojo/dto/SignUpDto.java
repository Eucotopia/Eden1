package com.pvt.blog.pojo.dto;

import jakarta.persistence.Transient;
import lombok.Data;

import java.io.Serializable;

/**
 * @author LW
 * @date 2023/7/17
 * @description
 */
@Data
public class SignUpDto implements Serializable {
    @Transient
    public static final Long serialVersionUID = -6849794470754667760L;
    private String username;
    private String password;
}
