package com.pvt.blog.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author LW
 */
@RestController
public class UserController {
    @RequestMapping("/ok")
    public String OK(){
        return "OK";
    }

    @RequestMapping("/false")
    public String False(){
        return "false";
    }

}
