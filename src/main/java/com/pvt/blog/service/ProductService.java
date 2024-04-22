package com.pvt.blog.service;

import com.pvt.blog.utils.ResultResponse;
import org.springframework.stereotype.Service;
import com.pvt.blog.pojo.Product;

import java.util.List;

@Service
public interface ProductService {
    ResultResponse<List<Product>> getProducts();
    ResultResponse<String> addProduct(Product product);
}
