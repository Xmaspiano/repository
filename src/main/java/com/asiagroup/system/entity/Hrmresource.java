package com.asiagroup.system.entity;


import com.asiagroup.system.entity.common.IdEntity;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * Created by AlbertXmas on 2017/1/13.
 */
@Entity
//@Table(name = "hrmresource")
public class Hrmresource extends IdEntity {
    private String loginid;
    private String password;
    private String lastname;
    private char sex;
    private int departmentid;
    private int subcompanyid1;
    private String pinyinlastname;

    public String getLoginid() {
        return loginid;
    }

    public void setLoginid(String loginid) {
        this.loginid = loginid;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public char getSex() {
        return sex;
    }

    public void setSex(char sex) {
        this.sex = sex;
    }

    public int getDepartmentid() {
        return departmentid;
    }

    public void setDepartmentid(int departmentid) {
        this.departmentid = departmentid;
    }

    public int getSubcompanyid1() {
        return subcompanyid1;
    }

    public void setSubcompanyid1(int subcompanyid1) {
        this.subcompanyid1 = subcompanyid1;
    }

    public String getPinyinlastname() {
        return pinyinlastname;
    }

    public void setPinyinlastname(String pinyinlastname) {
        this.pinyinlastname = pinyinlastname;
    }
}
