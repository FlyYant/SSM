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
<body>
<div class="panel admin-panel">
    <div class="panel-head" id="detail">
        <strong><span class="icon-pencil-square-o">详细信息</span> </strong>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <strong><a href="${ctx}/user/return?id=${obj.id}"><span style="color: red" class="icon-pencil-square-o">返回上一界面</span></a> </strong>
    </div>
    <table class="table table-hover text-center">
        <tr>
            <th>名称</th>
            <th>数据</th>
        </tr>
    <c:forEach items="${pagers.datas}" var="data" varStatus="1">
        <tr>
            <td>编号</td>
            <td>${data.id}</td>
        </tr>
        <tr>
            <td>用户名</td>
            <td>${data.uname}</td>
        </tr>
        <tr>
            <td>密码</td>
            <td>${data.upass}</td>
        </tr>
        <tr>
            <td>状态</td>
            <td>
                <c:if test="${data.ustate == 0}">启用</c:if>
                <c:if test="${data.ustate == 1}">禁用</c:if>
            </td>
        </tr>
        <tr>
            <td>邮箱</td>
            <td>${data.email}</td>
        </tr>
        <tr>
            <td>真实姓名</td>
            <td>${data.realname}</td>
        </tr>
        <tr>
            <td>身份证号</td>
            <td>${data.uid}</td>
        </tr>
        <tr>
            <td>电话</td>
            <td>${data.utel}</td>
        </tr>
        <tr>
            <td>性别</td>
            <td>${data.usex}</td>
        </tr>
        <tr>
            <td>地址</td>
            <td>${data.uaddress}</td>
        </tr>
        <tr>
            <td>注册时间</td>
            <td><fmt:formatDate value="${data.zctime}" pattern="yyyy-MM-dd"/></td>
        </tr>
        <tr>
            <td>最后登录时间</td>
            <td><fmt:formatDate value="${data.lasttime}" pattern="yyyy-MM-dd"/></td>
        </tr>
    </c:forEach>
    </table>
</div>

</body>

</html>