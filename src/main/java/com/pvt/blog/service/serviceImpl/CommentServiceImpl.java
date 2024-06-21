package com.pvt.blog.service.serviceImpl;

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

        return null;
    }
}
