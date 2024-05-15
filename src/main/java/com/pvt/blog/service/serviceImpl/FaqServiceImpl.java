package com.pvt.blog.service.serviceImpl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.StrUtil;
import com.pvt.blog.enums.ResultEnum;
import com.pvt.blog.pojo.Faq;
import com.pvt.blog.repository.FaqRepository;
import com.pvt.blog.service.IFaqService;
import com.pvt.blog.utils.ResultResponse;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author LIWEI
 */
@Service
public class FaqServiceImpl implements IFaqService {
    @Resource
    private FaqRepository faqRepository;

    @Override
    public ResultResponse<String> addFaq(Faq faq) {
        // if question or answer is null, return error
        if (BeanUtil.isEmpty(faq) && StrUtil.isBlank(faq.getQuestion())) {
            return ResultResponse.error(ResultEnum.FAIL_FAQ_EMPTY);
        }
        faqRepository.saveAndFlush(faq);
        return ResultResponse.success(ResultEnum.SUCCESS, null);
    }

    @Override
    public ResultResponse<List<Faq>> getFaqs() {
        List<Faq> all = faqRepository.findAll();
        return ResultResponse.success(ResultEnum.SUCCESS, all);
    }

    @Override
    public ResultResponse<List<Faq>> getFaqsByAnswer() {
        List<Faq> faqsByAnswerIsNotEmpty = faqRepository.getFaqsByAnswerIsNotNullAndAnswerNotLike("");
        return ResultResponse.success(ResultEnum.SUCCESS, faqsByAnswerIsNotEmpty);
    }
}
