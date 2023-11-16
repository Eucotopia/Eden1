package com.pvt.blog.repository;

import com.pvt.blog.pojo.Post;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


/**
 * @author eucotopia
 */
@Repository
public interface PostRepository extends JpaRepository<Post,Long> {
    long count();

}
