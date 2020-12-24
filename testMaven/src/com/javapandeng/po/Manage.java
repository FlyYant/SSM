package com.javapandeng.po;

import java.io.Serializable;
import java.util.Date;

/**
 * 管理员
 */
public class Manage implements Serializable {

    /**主键*/
    private Integer id;
    /**登录名*/
    private String aaccount;
    /**登录密码*/
    private String apass;
    /**姓名*/
    private String aname;
    /**电话*/
    private String atel;
    /**最后登录时间*/
    private Date lasttime;

    public Manage(Integer id, String aaccount, String apass, String aname, String atel, Date lasttime) {
        this.id = id;
        this.aaccount = aaccount;
        this.apass = apass;
        this.aname = aname;
        this.atel = atel;
        this.lasttime = lasttime;
    }

    public Manage() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAaccount() {
        return aaccount;
    }

    public void setAaccount(String aaccount) {
        this.aaccount = aaccount;
    }

    public String getApass() {
        return apass;
    }

    public void setApass(String apass) {
        this.apass = apass;
    }

    public String getAname() {
        return aname;
    }

    public void setAname(String aname) {
        this.aname = aname;
    }

    public String getAtel() {
        return atel;
    }

    public void setAtel(String atel) {
        this.atel = atel;
    }

    public Date getLasttime() {
        return lasttime;
    }

    public void setLasttime(Date lasttime) {
        this.lasttime = lasttime;
    }

    @Override
    public String toString() {
        return "Manage{" +
                "id=" + id +
                ", aaccount='" + aaccount + '\'' +
                ", apass='" + apass + '\'' +
                ", aname='" + aname + '\'' +
                ", atel='" + atel + '\'' +
                ", lasttime='" + lasttime + '\'' +
                '}';
    }
}
