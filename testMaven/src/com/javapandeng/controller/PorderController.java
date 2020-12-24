package com.javapandeng.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.javapandeng.base.BaseController;
import com.javapandeng.po.*;
import com.javapandeng.service.*;
import com.javapandeng.utils.Consts;
import com.javapandeng.utils.Pager;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 订单管理
 */
@Controller
@RequestMapping("/porder")
public class PorderController extends BaseController {
    @Autowired
    private PorderService porderService;
    @Autowired
    private UserService userService;
    @Autowired
    private CartService cartService;
    @Autowired
    private PorderDetailService porderDetailService;
    @Autowired
    private ProductService productService;
    @Autowired
    private AddressService addressService;
    /**
     * 订单查询列表
     */
    @RequestMapping("/findBySql")
    public String findBySql(Model model, Porder porder){
        //分页查询
        String sql = "select * from porder where 1=1";
        if(!isEmpty(porder.getCode())){
            sql += " and code like '%"+ porder.getCode()+"%' ";
        }
        sql+=" order by id desc";
        Pager<Porder> pagers = porderService.findBySqlRerturnEntity(sql);
        model.addAttribute("pagers",pagers);
        //存储查询条件
        model.addAttribute("obj", porder);
        return "porder/porder";
    }

    /**
     * 订单发货
     */
    @RequestMapping("/fh")
    public String fh(Integer id,Model model){
        Porder obj = porderService.load(id);
        obj.setStatus(3);
        porderService.updateById(obj);
        model.addAttribute("obj",obj);
        return "redirect:/porder/findBySql";
    }

    /**
     * 会员查看我的订单
     */
    @RequestMapping("/my")
    public String my(Model model, HttpServletRequest request){
        Object attribute = request.getSession().getAttribute(Consts.USERID);
        if(attribute==null){
            return "redirect:/login/uLogin";
        }
        Integer userId = Integer.valueOf(attribute.toString());
        //全部订单
        String sql = "select * from porder where userId="+userId+" and status is not null order by id desc";
        List<Porder> all = porderService.listBySqlReturnEntity(sql);
        model.addAttribute("all",all);
        //待发货
        String sql2 = "select * from porder where userId="+userId+" and status=0 order by id desc";
        List<Porder> dfh = porderService.listBySqlReturnEntity(sql2);
        model.addAttribute("dfh",dfh);
        //已取消
        String sql3 = "select * from porder where userId="+userId+" and status=1 order by id desc";
        List<Porder> yqx = porderService.listBySqlReturnEntity(sql3);
        model.addAttribute("yqx",yqx);
        //已发货
        String sql4 = "select * from porder where userId="+userId+" and status=2 order by id desc";
        List<Porder> yfh = porderService.listBySqlReturnEntity(sql4);
        model.addAttribute("yfh",yfh);
        //待收货
        String sql5 = "select * from porder where userId="+userId+" and status=3 order by id desc";
        List<Porder> dsh = porderService.listBySqlReturnEntity(sql5);
        model.addAttribute("dsh",dsh);
        //已收货
        String sql6 = "select * from porder where userId="+userId+" and status=4 order by id desc";
        List<Porder> ysh = porderService.listBySqlReturnEntity(sql6);
        model.addAttribute("ysh",ysh);
        return "porder/my";
    }

    /**
     * 处理界面
     */
    @RequestMapping("chuli")
    @ResponseBody
    public String chuli(@RequestBody List<CartDto> list,HttpServletRequest request){
        Object attribute = request.getSession().getAttribute(Consts.USERID);
        JSONObject js = new JSONObject();
        if(attribute==null){
            js.put(Consts.RES,0);
            return js.toJSONString();
        }
        Integer userId = Integer.valueOf(attribute.toString());
        request.getSession().setAttribute("list",list);
        return js.toJSONString();
    }

    /**
     * 购物车结算进入订单提交界面
     */
    @RequestMapping("tijiao")
    public String tijiao(Model model,HttpServletRequest request){
        Object attribute = request.getSession().getAttribute(Consts.USERID);
        Integer userId = Integer.valueOf(attribute.toString());
        List<CartDto> cartDtoList = (List) request.getSession().getAttribute("list");
        String sql = "select * from address where userId="+userId;
        List<Address> addressList = addressService.listBySqlReturnEntity(sql);
        model.addAttribute("addressList",addressList);
        List allList = new ArrayList();
        for (int i=0;i<cartDtoList.size();i++){
            String sql1 = "select * from cart where isDelete = 0 and id="+cartDtoList.get(i).getId();
            Cart cart = cartService.getById(cartDtoList.get(i).getId());
            cart.setNum(cartDtoList.get(i).getNum());
            String result = String.format("%.2f",cartDtoList.get(i).getNum()*cart.getPrice()); //保留两位小数
            cart.setTotal(result);
            allList.add(i,cart);
        }
        model.addAttribute("allList",allList);
        request.getSession().setAttribute("allList",allList);
        return "porder/jiesuan";
    }

    /**
     * 订单提交
     */
    @RequestMapping("/exAdd")
    @ResponseBody
    public String exAdd(@RequestBody List<Address> list, HttpServletRequest request){
        Object attribute = request.getSession().getAttribute(Consts.USERID);
        List<Cart> cartList = (List) request.getSession().getAttribute("allList");
        JSONObject js = new JSONObject();
        if(attribute==null){
            js.put(Consts.RES,0);
            return js.toJSONString();
        }
        Integer userId = Integer.valueOf(attribute.toString());

        User byId = userService.getById(userId);
//        Address address = addressService.getById(byId.getAddressId());
        if(list.size() == 0){
            js.put(Consts.RES,2);
            return js.toJSONString();
        }
        List<Integer> ids = new ArrayList<>();
        double to = 0.00;
        for (Cart c:cartList){
            ids.add(c.getId());
            Cart load = cartService.load(c.getId());
            to += Double.valueOf(c.getTotal());
        }
        Porder porder = new Porder();
        porder.setStatus(0);
        porder.setCode(getOrderNo());
        porder.setIsdelete(0);
        String result = String.format("%.2f",to); //保留两位小数
        porder.setOrderPrice(result);
        porder.setUserId(userId);
        porder.setAddTime(new Date());
        porderService.insert(porder);

        //订单详情放入porderDetail，删除购物车
        if(!CollectionUtils.isEmpty(ids)){
            for (Cart c:cartList){
                Cart load = cartService.load(c.getId());
                PorderDetail de = new PorderDetail();
                de.setProductId(load.getProductId());
                de.setPorderId(porder.getId());
                de.setStatus(0);
                de.setNum(c.getNum());
                de.setTotal(String.valueOf(c.getNum()*load.getPrice()));
                de.setAddressId(list.get(0).getId());
                porderDetailService.insert(de);
                //修改成交数
                Product load2 = productService.load(load.getProductId());
                load2.setGmNum(load2.getGmNum()+c.getNum());
                load2.setPsum(load2.getPsum()-c.getNum());
                productService.updateById(load2);
                //删除购物车
                cartService.deleteById(c.getId());
            }
        }
        js.put(Consts.RES,1);
        return js.toJSONString();
    }

//    /**
//     * 订单提交
//     */
//    @RequestMapping("/exAdd")
//    public String exAdd(HttpServletRequest request){
//        Object attribute = request.getSession().getAttribute(Consts.USERID);
//        List<Cart> cartList = (List) request.getSession().getAttribute("allList");
//        JSONObject js = new JSONObject();
//        if(attribute==null){
//            js.put(Consts.RES,0);
//            return js.toJSONString();
//        }
//        Integer userId = Integer.valueOf(attribute.toString());
//
//        User byId = userService.getById(userId);
//        Address address = addressService.getById(userId);
//        if(StringUtils.isEmpty(address.getAddress())){
//            js.put(Consts.RES,2);
//            return js.toJSONString();
//        }
//        List<Integer> ids = new ArrayList<>();
//        double to = 0.00;
//        for (Cart c:cartList){
//            ids.add(c.getId());
//            Cart load = cartService.load(c.getId());
//            to += Double.valueOf(c.getTotal());
//        }
//        Porder porder = new Porder();
//        porder.setStatus(0);
//        porder.setCode(getOrderNo());
//        porder.setIsdelete(0);
//        String result = String.format("%.2f",to); //保留两位小数
//        porder.setOrderPrice(result);
//        porder.setUserId(userId);
//        porder.setAddTime(new Date());
//        porderService.insert(porder);
//
//        //订单详情放入porderDetail，删除购物车
//        if(!CollectionUtils.isEmpty(ids)){
//            for (Cart c:cartList){
//                Cart load = cartService.load(c.getId());
//                PorderDetail de = new PorderDetail();
//                de.setProductId(load.getProductId());
//                de.setPorderId(porder.getId());
//                de.setStatus(0);
//                de.setNum(c.getNum());
//                de.setTotal(String.valueOf(c.getNum()*load.getPrice()));
//                porderDetailService.insert(de);
//                //修改成交数
//                Product load2 = productService.load(load.getProductId());
//                load2.setGmNum(load2.getGmNum()+c.getNum());
//                load2.setPsum(load2.getPsum()-c.getNum());
//                productService.updateById(load2);
//                //删除购物车
//                cartService.deleteById(c.getId());
//            }
//        }
//        return "redirect:/porder/my";
////        js.put(Consts.RES,1);
////        return js.toJSONString();
//    }


    //设置订单号
    private static String date;
    private static long orderNum = 0L;
    public static synchronized String getOrderNo(){
        String str = new SimpleDateFormat("yyyyMMddHHmm").format(new Date());
        if(date==null || !date.equals(str)){
            date = str;
            orderNum = 0L;
        }
        orderNum++;
        long orderNo = Long.parseLong(date)*10000;
        orderNo += orderNum;
        return orderNo+"";
    }

    /**
     * 取消订单
     */
    @RequestMapping("/qx")
    public String qx(Integer id,Model model){
        Porder obj = porderService.load(id);
        obj.setStatus(1);
        porderService.updateById(obj);
        model.addAttribute("obj",obj);
        porderDetailService.updateBysql("UPDATE porderdetail SET status = 1 where porderId ="+id);
        return "redirect:/porder/my";
    }

    /**
     * 用户收货
     */
    @RequestMapping("/sh")
    public String sh(Integer id,Model model){
        Porder obj = porderService.load(id);
        obj.setStatus(4);
        porderService.updateById(obj);
        model.addAttribute("obj",obj);
        return "redirect:/porder/my";
    }

    /**
     * 用户评价入口
     */
    @RequestMapping("/pj")
    public String pj(Integer id,Model model){
        model.addAttribute("id",id);
        return "porder/pj";
    }
}










