package com.javapandeng.controller;

import com.javapandeng.base.BaseController;
import com.javapandeng.po.Address;
import com.javapandeng.po.Cplb;
import com.javapandeng.po.User;
import com.javapandeng.service.AddressService;
import com.javapandeng.service.UserService;
import com.javapandeng.utils.Consts;
import com.javapandeng.utils.Pager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 用户
 */
@Controller
@RequestMapping("/user")
public class UserController extends BaseController {

    @Autowired
    private UserService userService;
    @Autowired
    private AddressService addressService;

    /**
     * 用户查询列表
     */
    @RequestMapping("/findBySql")
    public String findBySql(Model model,User user){
        String sql = "select * from user where 1=1";
        if(!isEmpty(user.getUname())){
            sql += " and uname like '%"+user.getUname()+"%' ";
        }
        sql+=" order by id";
        Pager<User> pagers = userService.findBySqlRerturnEntity(sql);
        model.addAttribute("pagers",pagers);
        model.addAttribute("obj",user);
        return "user/user";
    }

    /**
     * 禁用用户
     */
    @RequestMapping("/close")
    public String close(Integer id){
        User load = userService.load(id);
        load.setUstate(1);
        userService.updateById(load);
        return "redirect:/user/findBySql";
    }

    /**
     * 启用用户
     */
    @RequestMapping("/open")
    public String open(Integer id){
        User load = userService.load(id);
        load.setUstate(0);
        userService.updateById(load);
        return "redirect:/user/findBySql";
    }

    /**
     * 查看详细信息
     */
    @RequestMapping("/findBySql2")
    public String findBySql2(User user,Model model){
        String sql = "select * from user where id="+user.getId()+" order by id";
        Pager<User> pagers = userService.findBySqlRerturnEntity(sql);
        model.addAttribute("pagers",pagers);
        model.addAttribute("obj",user);
        return "user/user2";
    }

    /**
     * 返回上一界面界面
     */
    @RequestMapping("/return")
    public String Return(Integer id){
        return "redirect:/user/findBySql.action?id="+id;
    }

    /**
     * 前往个人中心，查看用户信息
     */
    @RequestMapping("/view")
    public String view(Model model,String person,Integer id, HttpServletRequest request){
        Object attribute = request.getSession().getAttribute(Consts.USERID);
        if(attribute==null){
            return "redirect:/login/uLogin";
        }
        Integer userId = Integer.valueOf(attribute.toString());
        User obj = userService.load(userId);
        model.addAttribute("obj",obj);
        if (person.equals("0")){
            model.addAttribute("person",0);
        }else {
            //修改时的person
            model.addAttribute("person",1);
            Address address = addressService.load(id);
            model.addAttribute("address",address);
        }
        String sql = "select * from address where userId="+userId;
        List<Address> addressList = addressService.listBySqlReturnEntity(sql);
        model.addAttribute("addressList",addressList);
        return "user/view";
    }

    //    /**
//     * 转向到修改信息页面
//     */
//    @RequestMapping("/update")
//    public String update(Integer id,Model model){
//        User obj = userService.load(id);
//        model.addAttribute("obj",obj);
//        return "user/update";
//    }

    /**
     * 修改用户信息保存功能
     */
    @RequestMapping("exUpdate")
    public String exUpdate(User user,HttpServletRequest request){
        Object attribute = request.getSession().getAttribute(Consts.USERID);
        if(attribute==null){
            return "redirect:/login/uLogin";
        }
        user.setId(Integer.valueOf(attribute.toString()));
        userService.updateById(user);
        return "redirect:/user/view?person=0";
    }


}
