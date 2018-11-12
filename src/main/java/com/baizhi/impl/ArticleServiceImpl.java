package com.baizhi.impl;

import com.baizhi.dao.ArticleDao;
import com.baizhi.entity.Article;
import com.baizhi.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class ArticleServiceImpl implements ArticleService {
    @Autowired
    private ArticleDao articleDao;
    @Override
    public void add(Article article) {
        article.setId(UUID.randomUUID().toString());
        article.setPublishDate(new Date());
        articleDao.insert(article);
    }

    @Override
    public void motify(Article article) {
        articleDao.update(article);
    }

    @Override
    public void remove(String id) {
        articleDao.delete(id);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Article> findAll() {
        return null;
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Article findById(String id) {
        return articleDao.queryById(id);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Article> queryByPage(Integer page, Integer rows) {
        int start=(page-1)*rows;
        return articleDao.queryByPage(start,rows);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Long findTotal() {
        return articleDao.queryTotal();
    }

    @Override
    public void removeAll(String[] ids) {
        articleDao.deleteAll(ids);
    }
}
