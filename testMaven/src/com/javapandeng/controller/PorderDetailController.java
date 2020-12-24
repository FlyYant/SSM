package com.javapandeng.controller;

import com.javapandeng.po.PorderDetail;
import com.javapandeng.service.PorderDetailService;
import com.javapandeng.utils.Pager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 订单详情层
 */
@Controller
@RequestMapping("porderDetail")
public class PorderDetailController {

    @Autowired
    private PorderDetailService porderDetailService;

    @RequestMapping("/ulist")
    public String ulist(PorderDetail porderDetail, Model model){
        //分页查询
        String sql = "select * from porderdetail where porderId=" + porderDetail.getPorderId();
        Pager<PorderDetail> pagers = porderDetailService.findBySqlRerturnEntity(sql);
        model.addAttribute("pagers",pagers);
        model.addAttribute("obj",porderDetail);
        return "porderDetail/ulist";
    }
}
