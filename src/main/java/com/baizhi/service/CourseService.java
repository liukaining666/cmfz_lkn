package com.baizhi.service;

import com.baizhi.entity.Course;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface CourseService {
    List<Course> findByPage(Integer page, Integer rows);
    long findTotals();
    void add(Course course);
    void remove(String id);
}
