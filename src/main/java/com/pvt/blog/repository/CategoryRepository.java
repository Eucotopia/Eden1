package com.pvt.blog.repository;

import com.pvt.blog.pojo.Category;
import io.netty.util.internal.ObjectPool;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

import java.util.List;
import java.util.Optional;
import java.util.Set;

/**
 * @author LIWEI
 */
@Repository
public interface CategoryRepository extends JpaRepository<Category, Long> {
    List<Category> findCategoriesByParentIdAndIdAfter(Long parentId, Long id);
    Optional<Set<Category>> getCategoriesById(Integer id);
}
