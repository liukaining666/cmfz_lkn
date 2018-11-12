package com.baizhi.service;

import com.baizhi.entity.Album;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface AlbumService {
    List<Album> findAll();
    void add(Album album);
    Album findById(String id);
}
