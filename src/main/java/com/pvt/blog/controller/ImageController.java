package com.pvt.blog.controller;

import com.pvt.blog.enums.ResultEnum;
import com.pvt.blog.utils.FileUtil;
import com.pvt.blog.utils.ResultResponse;
import jakarta.annotation.Resource;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.util.ClassUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

/**
 * @author LIWEI
 */
@RestController
@RequestMapping("/image")
public class ImageController {
    @Resource
    private FileUtil fileUtil;
    @Value("${server.port}")
    public String port;

    //TODO 进行上传时无法立即显示图片，而是需要等待一会儿才能够访问
    @PostMapping("/upload")
    public ResultResponse<String> uploadFile(@RequestParam("image") MultipartFile file) throws IOException {
//        // 获取上传文件名
//        String originalFilename = file.getOriginalFilename();
//
//        // 定义上传文件保存路径
//        String path = ClassUtils.getDefaultClassLoader().getResource("").getPath()+"static/";
//        System.out.println(path);
//        // 新建文件
//        File filepath = new File(path, originalFilename);
//        if (!filepath.getParentFile().exists()) {
//            filepath.getParentFile().mkdirs();
//        }
//
//        try {
//            file.transferTo(filepath);
//        }catch (IOException e){
//            e.printStackTrace();
//        }
        String fileName = fileUtil.uploadImage(file);
        return ResultResponse.success(ResultEnum.SUCCESS, "http://47.119.161.226" + "/image/" + fileName);
    }
}
