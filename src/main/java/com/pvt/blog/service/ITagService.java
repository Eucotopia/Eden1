package com.pvt.blog.service;

import com.pvt.blog.pojo.Post;
import com.pvt.blog.pojo.Tag;
import com.pvt.blog.utils.ResultResponse;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Set;

/**
 * @author eucotopia
 */
@Service
public interface ITagService {
    ResultResponse<Set<Post>> getPostsByTag(Long id);

    /**
     * get all tags
     * @return ResultResponse<Set<String>>
     */
    ResultResponse<List<Tag>> getTags();

    /**
     * add tag
     * @param tag Set<String> tag
     * @return ResultResponse<String>
     */
    ResultResponse<String> addTag(List<String> tag);

    /**
     * get tag count
     * @return ResultResponse
     */
    ResultResponse<Long> getTagCount();
}
