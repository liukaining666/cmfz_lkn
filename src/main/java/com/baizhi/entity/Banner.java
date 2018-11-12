package com.baizhi.entity;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Banner {
    private String id;
    private String title;
    private String lujing;
    private String Descs;
    private String status;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JSONField(format = "yyyy-MM-dd")
    private Date times;

    @Override
    public String toString() {
        return "Banner{" +
                "id='" + id + '\'' +
                ", title='" + title + '\'' +
                ", lujing='" + lujing + '\'' +
                ", Descs='" + Descs + '\'' +
                ", status='" + status + '\'' +
                ", times=" + times +
                '}';
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getLujing() {
        return lujing;
    }

    public void setLujing(String lujing) {
        this.lujing = lujing;
    }

    public String getDescs() {
        return Descs;
    }

    public void setDescs(String descs) {
        Descs = descs;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getTimes() {
        return times;
    }

    public void setTimes(Date times) {
        this.times = times;
    }

    public Banner(String id, String title, String lujing, String descs, String status, Date times) {

        this.id = id;
        this.title = title;
        this.lujing = lujing;
        Descs = descs;
        this.status = status;
        this.times = times;
    }

    public Banner() {

    }
}
