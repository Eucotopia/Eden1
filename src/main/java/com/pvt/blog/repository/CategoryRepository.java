package com.pvt.blog.repository;

import com.pvt.blog.pojo.Category;
import io.netty.util.internal.ObjectPool;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

/**
 * @author LIWEI
 */
@Repository
public interface CategoryRepository extends JpaRepository<Category, Long> {
    Optional<List<Category>> findCategoriesByParentIdAndIdAfter(Long parentId, Long id);
}
