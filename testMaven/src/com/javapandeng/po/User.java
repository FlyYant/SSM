package com.javapandeng.po;

import java.io.Serializable;
import java.util.Date;

/**
 * 用户
 */
public class User implements Serializable {

    /** 主键 */
    private Integer id;
    /** 登录名称 */
    private String uname;
    /** 登录密码 */
    private String upass;
    /** 会员状态  0为允许、1为禁止 */
    private Integer ustate;
    /** 会员邮箱 */
    private String email;
    /** 真实姓名 */
    private String realname;
    /** 身份证号 */
    private String uid;
    /** 会员电话 */
    private String utel;
    /** 会员性别 */
    private String usex;
    /** 收货地址id */
    private Integer addressId;
    private Address address;
    /** 注册时间 */
    private Date zctime;
    /** 最后登录时间 */
    private Date lasttime;

    public User(Integer id, String uname, String upass, Integer ustate, String email, String realname, String uid, String utel, String usex, Integer addressId, Date zctime, Date lasttime) {
        this.id = id;
        this.uname = uname;
        this.upass = upass;
        this.ustate = ustate;
        this.email = email;
        this.realname = realname;
        this.uid = uid;
        this.utel = utel;
        this.usex = usex;
        this.addressId = addressId;
        this.zctime = zctime;
        this.lasttime = lasttime;
    }

    public User() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getUpass() {
        return upass;
    }

    public void setUpass(String upass) {
        this.upass = upass;
    }

    public Integer getUstate() {
        return ustate;
    }

    public void setUstate(Integer ustate) {
        this.ustate = ustate;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getUtel() {
        return utel;
    }

    public void setUtel(String utel) {
        this.utel = utel;
    }

    public String getUsex() {
        return usex;
    }

    public void setUsex(String usex) {
        this.usex = usex;
    }

    public Integer getAddressId() {
        return addressId;
    }

    public void setAddressId(Integer addressId) {
        this.addressId = addressId;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public Date getZctime() {
        return zctime;
    }

    public void setZctime(Date zctime) {
        this.zctime = zctime;
    }

    public Date getLasttime() {
        return lasttime;
    }

    public void setLasttime(Date lasttime) {
        this.lasttime = lasttime;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", uname='" + uname + '\'' +
                ", upass='" + upass + '\'' +
                ", ustate=" + ustate +
                ", email='" + email + '\'' +
                ", realname='" + realname + '\'' +
                ", uid='" + uid + '\'' +
                ", utel='" + utel + '\'' +
                ", usex='" + usex + '\'' +
                ", addressId=" + addressId +
                ", address=" + address +
                ", zctime=" + zctime +
                ", lasttime=" + lasttime +
                '}';
    }
}
