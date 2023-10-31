package com.pvt.blog.repository;

import com.pvt.blog.pojo.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

/**
 * @author LW
 */
@Repository
public interface UserRepository extends JpaRepository<User, Long> {
//    Optional<User1> findByEmail(String email);
    Boolean existsUserByUsername(String username);

    /**
     * 根据用户名查询用户
     * @param username username
     * @return User
     */
    Optional<User> findByUsername(String username);

    Boolean existsByUsername(String username);

}
