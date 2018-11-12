package com.baizhi.service;

import com.baizhi.entity.Master;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public interface MasterService {
    List<Master> findByPage(Integer page, Integer rows);
    long findTotals();
    void add(Master master);
    void remove(String id);
    void motify(Master master);
    Master findById(String id);
}
