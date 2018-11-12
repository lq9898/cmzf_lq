package com.baizhi.impl;

import com.baizhi.dao.BannerDao;
import com.baizhi.entity.Banner;
import com.baizhi.service.BannerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class BannerServiceImpl implements BannerService {
    @Autowired
    private BannerDao bannerDao;
    @Override
    public void add(Banner banner) {
        banner.setId(UUID.randomUUID().toString());
        banner.setCreateDate(new Date());
        bannerDao.insert(banner);
    }

    @Override
    public void motify(Banner banner) {
      bannerDao.update(banner);
    }

    @Override
    public void remove(String id) {
        bannerDao.delete(id);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Banner> findAll() {
        return bannerDao.queryAll();
    }

    @Override
    public List<Banner> queryByPage(Integer page, Integer rows) {
        int start=(page-1)*rows;
        return bannerDao.queryByPage(start,rows);
    }

    @Override
    public Long findTotal() {
        return bannerDao.queryTotal();
    }

    @Override
    public Banner findById(String id) {
        return bannerDao.queryById(id);
    }

    @Override
    public void removeAll(String[] ids) {
        bannerDao.deleteAll(ids);
    }


}
