package com.pvt.blog.service.serviceImpl;

import com.pvt.blog.enums.ResultEnum;
import com.pvt.blog.pojo.Category;
import com.pvt.blog.repository.CategoryRepository;
import com.pvt.blog.service.ICategoryService;
import com.pvt.blog.util.ResultResponse;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author LIWEI
 */
@Service
public class CategoryServiceImpl implements ICategoryService {
    @Resource
    private CategoryRepository categoryRepository;

    @Override
    public ResultResponse<List<Category>> getCategories() {
        return ResultResponse.success(ResultEnum.SUCCESS, categoryRepository.findAll());
    }
}
