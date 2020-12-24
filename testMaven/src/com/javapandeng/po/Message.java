package com.javapandeng.po;

import java.io.Serializable;
import java.util.Date;

/**
 * 公告
 */
public class Message implements Serializable {

    /** 主键 */
    private Integer id;
    /** 留言人 */
    private String userName;
    /** 手机号 */
    private String phone;
    /** 发布时间 */
    private String content;

    public Message(Integer id, String userName, String phone, String content) {
        this.id = id;
        this.userName = userName;
        this.phone = phone;
        this.content = content;
    }

    public Message() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public String toString() {
        return "Message{" +
                "id=" + id +
                ", userName='" + userName + '\'' +
                ", phone='" + phone + '\'' +
                ", content='" + content + '\'' +
                '}';
    }
}
