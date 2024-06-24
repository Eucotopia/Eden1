package com.pvt.blog.service.serviceImpl;

import cn.hutool.core.bean.BeanUtil;
import com.pvt.blog.pojo.Comment;
import com.pvt.blog.pojo.dto.CommentDTO;
import com.pvt.blog.repository.CommentRepository;
import com.pvt.blog.service.ICommentService;
import com.pvt.blog.utils.ResultResponse;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

@Service
public class CommentServiceImpl implements ICommentService {
    @Resource
    private CommentRepository commentRepository;

    @Override
    public ResultResponse<String> addComment(CommentDTO commentDTO) {
        Comment comment = BeanUtil.copyProperties(commentDTO, Comment.class);
        comment.setLikes(0);
        comment.setParent_id("0");
        commentRepository.save(comment);
        return null;
    }
}
