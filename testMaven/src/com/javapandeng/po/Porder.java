package com.javapandeng.po;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * 订单
 */
public class Porder implements Serializable {

    /** 主键 */
    private Integer id;
    /** 商品编号 */
    private Integer productId;
    /** 会员编号 */
    private Integer userId;

    private User user;
    /** 订单号 */
    private String code;
    /** 订单生成时间 */
    private Date addTime;
    /** 订单价格 */
    private String orderPrice;
    /** 0未删除 */
    private Integer isdelete;
    /** 0.新建待发货 1.已取消  2.已发货 3.待收货 4.已评价 */
    private Integer status;

    private List<PorderDetail> details;

    public Porder(Integer id, Integer productId, Integer userId, User user, String code, Date addTime, String orderPrice, Integer isdelete, Integer status) {
        this.id = id;
        this.productId = productId;
        this.userId = userId;
        this.user = user;
        this.code = code;
        this.addTime = addTime;
        this.orderPrice = orderPrice;
        this.isdelete = isdelete;
        this.status = status;
    }

    public Porder() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
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

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Date getAddTime() {
        return addTime;
    }

    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }

    public String getOrderPrice() {
        return orderPrice;
    }

    public void setOrderPrice(String orderPrice) {
        this.orderPrice = orderPrice;
    }

    public Integer getIsdelete() {
        return isdelete;
    }

    public void setIsdelete(Integer isdelete) {
        this.isdelete = isdelete;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Porder{" +
                "id=" + id +
                ", productId=" + productId +
                ", userId=" + userId +
                ", user=" + user +
                ", code='" + code + '\'' +
                ", addTime=" + addTime +
                ", orderPrice='" + orderPrice + '\'' +
                ", isdelete=" + isdelete +
                ", status=" + status +
                '}';
    }

    public List<PorderDetail> getDetails() {
        return details;
    }

    public void setDetails(List<PorderDetail> details) {
        this.details = details;
    }
}
