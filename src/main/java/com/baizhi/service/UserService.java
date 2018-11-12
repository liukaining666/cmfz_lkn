package com.baizhi.service;

import com.baizhi.entity.User;
import org.springframework.stereotype.Service;

import java.security.NoSuchAlgorithmException;

@Service
public interface UserService {
    void add(User user) throws NoSuchAlgorithmException;
    void motify(User user);
    User find(User user);

}
