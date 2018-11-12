package com.baizhi.impl;

import com.baizhi.dao.ChpaterDao;
import com.baizhi.entity.Chapter;
import com.baizhi.service.ChapterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class ChapterServiceImpl implements ChapterService {
    @Autowired
    private ChpaterDao chpaterDao;
    @Override
    public void add(Chapter chapter) {
        chapter.setId(UUID.randomUUID().toString());
        chapter.setUploadTime(new Date());
         chpaterDao.insert(chapter);
    }

    @Override
    public void remove(String id) {
        chpaterDao.delete(id);
    }

    @Override
    public void motify(Chapter chapter) {
        chpaterDao.update(chapter);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Chapter> findAll() {
        return chpaterDao.queryAll();
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Chapter findById(String id) {
        return chpaterDao.queryById(id);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Chapter> queryByPage(Integer page, Integer rows) {
        return null;
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Long findTotal() {
        return null;
    }
}
