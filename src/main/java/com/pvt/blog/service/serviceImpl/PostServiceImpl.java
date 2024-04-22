package com.pvt.blog.service.serviceImpl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.StrUtil;
import com.pvt.blog.common.RedisConstant;
import com.pvt.blog.enums.ResultEnum;
import com.pvt.blog.pojo.Post;
import com.pvt.blog.pojo.dto.PostDTO;
import com.pvt.blog.repository.*;
import com.pvt.blog.service.IPostService;
import com.pvt.blog.utils.RedisUtil;
import com.pvt.blog.utils.ResultResponse;
import jakarta.annotation.Resource;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * @author eucotopia
 */
@Service
@Slf4j
public class PostServiceImpl implements IPostService {

    @Resource
    private RedisUtil redisUtil;
    @Resource
    private ColumnRepository columnRepository;
    @Resource
    private UserRepository userRepository;
    @Resource
    private TagRepository tagRepository;
    @Resource
    private PostRepository postRepository;
    @Resource
    private CategoryRepository categoryRepository;

    @Override
    public ResultResponse<List<Post>> findAll(Integer page, Integer size) {
        Pageable pageable = PageRequest.of(page, size);
        Page<Post> all = postRepository.findAll(pageable);
        System.out.println("TotalPages" + all.getTotalPages());
        List<Post> content = all.getContent();
        for (Post post : content) {
            System.out.println(post.getId());
        }
        System.out.println("content:" + all.getContent());
        return ResultResponse.success(ResultEnum.SUCCESS, all.getContent());
    }

    @Override
    public ResultResponse<String> addPost(PostDTO postDTO) {
        log.info("postDTO", postDTO);
        Long[] tagIds = new Long[postDTO.getTags().length];
        for (int i = 0; i < tagIds.length; i++) {
            tagIds[i] = Long.parseLong(postDTO.getTags()[i]);
        }
        if (StrUtil.isEmpty(postDTO.getTitle())) {
            return ResultResponse.error(ResultEnum.FAIL_TITLE_EMPTY);
        }
        if (StrUtil.isEmpty(postDTO.getSummary())) {
            return ResultResponse.error(ResultEnum.FAIL_SUMMARY_EMPTY);
        }
        if (StrUtil.isEmpty(postDTO.getContent())) {
            return ResultResponse.error(ResultEnum.FAIL_CONTENT_EMPTY);
        }
        Post post = BeanUtil.copyProperties(postDTO, Post.class);
        post.setIsTop(postDTO.getIsTop() ? 1 : 0);
        post.setIsPrivate(postDTO.getIsPrivate() ? 1 : 0);
        post.setCategories(categoryRepository.getCategoriesById(Math.toIntExact(postDTO.getCategoryId())).orElseThrow(() -> new RuntimeException("没有该分类")));
        post.setTags1(tagRepository.findTagsByIdIn(List.of(tagIds)).orElseThrow(() -> new RuntimeException("没有该标签")));
        if (postDTO.getColumnId() != null && postDTO.getColumnId() != 0) {
            post.setColumns(columnRepository.findColumnEntitiesById(postDTO.getColumnId()).orElseThrow(() -> new RuntimeException("没有该专栏")));
        }
        postRepository.saveAndFlush(post);
        return ResultResponse.success(ResultEnum.SUCCESS, "添加文章成功");
    }

    @Override
    public ResultResponse<Post> getPostById(Long id) {
        log.error("get post by id:{}", id);
        Post post = postRepository.findById(id).orElseThrow(() -> new RuntimeException("没有该文章"));
        return ResultResponse.success(ResultEnum.SUCCESS, post);
    }

    @Override
    public ResultResponse<Long> getPostCount() {
        return ResultResponse.success(ResultEnum.SUCCESS, postRepository.count());
    }

    @Override
    public ResultResponse<String> likeBlog(Long id) {
        User principal = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = principal.getUsername();
        com.pvt.blog.pojo.User user = userRepository.findByUsername(username).orElseThrow(() -> new RuntimeException("没有该用户"));
        String key = RedisConstant.BLOG_KEY + id + ":" + user.getId();
        // 判断是否点过赞
        if (redisUtil.hasKey(key)) {
            // 如果点过赞，就取消点赞
            redisUtil.deleteObject(key);
            postRepository.dislikeBlog(id);
        } else {
            // 如果没有点过赞，就点赞
            redisUtil.setCacheObject(key, id);
            postRepository.likeBlog(id);
        }
        return ResultResponse.success(ResultEnum.SUCCESS, "成功");
    }

    /**
     * 判断是否点过赞
     *
     * @param id id
     * @return ResultResponse<Boolean>
     */
    @Override
    public ResultResponse<Boolean> isLiked(Long id) {
        User principal = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        com.pvt.blog.pojo.User user = userRepository.findByUsername(principal.getUsername()).orElseThrow(() -> new RuntimeException("没有该用户"));
        String key = RedisConstant.BLOG_KEY + id + ":" + user.getId();
        if (redisUtil.hasKey(key)) {
            return ResultResponse.success(ResultEnum.SUCCESS, true);
        } else {
            return ResultResponse.success(ResultEnum.SUCCESS, false);
        }
    }

    @Override
    public ResultResponse<List<Post>> getPostsWithSameCategories(Long id) {
        Post post = postRepository.findById(id).orElseThrow(() -> new RuntimeException("没有该文章"));
        List<Post> byCategoriesAndIdNotIn = postRepository.findByCategoriesInAndIdNot(post.getCategories(), post.getId());
        System.out.println(byCategoriesAndIdNotIn);
        return ResultResponse.success(ResultEnum.SUCCESS, byCategoriesAndIdNotIn);
    }

    @Override
    public ResultResponse<List<Post>> getRecentPosts() {
        // 获取一周前的日期
        Date oneWeekAgo = getDateBefore(7);
        // 获取一个月前的日期
        Date oneMonthAgo = getDateBefore(30);
        // 获取一年前的日期
        Date oneYearAgo = getDateBefore(365);
        if (!postRepository.findPostsByCreateTimeAfter(oneWeekAgo).get().isEmpty()) {
            return ResultResponse.success(ResultEnum.SUCCESS, postRepository.findPostsByCreateTimeAfter(oneWeekAgo).orElseThrow(() -> new RuntimeException("没有最近一周的文章文章")));
        } else if (!postRepository.findPostsByCreateTimeAfter(oneMonthAgo).get().isEmpty()) {
            return ResultResponse.success(ResultEnum.SUCCESS, postRepository.findPostsByCreateTimeAfter(oneMonthAgo).orElseThrow(() -> new RuntimeException("没有最近一个月文章")));
        } else if (!postRepository.findPostsByCreateTimeAfter(oneYearAgo).get().isEmpty()) {
            return ResultResponse.success(ResultEnum.SUCCESS, postRepository.findPostsByCreateTimeAfter(oneYearAgo).orElseThrow(() -> new RuntimeException("没有最近一年的文章")));
        } else {
            return ResultResponse.success(ResultEnum.SUCCESS, postRepository.findAll());
        }
    }

    private Date getDateBefore(int days) {
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.DAY_OF_MONTH, -days);
        return calendar.getTime();
    }

    @Override
    public ResultResponse<List<Post>> getHostPosts() {
        List<Post> postsByViewsAfter = postRepository.getPostsByViewsAfter(20L);
        return ResultResponse.success(ResultEnum.SUCCESS, postsByViewsAfter);
    }
}
