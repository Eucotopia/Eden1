package com.pvt.blog.utils;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author LIWEI
 */
public class ImageUtil {

    public static String uploadImage(MultipartFile file) throws IOException {
        String name = file.getOriginalFilename();
        String subffix = name.substring(name.lastIndexOf(".")+1,name.length());
        // 日期文件夹
        String nowFolder = new SimpleDateFormat("yyyyMMdd").format(new Date());
        // 新的文件名以日期命名:
        String fileName = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date()) + "." + subffix;
        // 获取项目路径到webapp
        String filepath = "/temp/fileupload/image" + "/" + nowFolder;
        File file1 = new File(filepath);

        // 文件路径不存在时,创建文件夹(可创建多层文件夹)
        if (!file1.exists()) {
            file1.mkdirs();
        }
        // 实际保存路径
        filepath += ("/" + fileName);
        // 保存文件
        try {
            file.transferTo(new File(filepath));
        } catch (IOException e) {
            e.printStackTrace();
        }
        // 保存数据库的相对路径
        String relativePath = "image/" + nowFolder + "/" + fileName;
        return relativePath;
    }
}
