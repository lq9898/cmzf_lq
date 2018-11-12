package com.baizhi.service;

import com.baizhi.entity.Banner;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BannerService extends Iservice<Banner> {
    List<Banner> queryByPage(@Param("start")Integer page, @Param("rows")Integer rows);
    Long findTotal();
    void removeAll(String[] ids);
}
