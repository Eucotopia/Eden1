package com.pvt.blog.service.serviceImpl;

import cn.hutool.core.bean.BeanUtil;
import com.pvt.blog.controller.CommentController;
import com.pvt.blog.enums.ResultEnum;
import com.pvt.blog.pojo.Comment;
import com.pvt.blog.pojo.User;
import com.pvt.blog.pojo.dto.CommentDTO;
import com.pvt.blog.pojo.vo.CommentVO;
import com.pvt.blog.pojo.vo.UserVO;
import com.pvt.blog.repository.CommentRepository;
import com.pvt.blog.repository.UserRepository;
import com.pvt.blog.service.ICommentService;
import com.pvt.blog.utils.ResultResponse;
import jakarta.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CommentServiceImpl implements ICommentService {
    @Resource
    private CommentRepository commentRepository;

    @Resource
    private UserRepository userRepository;

    @Override
    public ResultResponse<String> addComment(CommentDTO commentDTO) {
        // 1. 不带 userId
        // 2. 不带 parentId

        // 如果 parentId 为空或者 parentId 为 “0”，则表示为根目录
        Comment comment = BeanUtil.copyProperties(commentDTO, Comment.class);

        if (comment.getParentId() == null || comment.getParentId().isEmpty()) {
            comment.setParentId(null);
        }
        comment.setLikes(0);
        commentRepository.save(comment);
        return ResultResponse.success(ResultEnum.SUCCESS, "添加评论成功");
    }

    @Override
    public ResultResponse<List<CommentVO>> getComment(String postId) {
        Optional<List<Comment>> commentsByPostId = commentRepository.findCommentsByPostId(Integer.valueOf(postId));
        List<CommentVO> list = List.of();
        if (commentsByPostId.isPresent()) {
            list = commentsByPostId.get().stream().map((comment -> {
                CommentVO commentVO = BeanUtil.copyProperties(comment, CommentVO.class);
                Integer userId = comment.getUserId();
                Optional<User> byId = userRepository.findById(Long.valueOf(userId));
                if (byId.isPresent()) {
                    UserVO user = BeanUtil.copyProperties(byId.get(), UserVO.class);
                    commentVO.setUser(user);
                }
                return commentVO;
            })).toList();
        }
        System.out.println("list" + list);
        return ResultResponse.success(ResultEnum.SUCCESS,list);
    }
}
