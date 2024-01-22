package com.pvt.blog.pojo;

import jakarta.persistence.*;
import lombok.Data;

/**
 * @author eucotopia
 */
@Table(name = "theme")
@Data
@Entity
public class Theme {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "theme_name")
    private String themeName;
}
