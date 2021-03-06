package com.baizhi.impl;

import com.baizhi.dao.MenuDao;
import com.baizhi.entity.Menu;
import com.baizhi.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class MenuServiceImpl implements MenuService {
    @Autowired
    private MenuDao menuDao;
    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Menu> findAllMenu() {
        return menuDao.queryAllMenu();
    }
}
