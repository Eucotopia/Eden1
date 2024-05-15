package com.pvt.blog.controller;

import com.pvt.blog.pojo.Faq;
import com.pvt.blog.service.IFaqService;
import com.pvt.blog.utils.ResultResponse;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author LIWEI
 */
@RestController
@RequestMapping("/faq")
public class FaqController {

    @Resource
    private IFaqService faqService;
    @PostMapping
    public ResultResponse<String> addFaq(@RequestBody Faq faq){
        return faqService.addFaq(faq);
    }

    @GetMapping
    public ResultResponse<List<Faq>> getFaqs(){
        return faqService.getFaqs();
    }
    @GetMapping("/isAnswer")
    public ResultResponse<List<Faq>> getFaqsByAnswer(){
        return faqService.getFaqsByAnswer();
    }
}
