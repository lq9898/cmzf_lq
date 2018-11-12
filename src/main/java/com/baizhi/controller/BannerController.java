package com.baizhi.controller;

import com.baizhi.entity.Banner;
import com.baizhi.service.BannerService;
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
@RequestMapping("Banner")
public class BannerController {
    @Autowired
    private BannerService bannerService;
    @RequestMapping("findAllBanner")
    public @ResponseBody Map<String,Object> findAllBanner(int page, int rows){
        HashMap<String, Object> result = new HashMap<>();
        try {
            List<Banner> banners = bannerService.queryByPage(page, rows);
            Long total = bannerService.findTotal();
            result.put("total",total);
            result.put("rows",banners);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return  result;
    }
    @RequestMapping("save")
    public @ResponseBody Map<String,Object> save(MultipartFile img, HttpServletRequest request,Banner banner){
        HashMap<String, Object> result = new HashMap<>();

        try {
            String lunbotu = LoadUtil.load(img, request, "file/lunbotu");
            banner.setImgPath(lunbotu);
            bannerService.add(banner);
            result.put("success",true);
        } catch (Exception e) {
            e.printStackTrace();
            result.put("success",false);
            result.put("message",e.getMessage());
        }
        return  result;
    }
    @RequestMapping("delete")
    public @ResponseBody Map<String,Object> delete(String id){
        HashMap<String, Object> result = new HashMap<>();

        try {
            bannerService.remove(id);
            result.put("success",true);
        } catch (Exception e) {
            e.printStackTrace();
            result.put("success",false);
            result.put("message",e.getMessage());
        }
        return  result;
    }
    @RequestMapping("update")
    public @ResponseBody Map<String,Object> update(MultipartFile img, HttpServletRequest request,Banner banner){
        HashMap<String, Object> result = new HashMap<>();
        try {
            String id = banner.getId();
            Banner ban = bannerService.findById(id);
            System.out.println("之前的路径"+ban.getImgPath());

            String realPath = request.getSession().getServletContext().getRealPath(ban.getImgPath());
           // System.out.println("realPath"+realPath);
            File file = new File(realPath);
            boolean delete = file.delete();
           System.out.println(delete);
            String lunbotu = LoadUtil.load(img, request, "file/lunbotu");
            System.out.println("修改的路径"+lunbotu);
            banner.setImgPath(lunbotu);
            bannerService.motify(banner);
            result.put("success",true);
        } catch (Exception e) {
            e.printStackTrace();
            result.put("success",false);
            result.put("message",e.getMessage());
        }
        return  result;
    }
 @RequestMapping("findById")
    public @ResponseBody Banner findById(String id){
        return bannerService.findById(id);
 }

    @RequestMapping("deleteAll")
    public  @ResponseBody Map<String,Object> deleteAll(String[] id){
        Map<String, Object> result = new HashMap<String,Object>();
        try{

            bannerService.removeAll(id);
            result.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            result.put("success",false);
            result.put("message",e.getMessage());
        }
        return result;
    }

}
