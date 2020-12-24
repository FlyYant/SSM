package com.javapandeng.controller;

import com.javapandeng.base.BaseController;
import com.javapandeng.po.Cplb;
import com.javapandeng.po.Product;
import com.javapandeng.service.CplbService;
import com.javapandeng.service.ProductService;
import com.javapandeng.utils.Consts;
import com.javapandeng.utils.Pager;
import com.javapandeng.utils.SystemContext;
import com.javapandeng.utils.UUIDUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * 商品
 */
@Controller
@RequestMapping("/product")
public class ProductController extends BaseController {

    @Autowired
    private ProductService productService;

    @Autowired
    private CplbService cplbService;

    /**
     * 分页查询商品列表
     */
    @RequestMapping("/findBySql")
    public String findBySql(Model model, Product product){
        String sql = "select * from product where pstate = 0";
        if(!isEmpty(product.getPname())){
            sql += " and pname like '%" + product.getPname() + "%' ";
        }
        sql += " order by id desc";
        Pager<Product> pagers = productService.findBySqlRerturnEntity(sql);
        model.addAttribute("pagers",pagers);
        model.addAttribute("obj",product);
        return "product/product";
    }

    /**
     * 添加商品入口
     */
    @RequestMapping("/add")
    public String add(Model model){
        String sql = "select * from cplb where isdelete = 0 and pid is not null order by id";
        List<Cplb> listBySqlReturnEntity = cplbService.listBySqlReturnEntity(sql);
        model.addAttribute("types",listBySqlReturnEntity);
        return "product/add";
    }

    /**
     * 执行添加商品
     */
    @RequestMapping("/exAdd")
    public String exAdd(Product product, @RequestParam("file")CommonsMultipartFile[] files, HttpServletRequest request) throws IOException {
        productCommon(product, files, request);
        product.setScNum(0);
        product.setGmNum(0);
        product.setPstate(0);
        productService.insert(product);
        return "redirect:/product/findBySql.action";
    }

    /**
     * 修改商品入口
     */
    @RequestMapping("/update")
    public String update(Integer id,Model model){
        Product obj = productService.load(id);
        String sql = "select * from cplb where isdelete = 0 and pid is not null order by id";
        List<Cplb> listBySqlReturnEntity = cplbService.listBySqlReturnEntity(sql);
        model.addAttribute("types",listBySqlReturnEntity);
        model.addAttribute("obj",obj);
        return "product/update";
    }

    /**
     * 执行修改商品
     */
    @RequestMapping("/exUpdate")
    public String exUpdate(Product product, @RequestParam("file")CommonsMultipartFile[] files, HttpServletRequest request) throws IOException {
        productCommon(product, files, request);
//        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
//        String time = dateFormat.format(dateFormat);
//        Date date = new Date();
//        System.out.println(date);

//        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
//        Date date = dateFormat.parse(product.getPsstime());

        productService.updateById(product);
        return "redirect:/product/findBySql.action";
    }

    /**
     * 新增和更新的公共方法
     */
    private void productCommon(Product product, @RequestParam("file") CommonsMultipartFile[] files, HttpServletRequest request) throws IOException {
        if (files.length > 0) {
            for (int s = 0; s < files.length; s++) {
                String n = UUIDUtils.create();  //创建一个随机数
                String path = SystemContext.getRealPath() + "\\resource\\ueditor\\upload\\" + n + files[s].getOriginalFilename();
                File newFile = new File(path);
                //通过CommonsMultipartFile的方法直接写文件
                files[s].transferTo(newFile);
                if (s == 0) {
                    product.setUrl1(request.getContextPath() + "\\resource\\ueditor\\upload\\" + n + files[s].getOriginalFilename());
                }
                if (s == 1) {
                    product.setUrl2(request.getContextPath() + "\\resource\\ueditor\\upload\\" + n + files[s].getOriginalFilename());
                }
                if (s == 2) {
                    product.setUrl3(request.getContextPath() + "\\resource\\ueditor\\upload\\" + n + files[s].getOriginalFilename());
                }
                if (s == 3) {
                    product.setUrl4(request.getContextPath() + "\\resource\\ueditor\\upload\\" + n + files[s].getOriginalFilename());
                }
                if (s == 4) {
                    product.setUrl5(request.getContextPath() + "\\resource\\ueditor\\upload\\" + n + files[s].getOriginalFilename());
                }
            }
        }
        Cplb byId = cplbService.getById(product.getCplbTwo());
        product.setCplbOne(byId.getPid());
    }

    /**
     * 商品下架
     */
    @RequestMapping("delete")
    public String delete(Integer id){
        Product obj = productService.load(id);
        obj.setPstate(1);
        productService.updateById(obj);
        return "redirect:/product/findBySql.action";
    }

    /**
     * 商品销售情况列图显示
     */
    @RequestMapping("/select")
    public @ResponseBody List select(){
        List<Map> countGmNum = productService.countGmNum();
        return countGmNum;
    }

    @RequestMapping("/tongji")
    public String tongji(){
        return "product/tongji";
    }

    /***一下都是前台操作*/
    /**
     * 按关键字或二级分类查询
     */
    @RequestMapping("/shoplist")
    public String shopList(Product product,String condition,Model model){
        String sql = "select * from product where pstate=0";
        if(!isEmpty(product.getCplbTwo())){
            sql += " and cplbTwo = " + product.getCplbTwo();
        }
        if(!isEmpty(condition)){
            sql += " and pname like '%" + condition +"%' ";
            model.addAttribute("condition",condition);
        }
        if(!isEmpty(product.getPrice())){
            sql += " order by (price+0) desc";
        }
        if(!isEmpty(product.getGmNum())){
            sql += " order by gmNum desc";
        }
        if(isEmpty(product.getPrice())&&isEmpty(product.getGmNum())){
            sql += " order by id desc";
        }
        Pager<Product> pagers = productService.findBySqlRerturnEntity(sql);
        model.addAttribute("pagers",pagers);
        model.addAttribute("obj",product);
        return "product/shoplist";
    }

    /**
     * 按关键字或二级分类查询
     */
    @RequestMapping("/view")
    public String view(Integer id,String msg, Model model,HttpServletRequest request){
        Product obj = productService.load(id);
        model.addAttribute("obj",obj);
        if(isEmpty(msg)){
            model.addAttribute("sc","0");
        }else{
            if(msg.equals("1")){
                model.addAttribute("sc","1");
            }
        }
        return "product/view";
    }
}
