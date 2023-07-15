package com.pvt.blog.mapper;

import com.pvt.blog.pojo.Role;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @author LW
 * @date 2023/7/15
 * @description
 */
public interface RoleMapper extends JpaRepository<Role, Long> {
}
