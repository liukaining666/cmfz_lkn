package com.baizhi.service;

import com.baizhi.dao.ChapterDao;
import com.baizhi.entity.Chapter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class ChapterServiceImpl implements ChapterService{
    @Autowired
    private ChapterDao chapterDao;
    @Override
    public List<Chapter> findAll() {
        return chapterDao.queryAll();
    }

    @Override
    public void add(Chapter chapter) {
        chapter.setId(UUID.randomUUID().toString());
        chapterDao.insert(chapter);
    }
}
