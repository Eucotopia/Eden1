package com.pvt.blog.pojo;

import jakarta.persistence.*;
import lombok.Data;
import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import java.io.Serializable;
import java.util.Date;
import java.util.UUID;

@Table(name = "post")
@Data
@Entity
@EntityListeners(AuditingEntityListener.class)
public class Post implements Serializable {
    private static final Long serialVersionUid = -6849794478244667710L;
    /**
     * 文章 ID
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    /**
     * 文章标题
     */
    @Column(name = "title")
    private String title;
    /**
     * 文章内容
     */
    @Column(name = "content")
    private String content;
    /**
     * 摘要
     */
    @Column(name = "summary")
    private String summary;
    /**
     * 创建时间
     */
    @CreatedDate
    @Column(name = "create_time")
    private Date createTime;
    /**
     * 是否置顶
     */
    @Column(name = "is_top")
    private Integer isTop;
    /**
     * 用户 ID
     */
    @CreatedBy
    @Column(name = "user_id")
    private Integer userId;
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
     * 评论数
     */
    @Column(name = "comments")
    private Integer comments;


}
