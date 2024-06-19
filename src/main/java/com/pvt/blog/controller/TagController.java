package com.pvt.blog.controller;

import com.pvt.blog.pojo.Post;
import com.pvt.blog.pojo.Tag;
import com.pvt.blog.service.ITagService;
import com.pvt.blog.utils.ResultResponse;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;
import java.util.Set;

/**
 * @author eucotopia
 */
@RestController
@RequestMapping("/tag")
public class TagController {
    @Resource
    private ITagService tagService;

    @GetMapping
    public ResultResponse<List<Tag>> getTags() {
        return tagService.getTags();
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

    @PostMapping
    public ResultResponse<String> addTag(@RequestParam("tags") String[] tags) {
        return tagService.addTag(Arrays.asList(tags));
    }
    
    @GetMapping("/count")
    public ResultResponse<Long> getTagCount() {
        return tagService.getTagCount();
    }

}
