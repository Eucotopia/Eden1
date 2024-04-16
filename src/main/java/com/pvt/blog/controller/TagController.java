package com.pvt.blog.controller;

import com.pvt.blog.enums.ResultEnum;
import com.pvt.blog.pojo.Post;
import com.pvt.blog.pojo.Tag;
import com.pvt.blog.repository.TagRepository;
import com.pvt.blog.service.ITagService;
import com.pvt.blog.service.serviceImpl.TagServiceImpl;
import com.pvt.blog.util.ResultResponse;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Set;

/**
 * @author eucotopia
 */
@RestController
@RequestMapping("/tag")
public class TagController {
    @Resource
    private TagRepository tagRepository;
    @Resource
    private ITagService tagService;

    @GetMapping
    public ResultResponse<List<Tag>> getTags() {
        return ResultResponse.success(ResultEnum.SUCCESS, tagRepository.findAll());
    }

    /**
     * 获取该标签的所有文章
     *
     * @param id id
     * @return ResultResponse<Tag>
     */
    @GetMapping("/{id}")
    public ResultResponse<Set<Post>> getTagById(@PathVariable Long id) {
        return tagService.getPostsByTag(id);
    }

    @GetMapping("/a")
    public ResultResponse<Set<Tag>> getTagByArray() {
        Long[] a = new Long[]{1L, 2L};
        return ResultResponse.success(ResultEnum.SUCCESS, tagRepository.findTagsByIdIn(List.of(a)).orElseThrow());
    }
}
