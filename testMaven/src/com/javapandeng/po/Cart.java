package com.javapandeng.po;

import java.io.Serializable;

/**
 * 购物车
 */
public class Cart implements Serializable {

    /** 主键 */
    private Integer id;
    /** 商品id */
    private Integer productId;
    /** 商品对象 */
    private Product product;
    /** 收藏着id */
    private Integer userId;
    /** 商品数量 */
    private Integer num;
    /** 商品单价 */
    private double price;
    /** 商品总价 */
    private String total;
    /** 状态  0：在  1：消除 */
    private Integer isDelete;

    public Cart(Integer id, Integer productId, Integer userId, Integer num, double price, String total,Integer isDelete) {
        this.id = id;
        this.productId = productId;
        this.userId = userId;
        this.num = num;
        this.price = price;
        this.total = total;
        this.isDelete = isDelete;
    }

    public Cart() {
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

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }

    public Integer getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(Integer isDelete) {
        this.isDelete = isDelete;
    }

    @Override
    public String toString() {
        return "Cart{" +
                "id=" + id +
                ", productId=" + productId +
                ", product=" + product +
                ", userId=" + userId +
                ", num=" + num +
                ", price=" + price +
                ", total='" + total + '\'' +
                ", isDelete=" + isDelete +
                '}';
    }
}
