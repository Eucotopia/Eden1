package com.pvt.blog.repository;

import com.pvt.blog.pojo.FriendLink;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * @author LIWEI
 */
@Repository
public interface FriendLinkRepository extends JpaRepository<FriendLink, Long> {
}
