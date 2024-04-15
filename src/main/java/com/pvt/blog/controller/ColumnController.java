package com.pvt.blog.controller;

import com.pvt.blog.pojo.ColumnEntity;
import com.pvt.blog.service.ColumnService;
import com.pvt.blog.util.ResultResponse;
import jakarta.annotation.Resource;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/column")
@Slf4j
public class ColumnController {
    @Resource
    private ColumnService columnService;

    @GetMapping("/{id}")
    public ResultResponse<ColumnEntity> getColumnById(@PathVariable Long id) {
        return columnService.getColumnById(id);
    }
    @GetMapping("/hot")
    public ResultResponse<List<ColumnEntity>> getHotColumns(){
        return columnService.getHotColumns();
    }
}
