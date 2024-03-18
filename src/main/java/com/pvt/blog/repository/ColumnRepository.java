package com.pvt.blog.repository;

import com.pvt.blog.pojo.ColumnEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

/**
 * @author LIWEI
 */
@Repository
public interface ColumnRepository extends JpaRepository<ColumnEntity, Long> {

}
