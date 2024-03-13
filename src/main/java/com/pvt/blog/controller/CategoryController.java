package com.pvt.blog.controller;

import com.pvt.blog.pojo.Category;
import com.pvt.blog.service.ICategoryService;
import com.pvt.blog.util.ResultResponse;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Optional;

/**
 * @author LIWEI
 */
@RestController
@RequestMapping("/category")
public class CategoryController {
    @Resource
    private ICategoryService categoryService;

    @GetMapping
    public ResultResponse<List<Category>> getCategories() {
        return categoryService.getCategories();
    }

    @GetMapping("/root")
    public ResultResponse<List<Category>> getRootCategories() {
        return categoryService.getRootCategories();
    }
}
