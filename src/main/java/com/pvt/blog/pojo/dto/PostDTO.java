package com.pvt.blog.pojo.dto;

import com.pvt.blog.pojo.Category;
import lombok.Data;

import java.io.Serializable;

/**
 * @author LIWEI
 */
@Data
public class PostDTO implements Serializable {
    private static final Long serialVersionUid = -6849794478244667410L;
    private String title;
    private String content;
    private String summary;
    private Boolean isTop;
    private String cover;
    private Long categoryId;
}
