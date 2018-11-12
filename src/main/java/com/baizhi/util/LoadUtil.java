package com.baizhi.util;

import org.apache.commons.io.IOUtils;
import org.springframework.web.multipart.MultipartFile;
import redis.clients.jedis.Jedis;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.UUID;

public class LoadUtil {
    public static String load(MultipartFile file, HttpServletRequest request, String fileName) {
        try {
            request.setCharacterEncoding("UTF-8");
            String realPath = request.getSession().getServletContext().getRealPath("/" + fileName);
           // System.out.println("工具中"+realPath);
            file.transferTo(new File(realPath, file.getOriginalFilename()));
            return "" + fileName + "/" + file.getOriginalFilename();
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }




    public static void downLoad(HttpServletResponse response,HttpServletRequest request,String fileName,String openStyle) throws Exception{
        //根据接收的文件名去服务器中指定目录读文件
        String realPath = request.getSession().getServletContext().getRealPath("/file/chapter");
        //以文件输入流读取文件
        FileInputStream is = new FileInputStream(new File(realPath,fileName));
        //设置响应头

        response.setHeader("content.disposition", openStyle+";fileName="+URLEncoder.encode(fileName,"UTF-8"));
        //获取响应输出流
        ServletOutputStream os = response.getOutputStream();
        //使用IOUtils工具
        IOUtils.copy(is, os);
        //关流
        IOUtils.closeQuietly(is);
        IOUtils.closeQuietly(os);
    }




}


