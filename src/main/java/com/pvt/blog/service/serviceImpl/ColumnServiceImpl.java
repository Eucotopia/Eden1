package com.pvt.blog.service.serviceImpl;

import cn.hutool.core.bean.BeanUtil;
import com.pvt.blog.enums.ResultEnum;
import com.pvt.blog.pojo.ColumnEntity;
import com.pvt.blog.pojo.vo.ColumnVO;
import com.pvt.blog.repository.ColumnRepository;
import com.pvt.blog.service.ColumnService;
import com.pvt.blog.utils.ResultResponse;
import jakarta.annotation.Resource;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.Set;


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
    public ResultResponse<List<ColumnVO>> getHotColumns() {
        Pageable pageable = PageRequest.of(0, 2);
        List<ColumnEntity> columnEntityList = columnRepository.findColumnEntitiesByOrderByRatingDesc(pageable).orElseThrow(() -> new RuntimeException("栏目不存在"));
        List<ColumnVO> columnEntities = BeanUtil.copyToList(columnEntityList, ColumnVO.class);
        System.out.println(columnEntities);
        return ResultResponse.success(ResultEnum.SUCCESS, columnEntities);
    }

    @Override
    public ResultResponse<List<ColumnVO>> getColumns() {
        // get all columns
        List<ColumnEntity> columnEntities = columnRepository.findAll();
        List<ColumnVO> columns = BeanUtil.copyToList(columnEntities, ColumnVO.class);
        return ResultResponse.success(ResultEnum.SUCCESS, columns);
    }

    @Override
    public ResultResponse<Long> getCount() {
        return ResultResponse.success(ResultEnum.SUCCESS, columnRepository.count());
    }

    @Override
    public ResultResponse<String> addColumn(ColumnEntity columnEntity) {
        columnRepository.save(columnEntity);
        return ResultResponse.success(ResultEnum.SUCCESS, "添加栏目成功");
    }
}
