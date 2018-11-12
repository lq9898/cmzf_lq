package com.baizhi.controller;

import com.baizhi.entity.Album;
import com.baizhi.entity.Chapter;
import com.baizhi.service.AlbumService;
import com.baizhi.util.LoadUtil;
import org.aspectj.weaver.ast.Var;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("Album")
public class AlbumController {
    @Autowired
    private AlbumService albumService;

    @RequestMapping("findAllAlbum")
    public @ResponseBody
    List<Album> findAllAlbum() {
        //当前页
        List<Album> albums = albumService.findAll();
        //集数
        for(Album a:albums){
            //获取章节的长度，并设置到集数中
            a.setCount(a.getChildren().size());
            //调用update方法，更新数据库信息
            albumService.motify(a);
        }
        return albums;

    }

    @RequestMapping("save")
    public @ResponseBody
    Map<String, Object> save(Album album, MultipartFile albumImg, HttpServletRequest request) {
        Map<String, Object> result = new HashMap<>();
        try {
            String realPath = LoadUtil.load(albumImg, request, "file/album");
            System.out.println("传过来的路径" + realPath);
            System.out.println("专辑表" + album);
            album.setCoverImg(realPath);


            //String count = album.getCount();
            // String s=count+1;
            //Album byId = albumService.findById(album_id);
          //  byId.
            albumService.add(album);
            result.put("success", true);
        } catch (Exception e) {
            e.printStackTrace();
            result.put("success", false);
            result.put("message", e.getMessage());
        }
        return result;
    }

    @RequestMapping("findById")
    public @ResponseBody
    Album findById(String id) {
        return albumService.findById(id);
    }

    @RequestMapping("download")
    public void load(HttpServletResponse response, HttpServletRequest request, String fileName, String openStyle) {

        try {
                LoadUtil.downLoad(response,request,fileName,openStyle);
        } catch (Exception e) {
            e.printStackTrace();

        }

    }
    @RequestMapping("findAllName")
    public @ResponseBody List<Album>  findAllName(){
        return albumService.findAllName();
    }

}


