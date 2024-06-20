package com.pvt.blog.service;

import com.pvt.blog.pojo.Category;
import com.pvt.blog.utils.ResultResponse;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author LIWEI
 */
@Service
public interface ICategoryService {
    ResultResponse<List<Category>> getCategories();

    ResultResponse<List<Category>> getRootCategories();

    /**
     * get category count
     * @return ResultResponse
     */
    ResultResponse<Long> getCategoryCount();

    /**
     * get hot categories
     * @return ResultResponse<List<Category>>
     */
    ResultResponse<List<Category>> getHotCategories();
}
