package com.baizhi.controller;

import com.baizhi.entity.Album;
import com.baizhi.entity.Article;
import com.baizhi.entity.Guru;
import com.baizhi.service.ArticleService;
import com.baizhi.service.GuruService;
import com.baizhi.util.LoadUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("Guru")
public class GuruController {
    @Autowired
    private GuruService guruService;
    @Autowired
    private ArticleService articleService;
   // @Autowired
   // private ArticleService articleService;
    @RequestMapping("findAllGuru")
    public @ResponseBody Map<String,Object> findAllGuru(int page, int rows){
        HashMap<String, Object> result = new HashMap<>();
        try {
            List<Guru> gurus = guruService.queryByPage(page, rows);
            Long total = guruService.findTotal();
            result.put("total",total);
            result.put("rows",gurus);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return  result;
    }
    @RequestMapping("save")
    public @ResponseBody Map<String,Object> save(MultipartFile pic, HttpServletRequest request,Guru guru){
        HashMap<String, Object> result = new HashMap<>();

        try {
            String gurus = LoadUtil.load(pic, request, "file/guru");
            System.out.println("头像"+gurus);
            guru.setHeadPic(gurus);
            guruService.add(guru);
            result.put("success",true);
        } catch (Exception e) {
            e.printStackTrace();
            result.put("success",false);
            result.put("message",e.getMessage());
        }
        return  result;
    }
    @RequestMapping("delete")
    public @ResponseBody Map<String,Object> delete(String id,HttpServletRequest request){
        HashMap<String, Object> result = new HashMap<>();

        try {
            Guru guru = guruService.findById(id);
            String realPath = request.getSession().getServletContext().getRealPath(guru.getHeadPic());
            File file = new File(realPath);
            file.delete();

            List<Article> articles = guru.getArticles();
            for (Article article : articles) {
                articleService.remove(article.getId());
                String ids=article.getId();
                System.out.println("文章id"+ids);
            }
            guruService.remove(id);
            result.put("success",true);
        } catch (Exception e) {
            e.printStackTrace();
            result.put("success",false);
            result.put("message",e.getMessage());
        }
        return  result;
    }
    @RequestMapping("update")
    public @ResponseBody Map<String,Object> update(MultipartFile pic, HttpServletRequest request,Guru guru){
        HashMap<String, Object> result = new HashMap<>();
        try {
            String id = guru.getId();
            Guru gur = guruService.findById(id);
           // System.out.println("之前的路径"+ban.getImgPath());

            String realPath = request.getSession().getServletContext().getRealPath(gur.getHeadPic());
           // System.out.println("realPath"+realPath);
            File file = new File(realPath);
            boolean delete = file.delete();
           // System.out.println(delete);
            String lunbotu = LoadUtil.load(pic, request, "file/guru");
            //System.out.println("修改的路径"+lunbotu);
            guru.setHeadPic(lunbotu);
            guruService.motify(guru);
            result.put("success",true);
        } catch (Exception e) {
            e.printStackTrace();
            result.put("success",false);
            result.put("message",e.getMessage());
        }
        return  result;
    }
   @RequestMapping("findById")
    public @ResponseBody Guru findById(String id){
        return guruService.findById(id);
 }
    @RequestMapping("findAllName")
    public @ResponseBody List<Guru>  findAllName(){
        return guruService.findAllName();
    }
    @RequestMapping("deleteAll")
    public  @ResponseBody Map<String,Object> deleteAll(String[] id){
        Map<String, Object> result = new HashMap<String,Object>();
        try{

            guruService.removeAll(id);
            result.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            result.put("success",false);
            result.put("message",e.getMessage());
        }
        return result;
    }
}

