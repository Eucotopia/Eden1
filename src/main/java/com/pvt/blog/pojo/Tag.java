package com.pvt.blog.pojo;

import jakarta.persistence.*;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;

/**
 * @author eucotopia
 */
@Table(name = "tag")
@Data
@Entity
public class Tag implements Serializable {
    @Serial
    private static final long serialVersionUID = -6849792478244667750L;
    /**
     * 标签 ID
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    /**
     * 标签名称
     */
    @Column(name = "name")
    private String name;
}
