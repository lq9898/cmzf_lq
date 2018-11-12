package com.baizhi.service;


import com.baizhi.entity.Admin;

import javax.servlet.http.HttpSession;

public interface AdminService {
    void register(Admin admin);
    boolean login(String adminName, String password,HttpSession session);
    void motifyPwd(String password,String id);
    Admin findById(String id);
}
