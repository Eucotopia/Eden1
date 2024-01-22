package com.pvt.blog.pojo;

import jakarta.persistence.*;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;

@Table(name = "category")
@Data
@Entity
public class Category implements Serializable {
    @Serial
    private static final long serialVersionUID = -6849794478244667750L;
    /**
     * 种类 ID
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "name")
    private String name;

    @Column(name = "parent_id")
    private Long parentId;
}
