package com.pvt.blog.controller;

import cn.hutool.core.bean.BeanUtil;
import com.pvt.blog.enums.ResultEnum;
import com.pvt.blog.pojo.ColumnEntity;
import com.pvt.blog.pojo.Post;
import com.pvt.blog.pojo.vo.ColumnVO;
import com.pvt.blog.repository.ColumnRepository;
import com.pvt.blog.service.ColumnService;
import com.pvt.blog.utils.ResultResponse;
import jakarta.annotation.Resource;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author eucotopia
 */
@RestController
@RequestMapping("/column")
@Slf4j
public class ColumnController {
    @Resource
    private ColumnService columnService;
    @Resource
    private ColumnRepository columnRepository;

    /**
     * get all post by column
     *
     * @param id id
     * @return ResultResponse<ColumnEntity>
     */
    @GetMapping("/{id}")
    public ResultResponse<List<Post>> getColumnById(@PathVariable Long id) {
        ColumnEntity columnEntity = columnRepository.findById(id).orElseThrow(() -> new RuntimeException("not found column"));
        List<Post> posts = columnEntity.getPosts().stream()
                .map(postEntity -> BeanUtil.copyProperties(postEntity, Post.class))
                .toList();
        return ResultResponse.success(ResultEnum.SUCCESS, posts);
    }

    @GetMapping
    public ResultResponse<List<ColumnVO>> getColumns() {
        return columnService.getColumns();
    }

    @GetMapping("/hot")
    public ResultResponse<List<ColumnVO>> getHotColumns() {
        return columnService.getHotColumns();
    }
}
