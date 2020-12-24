package com.javapandeng.controller;

import com.javapandeng.base.BaseController;
import com.javapandeng.po.Cart;
import com.javapandeng.po.Product;
import com.javapandeng.po.Sc;
import com.javapandeng.service.ProductService;
import com.javapandeng.service.ScService;
import com.javapandeng.utils.Consts;
import com.javapandeng.utils.Pager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/sc")
public class ScController extends BaseController {

    @Autowired
    private ScService scService;

    @Autowired
    private ProductService productService;

    @RequestMapping("exAdd")
    public String exAdd(Sc sc, HttpServletRequest request, RedirectAttributes attr){
        Object attribute = request.getSession().getAttribute(Consts.USERID);
        if (attribute==null){
            return "redirect:/login/uLogin";
        }
        //保存到收藏夹
        Integer userId = Integer.valueOf(attribute.toString());
        List<Sc> list = scService.listBySqlReturnEntity("select * from sc where productId="+sc.getProductId()+" and userId="+userId);
        if (null == list || list.size()==0){
            sc.setUserId(userId);
            sc.setIsDelete(0);
            scService.insert(sc);
            //商品表收藏数+1
            Product product = productService.load(sc.getProductId());
            product.setScNum(product.getScNum()+1);
            productService.updateById(product);
            return "redirect:/sc/findBySql.action";
        }else {
//            return "redirect:/product/view?id="+sc.getProductId()+"&msg=1";
            return "redirect:/product/view?msg=1&id="+sc.getProductId();
        }
    }

    /**
     * 收藏列表
     */
    @RequestMapping("/findBySql")
    public String findBySql(Model model,HttpServletRequest request){
        Object attribute = request.getSession().getAttribute(Consts.USERID);
        if (attribute==null){
            return "redirect:/login/uLogin";
        }
        Integer userId = Integer.valueOf(attribute.toString());
        String sql = "select * from sc where userId="+userId+" and isDelete = 0 order by id desc";
        Pager<Sc> pagers = scService.findBySqlRerturnEntity(sql);
        model.addAttribute("pagers",pagers);

        List<Sc> list1 = scService.listBySqlReturnEntity(sql);
        String sql2 = "select * from sc where userId="+userId+" order by id desc";
        List<Sc> list2 = scService.listBySqlReturnEntity(sql2);
        model.addAttribute("list1",list1);
        model.addAttribute("list2",list2);
        return "sc/my";
    }

    /**
     * 取消收藏
     */
    @RequestMapping("/delete")
    public String delete(Integer id,HttpServletRequest request){
        Object attribute = request.getSession().getAttribute(Consts.USERID);
        if (attribute==null){
            return "redirect:/login/uLogin";
        }
        scService.deleteById(id);
        return "redirect:/sc/findBySql";
    }
}
