package com.pvt.blog.pojo.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.pvt.blog.pojo.Category;
import com.pvt.blog.pojo.ColumnEntity;
import com.pvt.blog.pojo.Tag;
import jakarta.annotation.Nonnull;
import jakarta.annotation.security.DenyAll;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.annotation.LastModifiedDate;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

/**
 * @author LIWEI
 */
@AllArgsConstructor
@NoArgsConstructor
@Data
public class PostDTO implements Serializable {
    private static final Long SERIAL_VERSION_UID = -6849794478244667710L;

    /**
     * 文章 ID
     */
    private Long id;

    /**
     * 文章标题
     */
    private String title;
    /**
     * 文章内容
     */
    private String content;
    /**
     * 摘要
     */
    private String summary;
    /**
     * 创建时间
     */
    private Date createTime;
    /**
     * 是否置顶
     */
    private Boolean isTop;

    /**
     * 用户 ID
     */
    private Integer userId;

    /**
     * 文章状态
     */
    private Boolean status;

    /**
     * 博客封面
     */
    private String cover;
    /**
     * 点赞数
     */
    private Integer likes;
    /**
     * 浏览数
     */
    private Integer views;
    /**
     * 是否私密
     */
    private Boolean isPrivate;
    /**
     * 评论数
     */
    private Integer comments;
    /**
     * 评分
     */
    private Float rating;
    /**
     * 专栏
     */

    private Set<ColumnEntity> columns;
    /**
     * 相关文章
     */
    private Set<Category> categories;

    private Set<Tag> tags;
}
