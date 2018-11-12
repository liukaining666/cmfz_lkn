package com.baizhi.service;

import com.baizhi.entity.Banner;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public interface BannerService {
    List<Banner> findByPage(Integer page,Integer rows);
    long findTotals();
    void add(Banner banner);
    void remove(String id);
    void motify(Banner banner);
    Banner findById(String id);
}
