package com.pvt.blog.service;

import com.pvt.blog.pojo.Post;
import com.pvt.blog.util.ResultResponse;
import org.springframework.stereotype.Service;

import java.util.Set;

/**
 * @author eucotopia
 */
@Service
public interface ITagService {
    ResultResponse<Set<Post>> getPostsByTag(Long id);
}
