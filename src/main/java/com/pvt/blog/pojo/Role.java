package com.pvt.blog.pojo;

import jakarta.persistence.*;
import lombok.Data;

import java.io.Serializable;

/**
 * @author LW
 */
@Data
@Entity
@Table(name = "roles")
public class Role implements Serializable {
    @Transient
    public static final Long serialVersionUID = -6849794470754623710L;
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(name = "name")
    private String name;

    @Column(name = "description")
    private String description;
}
