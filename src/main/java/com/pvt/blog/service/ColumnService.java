package com.pvt.blog.service;

import com.pvt.blog.pojo.ColumnEntity;
import com.pvt.blog.pojo.Post;
import com.pvt.blog.util.ResultResponse;
import org.springframework.stereotype.Service;

import java.io.Serial;
import java.util.List;
import java.util.Set;

/**
 * @author LIWEI
 */
@Service
public interface ColumnService {
    ResultResponse<Set<Post>> getColumnById(Long id);
    /**
     * 获取热门专栏
     *
     * @return ResultResponse
     */
    ResultResponse<List<ColumnEntity>> getHotColumns();
}
