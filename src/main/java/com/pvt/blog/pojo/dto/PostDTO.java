package com.pvt.blog.pojo.dto;

import lombok.Data;

import java.io.Serializable;

/**
 * @author LIWEI
 */
@Data
public class PostDTO implements Serializable {
    private static final Long SERIAL_VERSION_UID = -6849794478244667410L;
    /**
     * 文章标题
     */
    private String title;
    /**
     * 文章内容
     */
    private String content;
    /**
     * 文章摘要
     */
    private String summary;
    /**
     * 是否置顶
     */
    private Boolean isTop;
    /**
     * 文章封面
     */
    private String cover;
    /**
     * 分类 ID
     */
    private Long categoryId;
    /**
     * 专栏 ID
     */
    private Long columnId;
    /**
     * 标签
     */
    private String[] tagId;
    /**
     * 评分
     */
    private Long rating;
    /**
     * 是否私密
     */
    private Boolean isPrivate;
}
