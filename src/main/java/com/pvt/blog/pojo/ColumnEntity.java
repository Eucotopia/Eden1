package com.pvt.blog.pojo;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.Data;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import java.io.Serializable;
import java.util.Set;

/**
 * @author LIWEI
 */
@Table(name = "section")
@Data
@Entity
@EntityListeners(AuditingEntityListener.class)
public class ColumnEntity implements Serializable {
    private static final Long SERIAL_VERSION_UID = -6849794478244667710L;
    /**
     * column id
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    /**
     * column name
     */
    @Column(name = "name")
    private String name;

    /**
     * column description
     */
    @Column(name = "description")
    private String description;

    /**
     * column avatar
     */
    @Column(name = "avatar")
    private String avatar;

    /**
     * column rating
     */
    @Column(name = "rating")
    private Long rating;

    @JsonIgnore
    @ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL, targetEntity = Post.class, mappedBy = "columns")
    private Set<Post> posts;
}
