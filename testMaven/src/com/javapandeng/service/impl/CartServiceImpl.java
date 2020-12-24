package com.javapandeng.service.impl;

import com.javapandeng.base.BaseDao;
import com.javapandeng.base.BaseServiceImpl;
import com.javapandeng.mapper.CartMapper;
import com.javapandeng.po.Cart;
import com.javapandeng.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartServiceImpl extends BaseServiceImpl<Cart> implements CartService {
    @Autowired
    CartMapper cartMapper;
    @Override
    public BaseDao<Cart> getBaseDao() {
        return cartMapper;
    }
}
