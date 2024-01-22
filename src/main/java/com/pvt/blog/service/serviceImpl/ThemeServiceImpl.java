package com.pvt.blog.service.serviceImpl;

import com.pvt.blog.enums.ResultEnum;
import com.pvt.blog.pojo.Theme;
import com.pvt.blog.repository.ThemeRepository;
import com.pvt.blog.service.IThemeService;
import com.pvt.blog.util.ResultResponse;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author eucotopia
 */
@Service
public class ThemeServiceImpl implements IThemeService {
    @Resource
    private ThemeRepository themeRepository;

    @Override
    public ResultResponse<List<String>> getThemes() {
        List<String> themeNames = themeRepository.findAll().stream()
                .map(Theme::getThemeName) // 提取每个Theme对象的name属性
                .toList();
        return ResultResponse.success(ResultEnum.SUCCESS, themeNames);
    }
}
