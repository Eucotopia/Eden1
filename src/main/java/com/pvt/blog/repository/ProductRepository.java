package com.pvt.blog.repository;

import com.pvt.blog.pojo.Post;
import com.pvt.blog.pojo.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
}
