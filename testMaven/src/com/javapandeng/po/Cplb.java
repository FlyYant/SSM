package com.javapandeng.po;

import java.io.Serializable;

/**
 * 产品类别
 */
public class Cplb implements Serializable {

    /** 主键 */
    private Integer id;
    /** 类别名称 */
    private String lbname;
    /** 父编号 */
    private Integer pid;
    /** 是否删除 0未删除  1已删除 */
    private Integer isdelete;

    public Cplb(Integer id, String lbname, Integer pid, Integer isdelete) {
        this.id = id;
        this.lbname = lbname;
        this.pid = pid;
        this.isdelete = isdelete;
    }

    public Cplb() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLbname() {
        return lbname;
    }

    public void setLbname(String lbname) {
        this.lbname = lbname;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Integer getIsdelete() {
        return isdelete;
    }

    public void setIsdelete(Integer isdelete) {
        this.isdelete = isdelete;
    }

    @Override
    public String toString() {
        return "Cplb{" +
                "lbcode=" + id +
                ", lbname='" + lbname + '\'' +
                ", pid=" + pid +
                ", isdelete=" + isdelete +
                '}';
    }
}
