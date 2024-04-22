package com.pvt.blog.service;

import com.pvt.blog.utils.ResultResponse;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author eucotopia
 */
@Service
public interface IThemeService {
    ResultResponse<List<String>> getThemes();
}
