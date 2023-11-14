package com.pvt.blog.pojo.dto;

import lombok.Data;

/**
 * @author LIWEI
 */
@Data
public class PostDTO {
    private String title;
    private String content;
    private String summary;
    private Integer isTop;
}
