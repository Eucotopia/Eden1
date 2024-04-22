package com.pvt.blog.service;

import com.pvt.blog.pojo.ColumnEntity;
import com.pvt.blog.pojo.vo.ColumnVO;
import com.pvt.blog.utils.ResultResponse;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author LIWEI
 */
@Service
public interface ColumnService {
    ResultResponse<ColumnEntity> getColumnById(Long id);
    /**
     * 获取热门专栏
     *
     * @return ResultResponse
     */
    ResultResponse<List<ColumnVO>> getHotColumns();

    /**
     * get all columns
     * @return ResultResponse<List<ColumnVO>>
     */
    ResultResponse<List<ColumnVO>> getColumns();
}
