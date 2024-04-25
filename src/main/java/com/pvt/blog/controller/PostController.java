package com.pvt.blog.controller;

import com.pvt.blog.pojo.Post;
import com.pvt.blog.pojo.dto.PostDTO;
import com.pvt.blog.pojo.vo.PostVO;
import com.pvt.blog.service.IPostService;
import com.pvt.blog.utils.ResultResponse;
import jakarta.annotation.Resource;
import jakarta.transaction.Transactional;
import lombok.extern.slf4j.Slf4j;
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
    public ResultResponse<List<PostVO>> getAllPost(@PathVariable("page") Integer page, @PathVariable("size") Integer size) {
        return postService.findAll(page, size);
    }

    /**
     * 添加博客
     *
     * @param postDTO post
     * @return ResultResponse<String>
     */
    @PostMapping
//    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public ResultResponse<String> addPost(@RequestBody PostDTO postDTO) {
        System.out.println("postDTO"+postDTO);
        return postService.addPost(postDTO);
    }
    /**
     * 修改博客
     *
     * @param postDTO post
     * @return ResultResponse<String>
     */
    @PutMapping
//    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public ResultResponse<String> updatePost(@RequestBody PostDTO postDTO) {
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
    /**
     * 获取最近文章
     */
    @GetMapping("/recent")
    public ResultResponse<List<Post>> getRecentPosts() {
        return postService.getRecentPosts();
    }

    @DeleteMapping("/{id}")
    public ResultResponse<String> deletePost(@PathVariable("id") Long id) {
        return postService.deletePost(id);
    }
}
