package com.pvt.blog.pojo.dto;

import lombok.Data;

@Data
public class PostDTO {
    private String title;
    private String content;
    private String summary;
    private Integer isTop;
}
