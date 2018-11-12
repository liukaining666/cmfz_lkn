package com.baizhi.dao;

import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BaseDao<T> {
    //查询菜单
    List<T> queryAll();
    void delete(String id);
    void update(T t);
    void insert(T t);
    T queryById(String id);



    //登陆
    T queryAll(T t);
    T queryAllSalt(T t);
    //修改密码
    void updatePassword(T t);

    //查询轮播图
    //分页查询  start:表示从第几个开始  rows:表示展示几个
    List<T> queryByPage(@Param("start") Integer start, @Param("rows") Integer rows);
    //查询总个数
    Long queryTotals();
}
