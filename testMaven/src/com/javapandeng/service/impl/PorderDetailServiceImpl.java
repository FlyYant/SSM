package com.javapandeng.service.impl;

import com.javapandeng.base.BaseDao;
import com.javapandeng.base.BaseServiceImpl;
import com.javapandeng.mapper.PorderDetailMapper;
import com.javapandeng.po.PorderDetail;
import com.javapandeng.service.PorderDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PorderDetailServiceImpl extends BaseServiceImpl<PorderDetail> implements PorderDetailService {
    @Autowired
    private PorderDetailMapper porderDetailMapper;
    @Override
    public BaseDao<PorderDetail> getBaseDao() {
        return porderDetailMapper;
    }
}
