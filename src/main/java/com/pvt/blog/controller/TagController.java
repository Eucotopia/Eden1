package com.pvt.blog.controller;

import com.pvt.blog.enums.ResultEnum;
import com.pvt.blog.pojo.Tag;
import com.pvt.blog.repository.TagRepository;
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

    @GetMapping
    public ResultResponse<List<Tag>> getTags() {
        return ResultResponse.success(ResultEnum.SUCCESS, tagRepository.findAll());
    }

    @GetMapping("/{id}")
    public ResultResponse<Tag> getTagById(@PathVariable Long id) {
        return ResultResponse.success(ResultEnum.SUCCESS, tagRepository.findById(id).orElseThrow());
    }

    @GetMapping("/a")
    public ResultResponse<Set<Tag>> getTagByArray() {
        Long[] a = new Long[]{1L, 2L};
        return ResultResponse.success(ResultEnum.SUCCESS, tagRepository.findTagsByIdIn(List.of(a)).orElseThrow());
    }
}
