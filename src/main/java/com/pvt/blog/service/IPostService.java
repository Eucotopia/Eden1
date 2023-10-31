package com.pvt.blog.service;

import com.pvt.blog.pojo.Post;
import com.pvt.blog.repository.PostRepository;
import com.pvt.blog.util.ResultResponse;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public interface IPostService {
    ResultResponse<List<Post>> findALl(Integer page,Integer size);

    ResultResponse<String> addPost(Post post);

    ResultResponse<Post> getPostById(Long id);

}
