package com.javapandeng.po;

import java.util.List;

/**
 * 一级类目和它的二级类目列表
 */
public class CplbDto {

    private Cplb father;

    private List<Cplb> childrens;

    public Cplb getFather() {
        return father;
    }

    public void setFather(Cplb father) {
        this.father = father;
    }

    public List<Cplb> getChildrens() {
        return childrens;
    }

    public void setChildrens(List<Cplb> childrens) {
        this.childrens = childrens;
    }
}
