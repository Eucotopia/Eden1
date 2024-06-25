package com.pvt.blog.service;

import com.pvt.blog.pojo.Comment;
import com.pvt.blog.pojo.dto.CommentDTO;
import com.pvt.blog.pojo.dto.PostDTO;
import com.pvt.blog.pojo.vo.CommentVO;
import com.pvt.blog.utils.ResultResponse;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface ICommentService {

    ResultResponse<String> addComment(CommentDTO commentDTO);

    /**
     * get comment by post id
     *
     * @return List<CommentDTO>
     */
    ResultResponse<List<CommentVO>> getComment(String postId);
}
