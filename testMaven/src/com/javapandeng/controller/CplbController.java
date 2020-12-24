package com.javapandeng.controller;

import com.javapandeng.base.BaseController;
import com.javapandeng.po.Cplb;
import com.javapandeng.service.CplbService;
import com.javapandeng.service.ProductService;
import com.javapandeng.service.ScService;
import com.javapandeng.utils.Pager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 产品类别C层
 */
@Controller
@RequestMapping("/cplb")
public class CplbController extends BaseController {

    @Autowired
    private CplbService cplbService;
    @Autowired
    private ProductService productService;
    @Autowired
    private ScService scService;

    /**
     * 分页查询类别列表
     */
    @RequestMapping("/findBySql")
    public String findBySql(Model model,Cplb cplb){
        String sql = "select * from cplb where isdelete = 0 and pid is null order by id";
        Pager<Cplb> pagers = cplbService.findBySqlRerturnEntity(sql);
        model.addAttribute("pagers",pagers);
        model.addAttribute("obj",cplb);
        return "cplb/cplb";
    }

    /**
     * 转向到新增一级分类页面
     */
    @RequestMapping("/add")
    public String add(){
        return "cplb/add";
    }

    /**
     * 新增一级分类保存功能
     */
    @RequestMapping("/exAdd")
    public String exAdd(Cplb cplb){
        cplb.setIsdelete(0);
        cplbService.insert(cplb);
        return "redirect:/cplb/findBySql.action";
    }

    /**
     * 转向到修改一级分类页面
     */
    @RequestMapping("/update")
    public String update(Integer id,Model model){
        Cplb obj = cplbService.load(id);
        model.addAttribute("obj",obj);
        return "cplb/update";
    }

    /**
     * 修改一级分类保存功能
     */
    @RequestMapping("/exUpdate")
    public String exUpdate(Cplb cplb){
        cplbService.updateById(cplb);
        return "redirect:/cplb/findBySql.action";
    }

    /**
     * 删除类目
     */
    @RequestMapping("/delete")
    public String delete(Integer id){
        //删除本身
        Cplb load = cplbService.load(id);
        load.setIsdelete(1);
        cplbService.updateById(load);
        //将下级也删除
        String sql = "update cplb set isdelete=1 where pid="+id;
        cplbService.updateBysql(sql);
        //将相关商品也删除
        String sql2 = "update product set pstate = 1 where cplbOne="+id;
        productService.updateBysql(sql2);
        //收藏夹删除
        String sql3 = "update sc set isDelete = 1 where productId in (SELECT id FROM product where cplbOne = "+id+" and pstate = 1)";
        scService.updateBysql(sql3);
        return "redirect:/cplb/findBySql.action";
    }

    /**
     * 查看二级分类
     */
    @RequestMapping("/findBySql2")
    public String findBySql2(Cplb cplb,Model model){
        String sql = "select * from cplb where isdelete=0 and pid="+cplb.getPid()+" order by id";
        Pager<Cplb> pagers = cplbService.findBySqlRerturnEntity(sql);
        model.addAttribute("pagers",pagers);
        model.addAttribute("obj",cplb);
        return "cplb/cplb2";
    }

    /**
     * 转向到新增二级分类页面
     */
    @RequestMapping("/add2")
    public String add2(int pid,Model model){
        model.addAttribute("pid",pid);
        return "cplb/add2";
    }

    /**
     * 新增二级分类保存功能
     */
    @RequestMapping("/exAdd2")
    public String exAdd2(Cplb cplb){
        cplb.setIsdelete(0);
        cplbService.insert(cplb);
        return "redirect:/cplb/findBySql2.action?pid="+cplb.getPid();
    }

    /**
     * 转向到修改二级分类页面
     */
    @RequestMapping("/update2")
    public String update2(Integer id,Model model){
        Cplb obj = cplbService.load(id);
        model.addAttribute("obj",obj);
        return "cplb/update2";
    }

    /**
     * 修改二级分类保存功能
     */
    @RequestMapping("/exUpdate2")
    public String exUpdate2(Cplb cplb){
        cplbService.updateById(cplb);
        return "redirect:/cplb/findBySql2.action?pid="+cplb.getPid();
    }

    /**
     * 删除二级类目
     */
    @RequestMapping("/delete2")
    public String delete2(Integer id,Integer pid){
        //删除本身
        Cplb load = cplbService.load(id);
        load.setIsdelete(1);
        cplbService.updateById(load);
        String sql = "update product set pstate = 1 where cplbTwo="+id;
        productService.updateBysql(sql);
        //收藏夹删除
        String sql2 = "update sc set isDelete = 1 where productId in (SELECT id FROM product where cplbTwo = "+id+" and pstate = 1)";
        scService.updateBysql(sql2);
        return "redirect:/cplb/findBySql2.action?pid="+pid;
    }

    /**
     * 返回二级分类界面
     */
    @RequestMapping("/return")
    public String Return(Integer pid){
        return "redirect:/cplb/findBySql2.action?pid="+pid;
    }
}
