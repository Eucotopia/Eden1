package com.pvt.blog.repository;

import com.pvt.blog.pojo.Category;
import com.pvt.blog.pojo.Post;
import jakarta.transaction.Transactional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.*;

import java.util.List;

import java.util.List;
import java.util.Optional;
import java.util.Set;


/**
 * @author eucotopia
 */
@Repository
@Transactional
public interface PostRepository extends JpaRepository<Post, Long> {
    long count();

    @Modifying
    @Query(value = "update post set likes = likes + 1 where id = ?", nativeQuery = true)
    void likeBlog(Long id);

    @Modifying
    @Query(value = "update post set likes = likes - 1 where id = ?", nativeQuery = true)
    void dislikeBlog(Long id);

    /**
     * get host posts
     *
     * @param pageable pageable
     * @return 5 host posts
     */
    Optional<List<Post>> getPostsByOrderByViewsDesc(Pageable pageable);

    List<Post> findByCategoriesInAndIdNot(Set<Category> categories, Long id);

    Optional<List<Post>> findPostsByCreateTimeAfter(Date date);
}
