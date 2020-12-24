package com.javapandeng.po;

import java.io.Serializable;

/**
 * 订单细节
 */
public class PorderDetail implements Serializable {

    /** 主键 */
    private Integer id;
    /** 商品id */
    private Integer productId;
    private Product product;
    /** 订单id */
    private Integer porderId;
    /** 状态 */
    private Integer status;
    /** 数量 */
    private Integer num;
    /** 总计 */
    private String total;
    /** 地址id */
    private Integer addressId;
    private Address address;

    public PorderDetail(Integer id, Integer productId, Product product, Integer porderId, Integer status, Integer num, String total, Integer addressId) {
        this.id = id;
        this.productId = productId;
        this.product = product;
        this.porderId = porderId;
        this.status = status;
        this.num = num;
        this.total = total;
        this.addressId = addressId;
    }

    public PorderDetail() {
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

    public Integer getPorderId() {
        return porderId;
    }

    public void setPorderId(Integer porderId) {
        this.porderId = porderId;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
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

    @Override
    public String toString() {
        return "PorderDetail{" +
                "id=" + id +
                ", productId=" + productId +
                ", product=" + product +
                ", porderId=" + porderId +
                ", status=" + status +
                ", num=" + num +
                ", total='" + total + '\'' +
                ", addressId=" + addressId +
                ", address=" + address +
                '}';
    }
}
