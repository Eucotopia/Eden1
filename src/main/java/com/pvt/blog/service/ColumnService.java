package com.pvt.blog.service;

import com.pvt.blog.pojo.ColumnEntity;
import com.pvt.blog.util.ResultResponse;
import org.springframework.stereotype.Service;

import java.io.Serial;

/**
 * @author LIWEI
 */
@Service
public interface ColumnService {
    ResultResponse<ColumnEntity> getColumnById(Long id);
}
