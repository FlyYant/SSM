package com.javapandeng.po;

import java.io.Serializable;

/**
 * 收货地址
 */
public class Address implements Serializable {
    /** 主键 */
    private Integer id;
    /** 会员id */
    private Integer userId;
    private User user;
    /** 地址 */
    private String address;
    /** 邮政编码 */
    private String posCode;
    /** 收货人 */
    private String consignee;
    /** 电话 */
    private String phone;
    /** 电话 */
    private Integer dfault;

    public Address(Integer id, Integer userId, String address, String posCode, String consignee, String phone, Integer dfault) {
        this.id = id;
        this.userId = userId;
        this.address = address;
        this.posCode = posCode;
        this.consignee = consignee;
        this.phone = phone;
        this.dfault = dfault;
    }

    public Address() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPosCode() {
        return posCode;
    }

    public void setPosCode(String posCode) {
        this.posCode = posCode;
    }

    public String getConsignee() {
        return consignee;
    }

    public void setConsignee(String consignee) {
        this.consignee = consignee;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Integer getDfault() {
        return dfault;
    }

    public void setDfault(Integer dfault) {
        this.dfault = dfault;
    }

    @Override
    public String toString() {
        return "Address{" +
                "id=" + id +
                ", userId=" + userId +
                ", user=" + user +
                ", address='" + address + '\'' +
                ", posCode='" + posCode + '\'' +
                ", consignee='" + consignee + '\'' +
                ", phone='" + phone + '\'' +
                ", dfault=" + dfault +
                '}';
    }
}
