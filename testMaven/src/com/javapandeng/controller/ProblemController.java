package com.javapandeng.controller;

import com.javapandeng.base.BaseController;
import com.javapandeng.po.*;
import com.javapandeng.service.ProblemService;
import com.javapandeng.service.ProductService;
import com.javapandeng.service.UserService;
import com.javapandeng.utils.Consts;
import com.javapandeng.utils.Pager;
import com.javapandeng.utils.SystemContext;
import com.javapandeng.utils.UUIDUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Date;

/**
 * 问题管理
 */
@Controller
@RequestMapping("/problem")
public class ProblemController extends BaseController {

    @Autowired
    private ProblemService problemService;
    @Autowired
    private ProductService productService;
    @Autowired
    private UserService userService;

    /**
     * 问题列表
     */
    @RequestMapping("/findBySql")
    public String findBySql(Problem problem, Model model){
        String sql = "select * from problem where 1=1";
        if(!isEmpty(problem.getContent())){
            sql += " and content like '%" + problem.getContent() + "%' ";
        }
        sql += " order by id desc";
        Pager<Problem> pagers = problemService.findBySqlRerturnEntity(sql);
        model.addAttribute("pagers",pagers);
        model.addAttribute("obj",problem);
        return "problem/problem";
    }

    /**
     * 转向到解答页面
     */
    @RequestMapping("/update")
    public String update(Integer id,Model model){
        Problem obj = problemService.load(id);
        model.addAttribute("obj",obj);
        return "problem/update";
    }

    /**
     * 解答保存功能
     */
    @RequestMapping("/exUpdate")
    public String exUpdate(Problem problem){
        problem.setSolveTime(new Date());
        problemService.updateById(problem);
        return "redirect:/problem/findBySql.action";
    }

    /**
     * 删除问答
     */
    @RequestMapping("/delete")
    public String delete(Integer id){
        problemService.deleteById(id);
        return "redirect:/problem/findBySql";
    }

    /**
     * 提出问题进入
     */
    @RequestMapping("/add")
    public String add(Integer productId,Model model, HttpServletRequest request){
        Object attribute = request.getSession().getAttribute(Consts.USERID);
        if(attribute==null){
            return "redirect:/login/uLogin";
        }
        Integer userId = Integer.valueOf(attribute.toString());
        Product obj = productService.load(productId);
        model.addAttribute("obj",obj);
        User user = userService.load(userId);
        model.addAttribute("user",user);
        return "problem/tw";
    }

    /**
     * 执行添加问题
     */
    @RequestMapping("/exAdd")
    public String exAdd(Problem problem, @RequestParam("file") CommonsMultipartFile[] files, HttpServletRequest request) throws IOException {

        problemCommon(problem, files, request);
        problemService.insert(problem);
        return "redirect:/product/view?id="+problem.getProductId();
    }

    /**
     * 新增和更新的公共方法
     */
    private void problemCommon(Problem problem, @RequestParam("file") CommonsMultipartFile[] files, HttpServletRequest request) throws IOException {
        if (files.length > 0) {
            for (int s = 0; s < files.length; s++) {
                System.out.println(files[s].getSize());
                if (files[s].getSize() != 0){
                    String n = UUIDUtils.create();  //创建一个随机数
                    String path = SystemContext.getRealPath() + "\\resource\\ueditor\\upload\\" + n + files[s].getOriginalFilename();
                    File newFile = new File(path);
                    //通过CommonsMultipartFile的方法直接写文件
                    files[s].transferTo(newFile);
                    if (s == 0) {
                        problem.setUrl1(request.getContextPath() + "\\resource\\ueditor\\upload\\" + n + files[s].getOriginalFilename());
                    }
                }

            }
        }
    }
}
