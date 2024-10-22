package com.pvt.blog.pojo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CommentVO {
    /**
     * comment id
     */
    private String id;

    /**
     * user
     */
    private UserVO user;

    /**
     * rating
     */
    private Integer rating;

    /**
     * content
     */
    private String content;

    /**
     * comment time
     */
    private Date date;

    /**
     * title
     */
    private String title;
}
