package com.javapandeng.po;

import java.io.Serializable;
import java.util.Date;

/**
 * 公告
 */
public class News implements Serializable {

    /** 主键 */
    private Integer id;
    /** 标题 */
    private String title;
    /** 内容 */
    private String content;
    /** 发布时间 */
    private Date addTime;
    /** 状态  0可用  1禁用 */
    private Integer status;

    public News(Integer id, String title, String content, Date addTime, Integer status) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.addTime = addTime;
        this.status = status;
    }

    public News() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
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

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "News{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", addTime=" + addTime +
                ", status=" + status +
                '}';
    }
}
