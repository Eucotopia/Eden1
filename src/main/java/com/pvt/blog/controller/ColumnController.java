package com.pvt.blog.controller;

import cn.hutool.core.bean.BeanUtil;
import com.pvt.blog.enums.ResultEnum;
import com.pvt.blog.pojo.ColumnEntity;
import com.pvt.blog.pojo.Post;
import com.pvt.blog.pojo.vo.ColumnVO;
import com.pvt.blog.repository.ColumnRepository;
import com.pvt.blog.service.ColumnService;
import com.pvt.blog.util.ResultResponse;
import jakarta.annotation.Resource;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Optional;
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
    @Resource
    private ColumnRepository columnRepository;

    /**
     * 获取专栏的所有文章
     *
     * @param id id
     * @return ResultResponse<ColumnEntity>
     */
    @GetMapping("/{id}")
    public ResultResponse<ColumnVO> getColumnById(@PathVariable Long id) {
//        Set<ColumnEntity> columnEntitiesById = columnRepository.findColumnEntitiesById(id).orElseThrow(() -> new RuntimeException("asdf"));
        ColumnEntity byId = columnRepository.findById(id).orElseThrow(() -> new RuntimeException("asdf"));
        ColumnVO columnVO = BeanUtil.copyProperties(byId, ColumnVO.class);
        return ResultResponse.success(ResultEnum.SUCCESS, columnVO);
    }

    @GetMapping("/hot")
    public ResultResponse<List<ColumnVO>> getHotColumns() {
        return columnService.getHotColumns();
    }
}
