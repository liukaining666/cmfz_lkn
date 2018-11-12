package com.baizhi.service;

import com.baizhi.entity.Chapter;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface ChapterService {
    List<Chapter>findAll();
    void add(Chapter chapter);
}
