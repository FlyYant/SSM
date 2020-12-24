package com.javapandeng.controller;

import com.alibaba.fastjson.JSONObject;
import com.javapandeng.base.BaseController;
import com.javapandeng.po.Cart;
import com.javapandeng.po.Product;
import com.javapandeng.po.Sc;
import com.javapandeng.service.CartService;
import com.javapandeng.service.ProductService;
import com.javapandeng.utils.Consts;
import org.apache.commons.collections.ListUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.List;

@Controller
@RequestMapping("/cart")
public class CartController extends BaseController {

    @Autowired
    private CartService cartService;

    @Autowired
    private ProductService productService;

    @RequestMapping("exAdd")
    @ResponseBody
    public String exAdd(Cart cart, HttpServletRequest request){
        JSONObject js = new JSONObject();
        Object attribute = request.getSession().getAttribute(Consts.USERID);
        if (attribute==null){
            js.put(Consts.RES,0);
            return js.toJSONString();
        }
        //保存到购物车
        Integer userId = Integer.valueOf(attribute.toString());
        List<Cart> list = cartService.listBySqlReturnEntity("select * from cart where productId="+cart.getProductId()+" and userId="+userId);
        if(null == list || list.size()==0){
            cart.setUserId(userId);
            Product product = productService.load(cart.getProductId());
            String price = product.getPrice();
            Double valueOf = Double.valueOf(price);
            cart.setPrice(valueOf);
            if(product.getZk()!=null){
                valueOf = valueOf*product.getZk()/10;
                BigDecimal bg = new BigDecimal(valueOf).setScale(2, RoundingMode.UP);  //1.111->1.12
                cart.setPrice(bg.doubleValue());
                valueOf = bg.doubleValue();
            }
            Integer num = cart.getNum();
            Double t = valueOf*num;

            BigDecimal bg = new BigDecimal(t).setScale(2, RoundingMode.UP);  //1.111->1.12
            double doubleValue = bg.doubleValue();
            cart.setTotal(doubleValue+"");
            cart.setIsDelete(0);
            cartService.insert(cart);
        }else {
            Integer id = list.get(0).getId();
            Cart obj = cartService.load(id);
            obj.setNum(cart.getNum()+obj.getNum());
            cartService.updateById(obj);
        }
        js.put(Consts.RES,1);
        return js.toJSONString();
    }

    /**
     * 转向我的购物车界面
     */
    @RequestMapping("findBySql")
    public String findBySql(Model model,HttpServletRequest request){
        JSONObject js = new JSONObject();
        Object attribute = request.getSession().getAttribute(Consts.USERID);
        if (attribute==null){
            return "redirect:/login/toLogin";
        }
        Integer userId = Integer.valueOf(attribute.toString());
        String sql1 = "select * from cart where userId="+userId+" and isDelete = 0 order by id desc";
        List<Cart> list1 = cartService.listBySqlReturnEntity(sql1);
        String sql2 = "select * from cart where userId="+userId+" order by id desc";
        List<Cart> list2 = cartService.listBySqlReturnEntity(sql2);
        model.addAttribute("list",list1);
        model.addAttribute("list2",list2);
        return "cart/cart";
    }

    /**
     * 删除购物车
     */
    @RequestMapping("delete")
    @ResponseBody
    public String delete(Integer id){
        cartService.deleteById(id);
        return "success";
    }
}
