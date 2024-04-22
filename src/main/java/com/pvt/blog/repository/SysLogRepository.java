package com.pvt.blog.repository;

import com.pvt.blog.pojo.SysLog;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * @author LIWEI
 */
@Repository
public interface SysLogRepository extends JpaRepository<SysLog, Long> {
}
