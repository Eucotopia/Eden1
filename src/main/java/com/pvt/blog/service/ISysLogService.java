package com.pvt.blog.service;

import com.pvt.blog.pojo.SysLog;
import com.pvt.blog.utils.ResultResponse;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author LIWEI
 */
@Service
public interface ISysLogService {
    ResultResponse<List<SysLog>> findAll(Integer page, Integer size);
}
