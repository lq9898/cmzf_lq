package com.baizhi.service;

import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface Iservice<T> {
    void add(T t);
    void remove(String id);
    void motify(T t);
    List<T> findAll();
    T findById(String id);
    List<T> queryByPage(@Param("page")Integer page, @Param("rows")Integer rows);
    Long findTotal();
 }
