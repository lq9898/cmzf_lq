package com.baizhi.controller;

import com.baizhi.entity.User;
import com.baizhi.service.UserService;
import com.baizhi.util.LoadUtil;
import com.baizhi.util.SaltUtils;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("User")
public class UserController {
    @Autowired
    private UserService userService;
    @RequestMapping("register")
    public @ResponseBody Map<String,Object> register(MultipartFile userImg, HttpServletRequest request,User user){
        Map<String, Object> result = new HashMap<>();
        try {
            String salt = SaltUtils.getSalt(4);
            String md2Hex = DigestUtils.md2Hex(user.getPassword() + salt);
            user.setSalt(salt);
            user.setPassword(md2Hex);
            String realPath = LoadUtil.load(userImg, request, "file/user");
            user.setHeadPic(realPath);
            userService.add(user);
            result.put("success",true);

        } catch (Exception e) {
            e.printStackTrace();
            result.put("success",false);
            result.put("message",e.getMessage());
        }
        return  result;
    }
    @RequestMapping("findByPage")
    public @ResponseBody Map<String,Object> findByPage(int page,int rows){
        Map<String, Object> result = new HashMap<>();
        try {
            List<User> users = userService.queryByPage(page, rows);
            Long total = userService.findTotal();
            result.put("total",total);
            result.put("rows",users);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
    @RequestMapping("delete")
    public @ResponseBody Map<String,Object> delete(String id){
        Map<String, Object> result = new HashMap<>();

        try {

            userService.motityStatus(id,"F");
            result.put("success",true);

        } catch (Exception e) {
            e.printStackTrace();
            result.put("success",false);
            result.put("message",e.getMessage());
        }
        return result;
    }
    @RequestMapping("login")
    public  @ResponseBody  String login(String username, String password,  HttpServletResponse response){
        System.out.println(username);
        System.out.println(password);
        response.setCharacterEncoding("UTF-8");
        return  userService.findNameByPwd(username, password);


    }
    @RequestMapping("motityStatus")
    public @ResponseBody Map<String,Object> motityStatus(String id,String status){
        HashMap<String, Object> result = new HashMap<>();

        try {
            userService.motityStatus(id,status);
            result.put("success",true);
        } catch (Exception e) {
            e.printStackTrace();
            result.put("success",false);
            result.put("message",e.getMessage());
        }
        return  result;
    }
}
