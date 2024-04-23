package com.pvt.blog.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import java.io.Serializable;
import java.util.Date;
import java.util.Objects;
import java.util.Set;

/**
 * @author eucotopia
 */
@Table(name = "post")
@Setter
@Getter
@Entity
@EntityListeners(AuditingEntityListener.class)
public class Post implements Serializable {
    private static final Long SERIAL_VERSION_UID = -6849794478244667710L;
    /**
     * 文章 ID
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    /**
     * 文章标题
     */
    @Column(name = "title", nullable = false)
    private String title;
    /**
     * 文章内容
     */
    @Column(name = "content", nullable = false)
    private String content;
    /**
     * 摘要
     */
    @Column(name = "summary", nullable = false)
    private String summary;
    /**
     * 创建时间
     */
    @CreatedDate
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @Column(name = "create_time")
    private Date createTime;
    /**
     * 是否置顶
     */
    @Column(name = "is_top")
    private Integer isTop;

    @Override
    public String toString() {
        return "Post{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", summary='" + summary + '\'' +
                ", createTime=" + createTime +
                ", isTop=" + isTop +
                ", userId=" + userId +
                ", cover='" + cover + '\'' +
                ", likes=" + likes +
                ", views=" + views +
                ", isPrivate=" + isPrivate +
                ", comments=" + comments +
                ", rating=" + rating +
                '}';
    }

    /**
     * 用户 ID
     */
    @CreatedBy
    @Column(name = "user_id")
    private Integer userId;
    /**
     * 博客封面
     */
    @Column(name = "cover")
    private String cover;
    /**
     * 点赞数
     */
    @Column(name = "likes")
    private Integer likes;
    /**
     * 浏览数
     */
    @Column(name = "views")
    private Integer views;
    /**
     * 是否私密
     */
    @Column(name = "is_private")
    private Integer isPrivate;
    /**
     * 评论数
     */
    @Column(name = "comments")
    private Integer comments;
    /**
     * 评分
     */
    @Column(name = "rating")
    private Float rating;
    /**
     * 专栏
     */
    @ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL, targetEntity = ColumnEntity.class)
    @JoinTable(name = "post_column",
            joinColumns = @JoinColumn(name = "post_id", referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(name = "column_id", referencedColumnName = "id")
    )
    private Set<ColumnEntity> columns;
    /**
     * 相关文章
     */
    @ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL, targetEntity = Category.class)
    @JoinTable(name = "post_category",
            joinColumns = @JoinColumn(name = "post_id", referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(name = "category_id", referencedColumnName = "id")
    )
    private Set<Category> categories;

    @ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL, targetEntity = Tag.class)
    @JoinTable(name = "post_tag",
            joinColumns = @JoinColumn(name = "post_id", referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(name = "tag_id", referencedColumnName = "id")
    )
    private Set<Tag> tags;
}
