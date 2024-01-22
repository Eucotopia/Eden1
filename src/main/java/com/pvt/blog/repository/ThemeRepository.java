package com.pvt.blog.repository;

import com.pvt.blog.pojo.Theme;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * @author eucotopia
 */
@Repository
public interface ThemeRepository extends JpaRepository<Theme, Long> {
}
