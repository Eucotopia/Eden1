package com.pvt.blog.controller;

import com.pvt.blog.pojo.ColumnEntity;
import com.pvt.blog.pojo.Post;
import com.pvt.blog.service.ColumnService;
import com.pvt.blog.util.ResultResponse;
import jakarta.annotation.Resource;
import lombok.extern.slf4j.Slf4j;
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
@RequestMapping("/column")
@Slf4j
public class ColumnController {
    @Resource
    private ColumnService columnService;

    /**
     * 获取专栏的所有文章
     *
     * @param id id
     * @return ResultResponse<ColumnEntity>
     */
    @GetMapping("/{id}")
    public ResultResponse<Set<Post>> getColumnById(@PathVariable Long id) {
        return columnService.getColumnById(id);
    }

    @GetMapping("/hot")
    public ResultResponse<List<ColumnEntity>> getHotColumns() {
        return columnService.getHotColumns();
    }
}
