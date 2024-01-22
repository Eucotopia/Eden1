package com.pvt.blog.controller;

import com.pvt.blog.service.IThemeService;
import com.pvt.blog.util.ResultResponse;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author eucotopia
 */
@RestController
@RequestMapping("/theme")
public class ThemeController {
    @Resource
    private IThemeService themeService;

    @GetMapping("/all")
    public ResultResponse<List<String>> getThemes() {
        return themeService.getThemes();
    }
}
