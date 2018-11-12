package com.baizhi.dao;



import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BasicDao<T> {
    void insert(T t);
    void update(T t);
    void delete(String id);
    void  deleteAll(String[] ids);
    T queryNameByPwd(@Param("adminName") String adminName, @Param("password") String password);
    List<T> queryAllMenu();
    List<T> queryAll();
    List<T> queryByPage(@Param("start")Integer start, @Param("rows")Integer rows);
    Long queryTotal();
    List<T> queryAllName();
    T queryById(String id);

}
