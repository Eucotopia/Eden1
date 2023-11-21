package com.pvt.blog.repository;

import com.pvt.blog.pojo.Post;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;


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
}
