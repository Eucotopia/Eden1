package com.pvt.blog.pojo.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

/**
 * @author LIWEI
 */
@Data
@AllArgsConstructor
public class UserDTO {
    /**
     * email
     */
    private String email;
    /**
     * password
     */
    private String password;
}
