package com.pvt.blog.pojo;

import jakarta.persistence.*;
import lombok.Data;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

/**
 * @author LIWEI
 */
@Table(name = "product")
@Data
@Entity
public class Product {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(name = "name")
    private String name;
    @Column(name = "description")
    private String description;
    @Column(name = "price")
    private String price;
    @Column(name = "href")
    private String href;
    @Column(name = "image_src")
    private String imageSrc;
    @Column(name = "rating")
    private Double rating;
    @Column(name = "information")
    private String information;
}
