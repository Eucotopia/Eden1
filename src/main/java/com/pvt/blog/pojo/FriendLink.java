package com.pvt.blog.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import java.util.Date;

/**
 * @author LIWEI
 */
@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "friend_link")
@EntityListeners(AuditingEntityListener.class)
public class FriendLink {
    /**
     * 友链 ID
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    /**
     * 站点标题
     */
    @Column(name = "title")
    private String title;

    /**
     * 站点描述
     */
    @Column(name = "description")
    private String description;

    /**
     * 站点链接
     */
    @Column(name = "link")
    private String link;

    /**
     * 站点 logo
     */
    @Column(name = "avatar")
    private String avatar;

    /**
     * 站点状态
     * 1:正常
     * 0:禁用
     * 2:审核中
     */
    @Column(name = "status")
    private Integer status;

    /**
     * 创建时间
     */
    @CreatedDate
    @LastModifiedDate
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @Column(name = "create_time")
    private Date createTime;
}
