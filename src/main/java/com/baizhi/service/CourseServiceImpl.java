package com.baizhi.service;

import com.baizhi.dao.CourseDao;
import com.baizhi.entity.Course;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class CourseServiceImpl implements CourseService{
    @Autowired
    private CourseDao courseDao;
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Course> findByPage(Integer page, Integer rows) {
        int start=(page-1)*rows;
        List<Course> list = courseDao.queryByPage(start, rows);
        return list;
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public long findTotals() {
        Long aLong = courseDao.queryTotals();
        return aLong;
    }

    @Override
    public void add(Course course) {
        course.setId(UUID.randomUUID().toString());
        courseDao.insert(course);
    }

    @Override
    public void remove(String id) {
        courseDao.delete(id);
    }
}
