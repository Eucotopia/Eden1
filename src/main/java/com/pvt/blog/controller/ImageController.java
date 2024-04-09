package com.pvt.blog.controller;

import com.pvt.blog.enums.ResultEnum;
import com.pvt.blog.util.FileUtil;
import com.pvt.blog.util.ImageUtil;
import com.pvt.blog.util.ResultResponse;
import jakarta.annotation.Resource;
import org.apache.tomcat.util.http.fileupload.FileUpload;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.UUID;

/**
 * @author LIWEI
 */
@RestController
@RequestMapping("/image")
public class ImageController {
    @Resource
    private FileUtil fileUtil;

    @PostMapping("/upload")
    public ResultResponse<String> uploadFile(@RequestParam("image") MultipartFile file) throws IOException {
        String fileName = fileUtil.uploadImage(file);
        return ResultResponse.success(ResultEnum.SUCCESS, "http://localhost:8080/image/" + fileName);
    }
}
