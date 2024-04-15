package com.pvt.blog.service.serviceImpl;

import com.pvt.blog.enums.ResultEnum;
import com.pvt.blog.pojo.ColumnEntity;
import com.pvt.blog.repository.ColumnRepository;
import com.pvt.blog.service.ColumnService;
import com.pvt.blog.util.ResultResponse;
import jakarta.annotation.Resource;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class ColumnServiceImpl implements ColumnService {
    @Resource
    private ColumnRepository columnRepository;
    @Override
    public ResultResponse<ColumnEntity> getColumnById(Long id) {
        ColumnEntity byId = columnRepository.findById(id).orElseThrow(() -> new RuntimeException("栏目不存在"));
        return ResultResponse.success(ResultEnum.SUCCESS, byId);
    }

    @Override
    public ResultResponse<List<ColumnEntity>> getHotColumns() {
        Pageable pageable = PageRequest.of(0, 2);
        List<ColumnEntity> columnEntityList = columnRepository.findColumnEntitiesByOrderByRatingDesc(pageable).orElseThrow(() -> new RuntimeException("栏目不存在"));
        return ResultResponse.success(ResultEnum.SUCCESS, columnEntityList);
    }
}
