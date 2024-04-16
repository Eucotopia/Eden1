package com.pvt.blog.pojo.vo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.pvt.blog.pojo.Post;
import jakarta.persistence.*;
import lombok.Data;

import java.io.Serializable;
import java.util.Set;

/**
 * @author eucotopia
 */
@Data
public class ColumnVO implements Serializable {
    private static final Long SERIAL_VERSION_UID = -6849794478244667710L;

    private Long id;
    private String name;
    private String description;
    private String avatar;
    private Long rating;
    private Set<Post> posts;
}
