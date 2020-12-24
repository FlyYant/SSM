package com.javapandeng.controller;

import com.javapandeng.po.Address;
import com.javapandeng.po.User;
import com.javapandeng.service.AddressService;
import com.javapandeng.service.UserService;
import com.javapandeng.utils.Consts;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/address")
public class AddressController {
    @Autowired
    private AddressService addressService;

    @Autowired
    private UserService userService;

    /**
     * 删除地址
     */
    @RequestMapping("delete")
    public String delete(Integer id){
        addressService.deleteById(id);
        return "redirect:/user/view?person=0";
    }

    /**
     * 修改地址
     */
    @RequestMapping("exUpdate")
    public String exUpdate(Address address,HttpServletRequest request){
        Object attribute = request.getSession().getAttribute(Consts.USERID);
        if(attribute==null){
            return "redirect:/login/uLogin";
        }
        address.setUserId(Integer.valueOf(attribute.toString()));
        addressService.updateById(address);
        return "redirect:/user/view?person=0";
    }

    /**
     * 添加地址
     */
    @RequestMapping("exAdd")
    public String exAdd(Address address,HttpServletRequest request){
        Object attribute = request.getSession().getAttribute(Consts.USERID);
        if(attribute==null){
            return "redirect:/login/uLogin";
        }
        address.setUserId(Integer.valueOf(attribute.toString()));
        Address address1 = addressService.getBySqlReturnEntity("select * from address where dfault=1 and userId="+Integer.valueOf(attribute.toString()));
        if (StringUtils.isEmpty(address1))
        {
            address.setDfault(1);
        }
        addressService.insert(address);
        User user = userService.load(Integer.valueOf(attribute.toString()));
        user.setAddressId(address.getId());
        userService.updateById(user);
        return "redirect:/user/view?person=0";
    }

    /**
     * 修改默认地址
     */
    @RequestMapping("change")
    public String change(Integer id,HttpServletRequest request){
        Object attribute = request.getSession().getAttribute(Consts.USERID);
        if(attribute==null){
            return "redirect:/login/uLogin";
        }
        Integer userId = Integer.valueOf(attribute.toString());
        Address address1 = addressService.getBySqlReturnEntity("select * from address where dfault=1 and userId="+userId);
        address1.setDfault(0);
        addressService.updateById(address1);
        Address address = addressService.load(id);
        address.setDfault(1);
        addressService.updateById(address);
        User user = userService.load(userId);
        user.setAddressId(address.getId());
        userService.updateById(user);
        return "redirect:/user/view?person=0";
    }

    /**
     * 前往修改界面
     */
    @RequestMapping("toModify")
    public String toModify(){
        return "address/modify";
    }
}
