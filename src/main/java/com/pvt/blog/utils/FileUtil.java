package com.pvt.blog.utils;

import cn.hutool.core.lang.UUID;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Objects;

/**
 * @author LIWEI
 */
@Component
public class FileUtil {

    public String uploadImage(MultipartFile file) throws IOException {
        String path = "/usr/data/image/";
        String suffix = Objects.requireNonNull(file.getOriginalFilename()).substring(file.getOriginalFilename().lastIndexOf("."));
        String fileName = UUID.randomUUID() + suffix;
        Files.copy(file.getInputStream(), Path.of(path + fileName));
        return fileName;
    }
}
