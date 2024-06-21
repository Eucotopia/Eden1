package com.pvt.blog.pojo;

import jakarta.persistence.*;
import lombok.Data;
import org.hibernate.annotations.GenericGenerator;
import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import java.util.Date;

@Table(name = "comment")
@Data
@Entity
@EntityListeners(AuditingEntityListener.class)
public class Comment {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private String id;
    /**
     * 内容
     */
    @Column(name = "content")
    private String content;

    /**
     * 评论时间
     */
    @CreatedDate
    @Column(name = "date", nullable = false)
    private Date date;

    /**
     * 点赞数量
     */
    @Column(name = "likes")
    private Integer likes;

    @CreatedBy
    @LastModifiedBy
    @Column(name = "user_id")
    private Integer userId;

    @Column(name = "post_id")
    private Integer postId;

    @Column(name = "parent_id")
    private String parent_id;
}
