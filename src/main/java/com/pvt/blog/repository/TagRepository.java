package com.pvt.blog.repository;

import com.pvt.blog.pojo.Tag;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Collection;
import java.util.Optional;
import java.util.Set;

/**
 * @author eucotopia
 */
@Repository
public interface TagRepository extends JpaRepository<Tag, Long> {
    Optional<Set<Tag>> findTagsByIdIn(Collection<Long> id);
}
