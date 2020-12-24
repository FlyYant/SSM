package com.javapandeng.po;

import java.io.Serializable;

/**
 * 收藏
 */
public class Sc implements Serializable {

    /** 主键 */
    private Integer id;
    /** 商品id */
    private Integer productId;
    /** 商品对象 */
    private Product product;
    /** 收藏着id */
    private Integer userId;
    /** 状态  0：在  1：消除 */
    private Integer isDelete;

    public Sc(Integer id, Integer productId, Integer userId,Integer isDelete) {
        this.id = id;
        this.productId = productId;
        this.userId = userId;
        this.isDelete = isDelete;
    }

    public Sc() {
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

    public Integer getIsDelete(){return isDelete;}

    public void setIsDelete(Integer isDelete){this.isDelete = isDelete;}

    @Override
    public String toString() {
        return "Sc{" +
                "id=" + id +
                ", productId=" + productId +
                ", product=" + product +
                ", userId=" + userId +
                ", isDelete=" + isDelete +
                '}';
    }
}
