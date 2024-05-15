package com.pvt.blog.repository;

import com.pvt.blog.pojo.Faq;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author LIWEI
 */
@Repository
public interface FaqRepository extends JpaRepository<Faq,Long> {
    List<Faq> getFaqsByAnswerIsNotNullAndAnswerNotLike(String answer);
}
