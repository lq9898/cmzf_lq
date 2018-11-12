package com.baizhi.impl;

import com.baizhi.dao.AlbumDao;
import com.baizhi.entity.Album;
import com.baizhi.service.AlbumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class AlbumServiceImpl  implements  AlbumService{
    @Autowired
    private AlbumDao albumDao;
    @Override
    public void add(Album album) {
        album.setId(UUID.randomUUID().toString());
        album.setPublishDate(new Date());
        albumDao.insert(album);
    }

    @Override
    public void remove(String id) {
     albumDao.delete(id);
    }

    @Override
    public void motify(Album album) {
        albumDao.update(album);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Album> findAll() {
        return albumDao.queryAll();
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Album findById(String id) {
        return albumDao.queryById(id);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Album> queryByPage(Integer page, Integer rows) {
        return null;
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Long findTotal() {
        return null;
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Album> findAllName() {
        return albumDao.queryAllName();
    }
}
