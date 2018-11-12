package com.baizhi.controller;

import com.baizhi.entity.Album;
import com.baizhi.entity.Chapter;
import com.baizhi.service.AlbumService;
import com.baizhi.service.ChapterService;
import com.baizhi.util.LoadUtil;
import com.baizhi.util.ReadMp3;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@RequestMapping("Chapter")
@Controller
public class ChapterController {
    @Autowired
    private ChapterService chapterService;

    @RequestMapping("save")
    public @ResponseBody
    Map<String,Object> save(Chapter chapter, MultipartFile chapterImg,HttpServletRequest request){
        Map<String, Object> result = new HashMap<>();
        try {
            String realPath = LoadUtil.load(chapterImg, request, "file/chapter");
            String substring = realPath.substring(realPath.lastIndexOf("/") + 1);
           // System.out.println("控制器中"+realPath);
            synchronized (ReadMp3.read("F:\\ideacode\\maven\\cmfz_lq\\target\\cmfz_lq\\file\\chapter\\"+substring)) {
                String read = ReadMp3.read("F:\\ideacode\\maven\\cmfz_lq\\target\\cmfz_lq\\file\\chapter\\"+substring);
                chapter.setDuration(read);

            String size = ReadMp3.size("F:\\ideacode\\maven\\cmfz_lq\\target\\cmfz_lq\\file\\chapter\\"+substring);
            chapter.setSize(size);
            chapter.setDownPath(substring);



            chapterService.add(chapter);
            result.put("success",true);
            }
        } catch (Exception e) {
            e.printStackTrace();
            result.put("success",false);
            result.put("message",e.getMessage());
        }
        return  result;
    }
}
