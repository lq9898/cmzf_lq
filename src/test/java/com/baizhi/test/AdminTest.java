package com.baizhi.test;

import com.baizhi.dao.AdminDao;
import com.baizhi.entity.Admin;
import com.baizhi.entity.Album;
import com.baizhi.entity.Banner;
import com.baizhi.entity.Chapter;
import com.baizhi.service.AdminService;
import com.baizhi.service.AlbumService;
import com.baizhi.service.BannerService;
import com.baizhi.service.ChapterService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;
import java.util.List;

public class AdminTest extends  BasicTest {
    @Autowired
    private AdminService adminService;
    @Autowired
    private AdminDao adminDao;
    @Autowired
    private BannerService bannerService;
    @Autowired
    private ChapterService chapterService;
    @Autowired
    private AlbumService albumService;
    @Test
    public void  test1(){
        adminService.motifyPwd("123456","c8158e3b-aa62-4b6a-a973-88319654cc43");
    }
   @Test
    public void test2(){
       Admin admin = adminDao.queryNameByPwd("李伟", "123");
       System.out.println(admin);
   }
   @Test
    public void ser(){
       List<Banner> banners = bannerService.queryByPage(1, 1);
       for (Banner banner : banners) {
           System.out.println(banner);
       }

   }
   @Test
    public void inseeeee(){
       Banner banner = new Banner();
       banner.setCreateDate(new Date());
       banner.setDescs("nice");
       banner.setImgPath("afdfasd");
       banner.setStatus("dfsa");
       banner.setTitle("nice");
       bannerService.add(banner);

   }
   @Test
    public  void delete(){
        bannerService.remove("1");
   }
   @Test
    public void update(){
       List<Banner> all = bannerService.findAll();
       for (Banner banner : all) {
           System.out.println(banner);
       }

   }
   @Test
    public void albumAdd(){
       Album album = new Album();
       album.setAuthor("小白");
       album.setCoverImg("sdfsad");
       album.setBrief("我只说一次");
       album.setBroadCast("我只说一次");
       //album.setCount("410");
       album.setPublishDate(new Date());
       album.setStar("五星");
       album.setTitle("我只说一次");
       albumService.add(album);

   }
   @Test
    public void chapterAdd(){
       Chapter chapter = new Chapter();
       chapter.setTitle("诚心");
       chapter.setDownPath("hhkh");
       chapter.setDuration("有点美");
       chapter.setSize("2.7M");
       chapter.setAlbum_id("941add34-2380-4acf-8e28-9b4d28df705c");
       chapter.setUploadTime(new Date());
       chapterService.add(chapter);

   }
   @Test
    public void queryAllAlbum(){
       List<Album> albums = albumService.findAll();
       for (Album album : albums) {
           System.out.println(album);
       }
   }
}
