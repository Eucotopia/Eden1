package com.pvt.blog.repository;

import com.pvt.blog.pojo.Category;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * @author LIWEI
 */
@Repository
public interface CategoryRepository extends JpaRepository<Category, Long> {
}
