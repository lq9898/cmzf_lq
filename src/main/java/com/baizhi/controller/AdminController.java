package com.baizhi.controller;

import com.baizhi.entity.Admin;
import com.baizhi.service.AdminService;
import com.sun.deploy.net.HttpResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("Admin")
public class AdminController {
    @Autowired
    private AdminService adminService;
    @RequestMapping("register")
    public @ResponseBody Map<String,Object> register(Admin admin){
        HashMap<String, Object> result = new HashMap<String, Object>();
        try {
            adminService.register(admin);
            result.put("success",true);
        } catch (Exception e) {
            e.printStackTrace();
            result.put("success",false);
            result.put("message",e.getMessage());
        }
        return  result;
    }
    @RequestMapping("login")
    public String login(HttpSession session, Admin admin,String enCode) {

        boolean login = adminService.login(admin.getAdminName(), admin.getPassword(),session);
        String img=(String) session.getAttribute("validationCode");
        if (login && img.equals(enCode)) {
                return "redirect:/back/main/main.jsp";
            }
           return  "redirect:/back/main/login.jsp";
    }
    @RequestMapping("exit")
    public String exit(HttpSession session){
       session.removeAttribute("Admin");
        return "redirect:/back/main/login.jsp";
    }
   @RequestMapping("changePwd")
    public @ResponseBody Map<String,Object> changePwd(String oldPwd,String password,String id){
       HashMap<String, Object> result = new HashMap<String, Object>();
            try{
                Admin admin = adminService.findById(id);
                System.out.println(admin);
                if(oldPwd.equals(admin.getPassword())){
                    adminService.motifyPwd(password,id);
                    result.put("success",true);
                    result.put("message","修改成功");
                    return  result;
                }else{
                    result.put("success",false);
                    result.put("message","旧密码输入不正确");
                    return  result;
                }
            }catch (Exception e){
                e.printStackTrace();
                result.put("success",false);
                result.put("message",e.getMessage());
                return  result;
            }
    }
}
