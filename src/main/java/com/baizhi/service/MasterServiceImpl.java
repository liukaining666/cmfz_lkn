package com.baizhi.service;

import com.baizhi.dao.MasterDao;
import com.baizhi.entity.Master;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class MasterServiceImpl implements MasterService{
    @Autowired
    private MasterDao masterDao;


    @Override
    public List<Master> findByPage(Integer page, Integer rows) {
        int start=(page-1)*rows;
        List<Master> list = masterDao.queryByPage(start, rows);
        return list;
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public long findTotals() {
        Long aLong = masterDao.queryTotals();
        return aLong;
    }

    @Override
    public void add(Master master) {
        master.setId(UUID.randomUUID().toString());
        masterDao.insert(master);
    }

    @Override
    public void remove(String id) {
        masterDao.delete(id);
    }

    @Override
    public void motify(Master master) {
        masterDao.update(master);
    }

    @Override
    public Master findById(String id) {
        return masterDao.queryById(id);
    }


}
