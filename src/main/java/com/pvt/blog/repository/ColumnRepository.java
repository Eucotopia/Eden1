package com.pvt.blog.repository;

import com.pvt.blog.pojo.ColumnEntity;
import com.pvt.blog.pojo.vo.ColumnVO;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
import java.util.Set;

/**
 * @author LIWEI
 */
@Repository
public interface ColumnRepository extends JpaRepository<ColumnEntity, Long> {
    /**
     * 根据评分获取前两位专栏
     *
     * @param pageable pageable
     * @return List<ColumnEntity>
     */
    Optional<List<ColumnEntity>> findColumnEntitiesByOrderByRatingDesc(Pageable pageable);

    /**
     * 根据 ID 获取专栏
     *
     * @param id Id
     * @return Optional<ColumnEntity>
     */
    Optional<Set<ColumnEntity>> findColumnEntitiesById(Long id);
}
