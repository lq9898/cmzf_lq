package com.baizhi.service;

import com.baizhi.entity.User;
import org.apache.ibatis.annotations.Param;

public interface UserService extends Iservice<User>{
    void motityStatus(String id,String status);
    String findNameByPwd(@Param("username") String username, @Param("password") String password);
}
