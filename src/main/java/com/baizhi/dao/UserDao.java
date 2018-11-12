package com.baizhi.dao;

import com.baizhi.entity.User;
import org.apache.ibatis.annotations.Param;

public interface UserDao extends BasicDao<User> {
    void updateStatus(@Param("id") String id,@Param("status") String status);
    User queryNameByPwd(@Param("username") String username, @Param("password") String password);
}
