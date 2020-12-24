<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@include file="/common/taglibs.jsp"%>
<html>
<head>
    <title>管理员后台</title>
    <link rel="stylesheet" href="${ctx}/resource/css/pintuer.css">
    <link rel="stylesheet" href="${ctx}/resource/css/admin.css">
    <script src="${ctx}/resource/js/jquery.js"></script>
    <script src="${ctx}/resource/js/pintuer.js"></script>
</head>
<body style="background-color: #f2f9fd">
    <div class="header bg-main">
        <div class="logo margin-big-left fadein-top">
            <h1>管理员后台</h1>
        </div>
        <div class="head-l">
            <a class="button button-little bg-green" href="${ctx}/login/uIndex" target="_blank">
                <span class="icon-home"></span>前台首页
            </a>
            <a class="button button-little bg-blue" href="" target="_blank">
                <span class="icon-wrench"></span>清除缓存
            </a>
            <a class="button button-little bg-red" href="mtuichu.html">
                <span class="icon-power-off"></span>退出登录
            </a>
        </div>
    </div>
    <div class="leftnav">
        <div class="leftnav-title"><strong><span class="icon-list">菜单列表</span> </strong></div>
        <h2><span class="icon-user"></span>基本设置 </h2>
        <ul style="display: block">
            <li><a href="${ctx}/product/tongji" target="right"><span class="icon-caret-right"></span>统计管理 </a> </li>
            <li><a href="${ctx}/cplb/findBySql" target="right"><span class="icon-caret-right"></span>类目管理 </a> </li>
            <li><a href="${ctx}/user/findBySql" target="right"><span class="icon-caret-right"></span>用户管理 </a> </li>
            <li><a href="${ctx}/product/findBySql" target="right"><span class="icon-caret-right"></span>商品管理 </a> </li>
            <li><a href="${ctx}/porder/findBySql" target="right"><span class="icon-caret-right"></span>订单管理 </a> </li>
            <li><a href="${ctx}/news/findBySql" target="right"><span class="icon-caret-right"></span>公告管理 </a> </li>
            <li><a href="${ctx}/message/findBySql" target="right"><span class="icon-caret-right"></span>留言管理 </a> </li>
            <li><a href="${ctx}/problem/findBySql" target="right"><span class="icon-caret-right"></span>问题管理 </a> </li>
        </ul>
    </div>
    <ul class="bread">
        <li><a href="{:}" target="right" class="icon-home">首页</a> </li>
        <li><a href="#">网站信息</a> </li>
        <li><b>当前语言:</b><span style="color: red">中文</span>
            &nbsp;&nbsp;&nbsp;&nbsp;切换语言:<a href="#">中文</a>&nbsp;&nbsp;<a href="#">英文</a>
        </li>
    </ul>
    <div class="admin">
        <iframe name="right" scrolling="auto" frameborder="0" width="100%" height="100%"></iframe>
        <%--scrolling="auto"就是自动加滚轮  frameborder="0"就是没有边框   --%>
    </div>
</body>
</html>
