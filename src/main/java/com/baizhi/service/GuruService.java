package com.baizhi.service;

import com.baizhi.entity.Guru;

import java.util.List;

public interface GuruService extends Iservice<Guru> {
    List<Guru> findAllName();
    void removeAll(String[] ids);
}
