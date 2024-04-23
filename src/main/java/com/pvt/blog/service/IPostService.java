package com.pvt.blog.service;

import com.pvt.blog.pojo.Post;
import com.pvt.blog.pojo.dto.PostDTO;
import com.pvt.blog.pojo.vo.PostVO;
import com.pvt.blog.utils.ResultResponse;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author eucotopia
 */
@Service
public interface IPostService {
    ResultResponse<List<PostVO>> findAll(Integer page, Integer size);

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
     * @return RResultResponse<List < Post>>
     */
    ResultResponse<List<Post>> getHostPosts();

    /**
     * 获取相关文章
     *
     * @param id id
     * @return List<Post>
     */
    ResultResponse<List<Post>> getPostsWithSameCategories(Long id);

    /**
     * 获取最近文章
     * 最近一周 -> 最近一月 -> 最近一年
     *
     * @return ResultResponse<List < Post>>
     */
    ResultResponse<List<Post>> getRecentPosts();
}
