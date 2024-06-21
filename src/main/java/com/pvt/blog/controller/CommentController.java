package com.pvt.blog.controller;

import com.pvt.blog.pojo.dto.CommentDTO;
import com.pvt.blog.service.ICommentService;
import com.pvt.blog.utils.ResultResponse;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/comment")
public class CommentController {
    @Resource
    private ICommentService commentService;

    /**
     * 1. 评论文章
     *     content、postId、userID、parent_id=null
     * @param commentDTO commentDTO
     * @return string
     */
    @PostMapping
    public ResultResponse<String> addComment(@RequestBody CommentDTO commentDTO) {
        return commentService.addComment(commentDTO);
    }
}
