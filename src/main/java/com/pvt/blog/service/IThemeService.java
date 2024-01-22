package com.pvt.blog.service;

import com.pvt.blog.util.ResultResponse;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

/**
 * @author eucotopia
 */
@Service
public interface IThemeService {
    ResultResponse<List<String>> getThemes();
}
