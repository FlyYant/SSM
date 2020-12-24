package com.javapandeng.controller;

import com.alibaba.fastjson.JSONObject;
import com.javapandeng.base.BaseController;
import com.javapandeng.po.*;
import com.javapandeng.service.CplbService;
import com.javapandeng.service.ManageService;
import com.javapandeng.service.ProductService;
import com.javapandeng.service.UserService;
import com.javapandeng.utils.Consts;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 登录相关的控制器
 */
@Controller
@RequestMapping("/login")
public class LoginController extends BaseController {

    @Autowired
    private ManageService manageService;

    @Autowired
    private CplbService cplbService;

    @Autowired
    private ProductService productService;

    @Autowired
    private UserService userService;

    /**
     * 管理员登录前
     * @return
     */
    @RequestMapping("login")
    public String login(){
        return "/login/mLogin";
    }

    /**
     * 登录验证
     * @return
     */
    @RequestMapping("toLogin")
    public String toLogin(Manage manage, HttpServletRequest request){
        Manage byEntity = manageService.getByEntity(manage);
        if(byEntity==null){
            return "redirect:/login/mtuichu";
        }
        byEntity.setLasttime(new Date());
        manageService.updateById(byEntity);
        request.getSession().setAttribute(Consts.MANAGE,byEntity);
        request.getSession().setAttribute("aaccount",byEntity.getAaccount());
        return "/login/mIndex";
    }

    /**
     * 管理员退出
     */
    @RequestMapping("mtuichu")
    public String mtuichu(HttpServletRequest request){
        request.getSession().setAttribute(Consts.MANAGE,null);
        return "/login/mLogin";
    }

    /**
     * 前往管理员注册界面
     */
    @RequestMapping("/register")
    public String register(){
        return "/login/register";
    }

    /**
     * 管理员注册保存
     */
    @RequestMapping("/exRegister")
    public String exRegister(Manage manage){
        manageService.insert(manage);
        return "redirect:/login/login";
    }

    /**
     * 前端首页
     */
    @RequestMapping("/uIndex")
    public String uIndex(Model model, Product product,HttpServletRequest request){
        String sql1 = "select * from cplb where isdelete=0 and pid is null order by lbname";
        List<Cplb> fatherList = cplbService.listBySqlReturnEntity(sql1);
        List<CplbDto> list = new ArrayList<>();
        if(!CollectionUtils.isEmpty(fatherList)){
            for (Cplb ic:fatherList){
                CplbDto dto = new CplbDto();
                dto.setFather(ic);
                //查询二级类目
                String sql2 = "select * from cplb where isdelete=0 and pid="+ic.getId();
                List<Cplb> childrens = cplbService.listBySqlReturnEntity(sql2);
                dto.setChildrens(childrens);
                list.add(dto);
                model.addAttribute("lbs",list);
            }
        }
        //折扣商品
        List<Product> zks = productService.listBySqlReturnEntity("select * from product where pstate=0 and zk is not null order by zk desc limit 0,10");
        model.addAttribute("zks",zks);

        //热销商品
        List<Product> rxs = productService.listBySqlReturnEntity("select * from product where pstate=0 order by gmNum desc LIMIT 0,10");
        model.addAttribute("rxs",rxs);

        return "login/uIndex";
    }

    /**
     * 普通用户注册
     */
    @RequestMapping("/res")
    public String res(){
        return "login/res";
    }

    /*** 执行普通用户注册*/
    @RequestMapping("/toRes")
    public String toRes(User user){
        user.setUstate(0);
        user.setZctime(new Date());
        userService.insert(user);
        return "login/uLogin";
    }

    /*** 普通用户登录入口*/
    @RequestMapping("/uLogin")
    public String uLogin(){
        return "login/uLogin";
    }

    /*** 执行普通用户登录*/
    @RequestMapping("/utoLogin")
    public String utoLogin(User user,Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
        User byEntity = userService.getByEntity(user);
        if(byEntity==null || byEntity.getUstate()==1){
            return "redirect:/login/res.action";
        }else {
            byEntity.setLasttime(new Date());
            userService.updateById(byEntity);
            request.getSession().setAttribute("role",2);
            request.getSession().setAttribute(Consts.UNAME,byEntity.getUname());
            request.getSession().setAttribute(Consts.USERID,byEntity.getId());
            return "redirect:/login/uIndex.action";
        }
    }

    /*** 执行普通用户退出*/
    @RequestMapping("/uTui")
    public String uTui(HttpServletRequest request){
        HttpSession session = request.getSession();
        session.invalidate();
        return "redirect:/login/uIndex.action";
    }

    /*** 修改密码入口*/
    @RequestMapping("/pass")
    public String pass(HttpServletRequest request){
        Object attribute = request.getSession().getAttribute(Consts.USERID);
        if(attribute==null){
            return "redirect:/login/uLogin";
        }
        Integer userId = Integer.valueOf(attribute.toString());
        User load = userService.load(userId);
        request.setAttribute("obj",load);
        return "login/pass";
    }

    /*** 修改密码操作*/
    @RequestMapping("/upass")
    @ResponseBody
    public String upass(String upass,HttpServletRequest request){
        Object attribute = request.getSession().getAttribute(Consts.USERID);
        JSONObject js = new JSONObject();
        if(attribute==null){
            js.put(Consts.RES,0);
            return js.toJSONString();
        }
        Integer userId = Integer.valueOf(attribute.toString());
        User load = userService.load(userId);
        load.setUpass(upass);
        userService.updateById(load);
        js.put(Consts.RES,1);
        return js.toJSONString();
    }
}
