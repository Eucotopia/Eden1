package com.pvt.blog.pojo;

import jakarta.persistence.*;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;
import java.util.List;
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

//    /**
//     * 文章
//     */
//    @ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL, targetEntity = Post.class)
//    @JoinTable(name = "post_category",
//            joinColumns = @JoinColumn(name = "category_id", referencedColumnName = "id"),
//            inverseJoinColumns = @JoinColumn(name = "post_id", referencedColumnName = "id")
//    )
//    private Set<Post> posts;
}
