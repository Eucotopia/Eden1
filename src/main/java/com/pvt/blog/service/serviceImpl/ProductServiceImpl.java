package com.pvt.blog.service.serviceImpl;

import com.pvt.blog.enums.ResultEnum;
import com.pvt.blog.pojo.Product;
import com.pvt.blog.repository.ProductRepository;
import com.pvt.blog.service.ProductService;
import com.pvt.blog.util.ResultResponse;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {
    @Resource
    private ProductRepository productRepository;

    @Override
    public ResultResponse<List<Product>> getProducts() {
        List<Product> all = productRepository.findAll();
        return ResultResponse.success(ResultEnum.SUCCESS, all);
    }

    @Override
    public ResultResponse<String> addProduct(Product product) {
        productRepository.save(product);
        return ResultResponse.success(ResultEnum.SUCCESS, "OK");
    }
}
