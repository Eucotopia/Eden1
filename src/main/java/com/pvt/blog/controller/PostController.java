package com.pvt.blog.controller;

import com.pvt.blog.pojo.Post;
import com.pvt.blog.pojo.dto.PostDTO;
import com.pvt.blog.service.IPostService;
import com.pvt.blog.util.ResultResponse;
import jakarta.annotation.Resource;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author LIWEI
 */
@RequestMapping("/post")
@RestController
@Slf4j
public class PostController {
    @Resource
    private IPostService postService;

    /**
     * 分页查询所有文章
     *
     * @return ResultResponse<List < Post>>
     */
    @GetMapping("/{page}/{size}")
    public ResultResponse<List<Post>> getAllPost(@PathVariable("page") Integer page, @PathVariable("size") Integer size) {
        return postService.findAll(page, size);
    }

    /**
     * 添加博客
     *
     * @param postDTO postDTO
     * @return ResultResponse<String>
     */
    @PostMapping
//    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public ResultResponse<String> addPost(@RequestBody PostDTO postDTO) {
        return postService.addPost(postDTO);
    }

    /**
     * 根据id查询博客
     */
    @GetMapping("/{id}")
    public ResultResponse<Post> getPostById(@PathVariable("id") Long id) {
        return postService.getPostById(id);
    }

    /**
     * 获取博客数量
     *
     * @return ResultResponse<Long>
     */
    @GetMapping("/count")
    public ResultResponse<Long> getPostCount() {
        return postService.getPostCount();
    }

    @GetMapping("/like/{id}")
    public ResultResponse<String> likeBlog(@PathVariable("id") Long id) {
        return postService.likeBlog(id);
    }

    @GetMapping("/isLiked/{id}")
    public ResultResponse<Boolean> isLiked(@PathVariable("id") Long id) {
        return postService.isLiked(id);
    }

    /**
     * 获取热门文章
     *
     * @return ResultResponse<List < Post>>
     */
    @GetMapping("/hot")
    public ResultResponse<List<Post>> getHotPosts() {
        return postService.getHostPosts();
    }
}
