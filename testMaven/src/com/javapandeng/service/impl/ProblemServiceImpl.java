package com.javapandeng.service.impl;

import com.javapandeng.base.BaseDao;
import com.javapandeng.base.BaseServiceImpl;
import com.javapandeng.mapper.ProblemMapper;
import com.javapandeng.po.Problem;
import com.javapandeng.service.ProblemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProblemServiceImpl extends BaseServiceImpl<Problem> implements ProblemService {
    @Autowired
    private ProblemMapper problemMapper;
    @Override
    public BaseDao<Problem> getBaseDao() {
        return problemMapper;
    }
}
