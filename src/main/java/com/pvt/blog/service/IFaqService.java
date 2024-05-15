package com.pvt.blog.service;

import com.pvt.blog.pojo.Faq;
import com.pvt.blog.utils.ResultResponse;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author LIWEI
 */
@Service
public interface IFaqService {
    ResultResponse<String> addFaq(Faq faq);

    ResultResponse<List<Faq>> getFaqs();

    ResultResponse<List<Faq>> getFaqsByAnswer();
}
