package com.baizhi.dao;


import com.baizhi.entity.Admin;
import org.apache.ibatis.annotations.Param;

public interface AdminDao extends BasicDao<Admin> {
    void updatePwd(@Param("password") String password,@Param("id") String id);
    Admin queryById(String id);

}
