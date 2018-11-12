package com.baizhi.controller;

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
@RequestMapping("Article")
public class ArticleController {
    @Autowired
    private ArticleService articleService;
    @RequestMapping("findAllArticle")
    public @ResponseBody Map<String,Object> findAllArticle(int page, int rows){
        HashMap<String, Object> result = new HashMap<>();
        try {
            List<Article> art = articleService.queryByPage(page, rows);
            Long total = articleService.findTotal();
            result.put("total",total);
            result.put("rows",art);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return  result;
    }
    @RequestMapping("save")
    public @ResponseBody Map<String,Object> save(MultipartFile ipt, HttpServletRequest request,Article article){
        HashMap<String, Object> result = new HashMap<>();
        System.out.println(article);
        try {
            String arti = LoadUtil.load(ipt, request, "file/article");

            System.out.println("头像"+arti);
            article.setImgPath(arti);
            articleService.add(article);
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
            Article article = articleService.findById(id);
            String realPath = request.getSession().getServletContext().getRealPath(article.getImgPath());
            File file = new File(realPath);
            file.delete();
            articleService.remove(id);
            result.put("success",true);
        } catch (Exception e) {
            e.printStackTrace();
            result.put("success",false);
            result.put("message",e.getMessage());
        }
        return  result;
    }
    @RequestMapping("update")
    public @ResponseBody Map<String,Object> update(MultipartFile ipt, HttpServletRequest request,Article article){
        HashMap<String, Object> result = new HashMap<>();
        try {
            String id = article.getId();
            Article art = articleService.findById(id);
           // System.out.println("之前的路径"+ban.getImgPath());

            String realPath = request.getSession().getServletContext().getRealPath(art.getImgPath());
           // System.out.println("realPath"+realPath);
            File file = new File(realPath);
            boolean delete = file.delete();
           // System.out.println(delete);
            String lunbotu = LoadUtil.load(ipt, request, "file/article");
            //System.out.println("修改的路径"+lunbotu);
            article.setImgPath(lunbotu);
            articleService.motify(article);
            result.put("success",true);
        } catch (Exception e) {
            e.printStackTrace();
            result.put("success",false);
            result.put("message",e.getMessage());
        }
        return  result;
    }
 @RequestMapping("findById")
    public @ResponseBody Article findById(String id){
        return articleService.findById(id);
 }
    @RequestMapping("deleteAll")
    public  @ResponseBody Map<String,Object> deleteAll(String[] id){
        Map<String, Object> result = new HashMap<String,Object>();
        try{

           articleService.removeAll(id);
            result.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            result.put("success",false);
            result.put("message",e.getMessage());
        }
        return result;
    }

}
