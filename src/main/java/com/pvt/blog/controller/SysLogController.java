package com.pvt.blog.controller;

import com.pvt.blog.pojo.SysLog;
import com.pvt.blog.service.ISysLogService;
import com.pvt.blog.utils.ResultResponse;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author LIWEI
 */
@RestController
@RequestMapping("/sysLog")
public class SysLogController {
    @Resource
    private ISysLogService sysLogService;

    @GetMapping("/{page}/{size}")
    public ResultResponse<List<SysLog>> getAllSysLog(@PathVariable("page") Integer page, @PathVariable("size") Integer size) {
        return sysLogService.findAll(page, size);
    }
}
