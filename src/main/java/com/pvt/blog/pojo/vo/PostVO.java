package com.pvt.blog.pojo.vo;

import com.pvt.blog.pojo.Category;
import com.pvt.blog.pojo.ColumnEntity;
import com.pvt.blog.pojo.Tag;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.Set;

/**
 * @author eucotopia
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class PostVO {
    private static final Long SERIAL_VERSION_UID = -6849794478244667710L;

    private Long id;

    private String title;

    private String content;

    private String summary;

    private Date createTime;

    private Boolean isTop;

    private Integer userId;

    private String cover;

    private Integer likes;

    private Integer views;

    private Boolean isPrivate;

    private Integer comments;

    private Float rating;

    private Set<ColumnEntity> columns;

    private Set<Category> categories;


    private Set<Tag> tags;
}
