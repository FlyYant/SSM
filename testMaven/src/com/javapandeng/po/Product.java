package com.javapandeng.po;

import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * 商品
 */
public class Product implements Serializable {

    /** 主键 */
    private Integer id;
    /** 商品名称 */
    private String pname;
    /** 商品产地 */
    private String pguishu;
    /** 商品价格 */
    private String price;
    /** 折扣 */
    private Integer zk;
    /** 收藏数 */
    private Integer scNum;
    /** 购买数 */
    private Integer gmNum;
    /** 商品数量 */
    private Integer psum;
    /** 商品所属类别 */
    private Integer cplbOne;
    private Cplb yiji;

    /** 商品所属二级类别 */
    private Integer cplbTwo;
    private Cplb erji;

    /** 主图 */
    private String url1;
    /** 副图1 */
    private String url2;
    /** 副图2 */
    private String url3;
    /** 副图3 */
    private String url4;
    /** 副图4 */
    private String url5;
    /** 商品描述 */
    private String ms;
    /** 产品状态  0上架/1下架 */
    private Integer pstate;

    /**评论列表*/
    private List<Comment> pls;
    /**问题列表*/
    private List<Problem> wts;

    public Product(Integer id, String pname, String pguishu, String price, Integer zk, Integer scNum, Integer gmNum, Integer psum, Integer cplbOne, Cplb yiji, Integer cplbTwo, Cplb erji, String url1, String url2, String url3, String url4, String url5, String ms, Integer pstate) {
        this.id = id;
        this.pname = pname;
        this.pguishu = pguishu;
        this.price = price;
        this.zk = zk;
        this.scNum = scNum;
        this.gmNum = gmNum;
        this.psum = psum;
        this.cplbOne = cplbOne;
        this.yiji = yiji;
        this.cplbTwo = cplbTwo;
        this.erji = erji;
        this.url1 = url1;
        this.url2 = url2;
        this.url3 = url3;
        this.url4 = url4;
        this.url5 = url5;
        this.ms = ms;
        this.pstate = pstate;
    }

    public Product() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public String getPguishu() {
        return pguishu;
    }

    public void setPguishu(String pguishu) {
        this.pguishu = pguishu;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public Integer getZk() {
        return zk;
    }

    public void setZk(Integer zk) {
        this.zk = zk;
    }

    public Integer getScNum() {
        return scNum;
    }

    public void setScNum(Integer scNum) {
        this.scNum = scNum;
    }

    public Integer getGmNum() {
        return gmNum;
    }

    public void setGmNum(Integer gmNum) {
        this.gmNum = gmNum;
    }

    public Integer getPsum() {
        return psum;
    }

    public void setPsum(Integer psum) {
        this.psum = psum;
    }

    public Integer getCplbOne() {
        return cplbOne;
    }

    public void setCplbOne(Integer cplbOne) {
        this.cplbOne = cplbOne;
    }

    public Cplb getYiji() {
        return yiji;
    }

    public void setYiji(Cplb yiji) {
        this.yiji = yiji;
    }

    public Integer getCplbTwo() {
        return cplbTwo;
    }

    public void setCplbTwo(Integer cplbTwo) {
        this.cplbTwo = cplbTwo;
    }

    public Cplb getErji() {
        return erji;
    }

    public void setErji(Cplb erji) {
        this.erji = erji;
    }

    public String getUrl1() {
        return url1;
    }

    public void setUrl1(String url1) {
        this.url1 = url1;
    }

    public String getUrl2() {
        return url2;
    }

    public void setUrl2(String url2) {
        this.url2 = url2;
    }

    public String getUrl3() {
        return url3;
    }

    public void setUrl3(String url3) {
        this.url3 = url3;
    }

    public String getUrl4() {
        return url4;
    }

    public void setUrl4(String url4) {
        this.url4 = url4;
    }

    public String getUrl5() {
        return url5;
    }

    public void setUrl5(String url5) {
        this.url5 = url5;
    }

    public String getMs() {
        return ms;
    }

    public void setMs(String ms) {
        this.ms = ms;
    }

    public Integer getPstate() {
        return pstate;
    }

    public void setPstate(Integer pstate) {
        this.pstate = pstate;
    }

    public List<Comment> getPls() {
        return pls;
    }

    public void setPls(List<Comment> pls) {
        this.pls = pls;
    }

    public List<Problem> getWts() {
        return wts;
    }

    public void setWts(List<Problem> wts) {
        this.wts = wts;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", pname='" + pname + '\'' +
                ", pguishu='" + pguishu + '\'' +
                ", price='" + price + '\'' +
                ", zk=" + zk +
                ", scNum=" + scNum +
                ", gmNum=" + gmNum +
                ", psum=" + psum +
                ", cplbOne=" + cplbOne +
                ", yiji=" + yiji +
                ", cplbTwo=" + cplbTwo +
                ", erji=" + erji +
                ", url1='" + url1 + '\'' +
                ", url2='" + url2 + '\'' +
                ", url3='" + url3 + '\'' +
                ", url4='" + url4 + '\'' +
                ", url5='" + url5 + '\'' +
                ", ms='" + ms + '\'' +
                ", pstate=" + pstate +
                '}';
    }
}
