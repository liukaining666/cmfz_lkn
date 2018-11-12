package com.baizhi.service;

import com.baizhi.dao.AdminDao;
import com.baizhi.entity.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminDao adminDao;

    @Override
    public Admin findAll(Admin admin) {
        return adminDao.queryAll(admin);

    }

    @Override
    public void motify(Admin admin) {
        adminDao.updatePassword(admin);
    }

    @Override
    public Admin findbyId(String id) {
        return adminDao.queryById(id);
    }


}