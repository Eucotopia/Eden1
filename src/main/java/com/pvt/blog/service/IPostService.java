package com.pvt.blog.service;

import com.pvt.blog.pojo.Post;
import com.pvt.blog.pojo.dto.PostDTO;
import com.pvt.blog.repository.PostRepository;
import com.pvt.blog.util.ResultResponse;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

/**
 * @author eucotopia
 */
@Service
public interface IPostService {
    ResultResponse<List<Post>> findAll(Integer page, Integer size);

    ResultResponse<String> addPost(PostDTO postDTO);

    ResultResponse<Post> getPostById(Long id);

    ResultResponse<Long> getPostCount();

    /**
     * 点赞
     *
     * @param id id
     * @return ResultResponse<String>
     */
    ResultResponse<String> likeBlog(Long id);

    ResultResponse<Boolean> isLiked(Long id);

    /**
     * 获取热门文章
     *
     * @return RResultResponse<List<Post>>
     */
    ResultResponse<List<Post>> getHostPosts();
}
