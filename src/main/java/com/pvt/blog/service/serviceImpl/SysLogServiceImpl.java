package com.pvt.blog.service.serviceImpl;

import com.pvt.blog.enums.ResultEnum;
import com.pvt.blog.pojo.SysLog;
import com.pvt.blog.repository.SysLogRepository;
import com.pvt.blog.service.ISysLogService;
import com.pvt.blog.utils.ResultResponse;
import jakarta.annotation.Resource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author LIWEI
 */
@Service
public class SysLogServiceImpl implements ISysLogService {
    @Resource
    private SysLogRepository sysLogRepository;
    @Override
    public ResultResponse<List<SysLog>> findAll(Integer page, Integer size) {
        Pageable pageable = PageRequest.of(page, size);
        Page<SysLog> all = sysLogRepository.findAll(pageable);
        return ResultResponse.success(ResultEnum.SUCCESS, all.getContent());
    }
}
