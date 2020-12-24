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
    <div class="panel-head" id="update">
        <strong><span class="icon-pencil-square-o">修改用户信息</span> </strong>
    </div>
    <div class="body-content">
        <form action="${ctx}/user/exUpdate" method="post" class="form-x">
            <input type="hidden" name="id" value="${obj.id}"/>
            <div class="form-group">
                <div class="label"><label>用户名:</label></div>
                <div class="field">
                    <input type="text" class="input w50" name="uname" data-validate="required:请输入用户名" value="${obj.uname}"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label"><label>登录密码:</label></div>
                <div class="field">
                    <input type="password" class="input w50" name="upass" data-validate="required:请输入登录密码" value="${obj.upass}"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label"><label>邮箱:</label></div>
                <div class="field">
                    <input type="text" class="input w50" name="email" data-validate="required:请输入邮箱" value="${obj.email}"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label"><label>真实姓名:</label></div>
                <div class="field">
                    <input type="text" class="input w50" name="realname" data-validate="required:请输入真实姓名" value="${obj.realname}"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label"><label>身份证号:</label></div>
                <div class="field">
                    <input type="text" class="input w50" name="uid" data-validate="required:请输入身份证号" value="${obj.uid}"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label"><label>电话:</label></div>
                <div class="field">
                    <input type="text" class="input w50" name="utel" data-validate="required:请输入电话" value="${obj.utel}"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label"><label>性别:</label></div>
                <div class="field">
                    <input type="text" class="input w50" name="usex" data-validate="required:请输入性别" value="${obj.usex}"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label"><label>地址:</label></div>
                <div class="field">
                    <input type="text" class="input w50" name="uaddress" data-validate="required:请输入地址" value="${obj.uaddress}"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label"></div>
                <div class="field">
                    <button class="button bg-main icon-check-square-o" type="submit">提交</button>
                </div>
            </div>
        </form>
    </div>
</div>

</body>

</html>