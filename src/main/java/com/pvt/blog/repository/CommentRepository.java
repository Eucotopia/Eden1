package com.pvt.blog.repository;

import com.pvt.blog.pojo.Comment;
import org.aspectj.apache.bcel.classfile.Module;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface CommentRepository extends JpaRepository<Comment, String> {
    /**
     * get comment by post id
     * @param postId post id
     * @return List<Comment>
     */
    Optional<List<Comment>> findCommentsByPostId(Integer postId);
}
