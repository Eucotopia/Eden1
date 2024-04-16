package com.pvt.blog.service.serviceImpl;

import com.pvt.blog.enums.ResultEnum;
import com.pvt.blog.pojo.Post;
import com.pvt.blog.pojo.Tag;
import com.pvt.blog.repository.TagRepository;
import com.pvt.blog.service.ITagService;
import com.pvt.blog.util.ResultResponse;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.util.Set;

/**
 * @author eucotopia
 */
@Service
public class TagServiceImpl implements ITagService {
    @Resource
    private TagRepository tagRepository;

    @Override
    public ResultResponse<Set<Post>> getPostsByTag(Long id) {
        Tag byId = tagRepository.findById(id).orElseThrow(() -> new RuntimeException("没有该标签"));
        return ResultResponse.success(ResultEnum.SUCCESS, byId.getPosts());
    }
}
