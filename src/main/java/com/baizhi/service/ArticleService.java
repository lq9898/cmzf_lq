package com.baizhi.service;

import com.baizhi.entity.Article;

public interface ArticleService extends Iservice<Article> {
    void removeAll(String[] ids);
}
