package com.baizhi.service;

import com.baizhi.entity.Album;

import java.util.List;

public interface AlbumService extends Iservice<Album> {

    List<Album> findAllName();
}
