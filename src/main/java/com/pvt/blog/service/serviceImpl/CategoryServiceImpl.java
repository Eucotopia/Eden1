package com.pvt.blog.service.serviceImpl;

import com.pvt.blog.enums.ResultEnum;
import com.pvt.blog.pojo.Category;
import com.pvt.blog.repository.CategoryRepository;
import com.pvt.blog.service.ICategoryService;
import com.pvt.blog.utils.ResultResponse;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;


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

    @Override
    public ResultResponse<List<Category>> getRootCategories() {
        return ResultResponse.success(ResultEnum.SUCCESS, categoryRepository.findCategoriesByParentIdAndIdAfter(0L, 0L));
    }

    @Override
    public ResultResponse<Long> getCategoryCount() {
        return ResultResponse.success(ResultEnum.SUCCESS, categoryRepository.count());
    }

    @Override
    public ResultResponse<List<Category>> getHotCategories() {
        // 获取所有类别
        List<Category> categoryList = categoryRepository.findAll();
        // 按照文章数量对类别进行排序，并获取前五个
        List<Category> topFiveCategories = categoryList.stream()
                .sorted(Comparator.comparingInt((Category category) -> category.getPosts().size()).reversed())
                .limit(4)
                .collect(Collectors.toList());

        return ResultResponse.success(ResultEnum.SUCCESS, topFiveCategories);
    }
}
