package com.pvt.blog.controller;

import com.pvt.blog.common.ResultConstant;
import com.pvt.blog.pojo.Comment;
import com.pvt.blog.pojo.dto.CommentDTO;
import com.pvt.blog.pojo.vo.CommentVO;
import com.pvt.blog.service.ICommentService;
import com.pvt.blog.utils.ResultResponse;
import jakarta.annotation.Resource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/comment")
public class CommentController {
    private static final Logger log = LoggerFactory.getLogger(CommentController.class);
    @Resource
    private ICommentService commentService;

    /**
     * 1. 评论文章
     * content、postId、userID、parent_id=null
     *
     * @param commentDTO commentDTO
     * @return string
     */
    @PostMapping
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public ResultResponse<String> addComment(@RequestBody CommentDTO commentDTO) {
        return commentService.addComment(commentDTO);
    }

    @GetMapping("/{id}")
    public ResultResponse<List<CommentVO>> getComment(@PathVariable String id) {
        return commentService.getComment(id);
    }
}
