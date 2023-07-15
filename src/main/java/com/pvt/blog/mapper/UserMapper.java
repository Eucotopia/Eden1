package com.pvt.blog.mapper;

import com.pvt.blog.pojo.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

/**
 * @author LW
 */
@Repository
public interface UserMapper extends JpaRepository<User,Long> {
    User findByUsername(String username);

    Boolean existsByEmail(String email);

    Optional<User> findByUsernameOrEmail(String username, String email);

    boolean existsByUsername(String username);
}
