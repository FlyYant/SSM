package com.javapandeng.po;

import java.io.Serializable;
import java.util.Date;

/**
 * 商品评价
 */
public class Comment implements Serializable {

    /** 主键 */
    private Integer id;
    /** 评论者id */
    private Integer userId;
    private User user;
    /** 商品id */
    private Integer productId;
    /** 评论内容 */
    private String content;
    /** 评论时间 */
    private Date addTime;

    public Comment(Integer id, Integer userId, Integer productId, String content, Date addTime) {
        this.id = id;
        this.userId = userId;
        this.productId = productId;
        this.content = content;
        this.addTime = addTime;
    }

    public Comment() {
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

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getAddTime() {
        return addTime;
    }

    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "id=" + id +
                ", userId=" + userId +
                ", user=" + user +
                ", productId=" + productId +
                ", content='" + content + '\'' +
                ", addTime=" + addTime +
                '}';
    }
}
