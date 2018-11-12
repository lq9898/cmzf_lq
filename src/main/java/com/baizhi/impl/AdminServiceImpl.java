package com.baizhi.impl;


import com.baizhi.dao.AdminDao;
import com.baizhi.entity.Admin;
import com.baizhi.service.AdminService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.UUID;

@Service
@Transactional
public class AdminServiceImpl implements AdminService {
   @Resource
    private AdminDao adminDao;
    @Override
    public void register(Admin admin) {
        admin.setId(UUID.randomUUID().toString());
        adminDao.insert(admin);
    }

    @Override
    public boolean login(String adminName, String password,HttpSession session) {
        Admin admin =  adminDao.queryNameByPwd(adminName, password);
        if(admin!=null){
            session.setAttribute("Admin",admin);
            return  true;
        }
        return false;
    }


    @Override
    public void motifyPwd(String password,String id) {
        adminDao.updatePwd(password,id);
    }

    @Override
    public Admin findById(String id) {
        return adminDao.queryById(id);
    }
}
