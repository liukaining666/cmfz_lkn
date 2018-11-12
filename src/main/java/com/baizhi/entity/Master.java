package com.baizhi.entity;

public class Master {
    private String id;
    private String name;
    private String headPic;
    private String sex;

    @Override
    public String toString() {
        return "Master{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", headPic='" + headPic + '\'' +
                ", sex='" + sex + '\'' +
                '}';
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getHeadPic() {
        return headPic;
    }

    public void setHeadPic(String headPic) {
        this.headPic = headPic;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Master() {

    }

    public Master(String id, String name, String headPic, String sex) {

        this.id = id;
        this.name = name;
        this.headPic = headPic;
        this.sex = sex;
    }
}
