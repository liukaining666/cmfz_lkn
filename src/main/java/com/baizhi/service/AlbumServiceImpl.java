package com.baizhi.service;

import com.baizhi.dao.AlbumDao;
import com.baizhi.entity.Album;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class AlbumServiceImpl implements AlbumService{
    @Autowired
    private AlbumDao albumDao;
    @Override

    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Album> findAll() {
        return albumDao.queryAll();
    }

    @Override
    public void add(Album album) {
        album.setId(UUID.randomUUID().toString());
         albumDao.insert(album);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Album findById(String id) {
        return albumDao.queryById(id);
    }
}
