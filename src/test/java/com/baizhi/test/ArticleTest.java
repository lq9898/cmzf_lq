package com.baizhi.test;

import com.baizhi.entity.Article;
import com.baizhi.service.ArticleService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.TestExecutionListeners;

import java.util.List;

public class ArticleTest extends BasicTest {
    @Autowired
    private ArticleService articleService;
    @Test
    public void  all(){
        List<Article> articles = articleService.queryByPage(1, 2);
        for (Article article : articles) {
            System.out.println(article);














        }

    }
}
