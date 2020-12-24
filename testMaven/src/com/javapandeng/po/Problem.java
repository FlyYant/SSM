package com.javapandeng.po;

import java.io.Serializable;
import java.util.Date;

/**
 * 问题
 */
public class Problem implements Serializable {

    /** 主键 */
    private Integer id;
    /** 商品编号 */
    private Integer productId;
    private Product product;
    /** 用户编号 */
    private Integer userId;
    private User user;
    /** 内容 */
    private String content;
    /** 解答 */
    private String solve;
    /** 解答时间 */
    private Date solveTime;
    /** 实物图片 */
    private String url1;

    public Problem(Integer id, Integer productId, Product product, Integer userId, User user, String content, String solve, Date solveTime, String url1) {
        this.id = id;
        this.productId = productId;
        this.product = product;
        this.userId = userId;
        this.user = user;
        this.content = content;
        this.solve = solve;
        this.solveTime = solveTime;
        this.url1 = url1;
    }

    public Problem() {
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

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getSolve() {
        return solve;
    }

    public void setSolve(String solve) {
        this.solve = solve;
    }

    public Date getSolveTime() {
        return solveTime;
    }

    public void setSolveTime(Date solveTime) {
        this.solveTime = solveTime;
    }

    public String getUrl1() {
        return url1;
    }

    public void setUrl1(String url1) {
        this.url1 = url1;
    }

    @Override
    public String toString() {
        return "Problem{" +
                "id=" + id +
                ", productId=" + productId +
                ", product=" + product +
                ", userId=" + userId +
                ", user=" + user +
                ", content='" + content + '\'' +
                ", solve='" + solve + '\'' +
                ", solveTime=" + solveTime +
                ", url1='" + url1 + '\'' +
                '}';
    }
}
