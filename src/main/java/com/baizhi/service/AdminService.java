package com.baizhi.service;

import com.baizhi.entity.Admin;
import org.springframework.stereotype.Service;

@Service
public interface AdminService {
    Admin findAll(Admin admin);
    void motify(Admin admin);
    Admin findbyId(String id);

}
