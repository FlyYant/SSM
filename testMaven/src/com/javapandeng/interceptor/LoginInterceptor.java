package com.javapandeng.interceptor;

import com.javapandeng.po.Manage;
import com.javapandeng.utils.Consts;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {

//        //通过request获取session对象
        HttpSession session = request.getSession();
//        //从session中获取manage
        Manage manage = (Manage) session.getAttribute(Consts.MANAGE);
        //获取请求路径
//        String requestURI = request.getRequestURI();
//        if(requestURI.contains("login/login") || requestURI.contains("login/uIndex") || requestURI.contains("login/toLogin")){
//            return true;
//        }
        //判断manage是否为空
        if (manage != null){
            // 登录成功不拦截
            return true;
            //抛出异常
        }else {
            // 拦截后进入登录页面
//            response.sendRedirect("login/login.jsp");
            return false;
        }
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {
        // 在处理过程中，执行拦截
        System.out.println("LoginInterceptor.postHandle()");
    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {
        // 执行完毕，返回前拦截
        System.out.println("LoginInterceptor.afterCompletion()");
    }
}
