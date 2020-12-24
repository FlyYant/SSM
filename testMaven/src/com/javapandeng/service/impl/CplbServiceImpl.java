package com.javapandeng.service.impl;

import com.javapandeng.base.BaseDao;
import com.javapandeng.base.BaseServiceImpl;
import com.javapandeng.mapper.CplbMapper;
import com.javapandeng.po.Cplb;
import com.javapandeng.service.CplbService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CplbServiceImpl extends BaseServiceImpl<Cplb> implements CplbService {
    @Autowired
    CplbMapper cplbMapper;
    @Override
    public BaseDao<Cplb> getBaseDao() {
        return cplbMapper;
    }
}
