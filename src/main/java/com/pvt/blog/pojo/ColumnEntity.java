package com.pvt.blog.pojo;

import jakarta.persistence.*;
import lombok.Data;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import java.util.Set;

/**
 * @author LIWEI
 */
@Table(name = "section")
@Data
@Entity
@EntityListeners(AuditingEntityListener.class)
public class ColumnEntity {
    private static final Long SERIAL_VERSION_UID = -6849794478244667710L;
    /**
     * 文章 ID
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @jakarta.persistence.Column(name = "name")
    private String name;
    @jakarta.persistence.Column(name = "description")
    private String description;
    @Column(name = "avatar")
    private String avatar;
    /**
     * 专栏评分：各个文章的平均值
     */
    @Column(name = "rating")
    private Long rating;
    @ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL, targetEntity = Post.class)
    @JoinTable(name = "post_column",
            joinColumns = @JoinColumn(name = "column_id", referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(name = "post_id", referencedColumnName = "id")
    )
    private Set<Post> posts;
}
