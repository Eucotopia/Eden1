package com.pvt.blog.pojo;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.io.Serial;
import java.io.Serializable;
import java.util.Set;

/**
 * @author eucotopia
 */
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
    private Long id;

    @Column(name = "name")
    private String name;

    @Column(name = "parent_id")
    private Long parentId;

    /**
     * 文章
     */
    @JsonIgnore
    @ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL, targetEntity = Post.class, mappedBy = "categories")
    private Set<Post> posts;
}
