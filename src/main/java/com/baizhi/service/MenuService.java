package com.baizhi.service;

import com.baizhi.entity.Menu;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface MenuService {
    List<Menu> findAll();
}
