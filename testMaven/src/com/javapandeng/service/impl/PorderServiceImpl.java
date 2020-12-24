package com.javapandeng.service.impl;

import com.javapandeng.base.BaseDao;
import com.javapandeng.base.BaseServiceImpl;
import com.javapandeng.mapper.PorderMapper;
import com.javapandeng.po.Porder;
import com.javapandeng.service.PorderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PorderServiceImpl extends BaseServiceImpl<Porder> implements PorderService {
    @Autowired
    private PorderMapper porderMapper;
    @Override
    public BaseDao<Porder> getBaseDao() {
        return porderMapper;
    }
}
