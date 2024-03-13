package com.pvt.blog.service;

import com.pvt.blog.pojo.Category;
import com.pvt.blog.util.ResultResponse;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

/**
 * @author LIWEI
 */
@Service
public interface ICategoryService {
    ResultResponse<List<Category>> getCategories();
    Optional<List<Category>> getRootCategories();
}
