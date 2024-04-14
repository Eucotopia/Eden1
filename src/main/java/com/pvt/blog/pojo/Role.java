package com.pvt.blog.pojo;

import jakarta.persistence.*;
import lombok.Data;

import java.io.Serializable;
import java.util.UUID;

/**
 * @author LW
 */
@Data
@Entity
@Table(name = "role")
public class Role implements Serializable {
    @Transient
    public static final Long SERIAL_VERSION_UID = -6849794470754623710L;
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(name = "name")
    private String name;
}