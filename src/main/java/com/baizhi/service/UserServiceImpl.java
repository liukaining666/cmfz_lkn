package com.baizhi.service;

import com.baizhi.dao.UserDao;
import com.baizhi.entity.User;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.UUID;

@Service
@Transactional
public class UserServiceImpl implements UserService{
    @Autowired
    private UserDao userDao;
    @Override
    public void add(User user){
        user.setId(UUID.randomUUID().toString());
        user.setSalt(UUID.randomUUID().toString().substring(0,5));
        user.setPassword(DigestUtils.md5Hex(user.getPassword()+user.getSalt()));
        userDao.insert(user);
    }

    @Override
    public void motify(User user) {
        userDao.update(user);
    }

    @Override
    public User find(User user) {
        User user1 = userDao.queryAllSalt(user);
        User user2 = userDao.queryAll(user);
        user1.setPassword(DigestUtils.md5Hex(user.getPassword()+user1.getSalt()));
        if(user1.getPassword().equals(user2.getPassword())){
            return userDao.queryAllSalt(user);
        }else return null;
    }


}
