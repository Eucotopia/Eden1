package com.pvt.blog.pojo.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CommentDTO {

    private String content;

    private Integer userId;

    private Integer postId;

    private String parentId;

    private String title;
}
