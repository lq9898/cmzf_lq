package com.baizhi.impl;

import com.baizhi.dao.UserDao;
import com.baizhi.entity.User;
import com.baizhi.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;
    @Override
    public void add(User user) {
        user.setId(UUID.randomUUID().toString());
        user.setDate(new Date());
        userDao.insert(user);
    }

    @Override
    public void remove(String id) {
        userDao.delete(id);
    }

    @Override
    public void motify(User user) {
        userDao.update(user);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<User> findAll() {
        return null;
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public User findById(String id) {
        return userDao.queryById(id);

    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<User> queryByPage(Integer page, Integer rows) {
        int start=(page-1)*rows;
        return userDao.queryByPage(start,rows);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Long findTotal() {
        return userDao.queryTotal();
    }

    @Override
    public void motityStatus(String id, String status) {
        userDao.updateStatus(id,status);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public String findNameByPwd(String username, String password) {
       User user=userDao.queryNameByPwd(username,password);
       if(user!=null && user.getStatus().equals("F")){
            return "1";
       }else if(user!=null && user.getStatus().equals("X")){
           return "2";
        }else if(user!=null){
           return "3";
       }else
           return "4";

    }
}
