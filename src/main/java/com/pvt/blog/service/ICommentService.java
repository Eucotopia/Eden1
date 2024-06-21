package com.pvt.blog.service;

import com.pvt.blog.pojo.dto.CommentDTO;
import com.pvt.blog.pojo.dto.PostDTO;
import com.pvt.blog.utils.ResultResponse;
import org.springframework.stereotype.Service;

@Service
public interface ICommentService {
    ResultResponse<String> addComment(CommentDTO commentDTO);
}
