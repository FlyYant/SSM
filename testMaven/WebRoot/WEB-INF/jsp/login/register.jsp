<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@include file="/common/taglibs.jsp"%>
<html>
<head>
    <title>管理员登录</title>
    <link type="text/css" rel="stylesheet" href="${ctx}/resource/ml/css/style.css">
    <link type="text/css" rel="stylesheet" href="${ctx}/resource/css/pintuer.css">
    <link type="text/css" rel="stylesheet" href="${ctx}/resource/css/admin.css">
    <script src="${ctx}/resource/js/jquery.js"></script>
    <script src="${ctx}/resource/js/pintuer.js"></script>
</head>
<body>
<div class="bg"></div>
<div class="container">
    <div class="line bouncein">
        <div class="xs6 xm4 xs3-move xm4-move">
            <div style="height: 20px;"></div>
            <div class="media media-y margin-big-bottom"></div>
            <form action="${ctx}/login/exRegister" method="post">
                <div class="panel loginbox">
                    <div class="text-center margin-big padding-big-top"><h1>管理员注册</h1></div>
                    <div class="panel-body" style="padding: 30px;padding-bottom: 15px;padding-top: 15px;">
                        <div class="form-group" style="padding-bottom: 18px">
                            <div class="label"><label>登录账号:</label></div>
                            <div class="field field-icon-right">
                                <input type="text" class="input input-big" name="aaccount" placeholder="登录账号" data-validate="required:请填写账号" />
                                <span class="icon icon-user margin-small"></span>
                            </div>
                        </div>
                        <div class="form-group" style="padding-bottom: 18px">
                            <div class="label"><label>登录密码:</label></div>
                            <div class="field field-icon-right">
                                <input type="password" class="input input-big" name="apass" placeholder="登录密码" data-validate="required:请填写密码" />
                                <span class="icon icon-key margin-small"></span>
                            </div>
                        </div>
                        <div class="form-group" style="padding-bottom: 18px">
                            <div class="label"><label>真实姓名:</label></div>
                            <div class="field field-icon-right">
                                <input type="text" class="input input-big" name="aname" placeholder="真实姓名" data-validate="required:请填写密码" />
                                <span class="icon icon-user margin-small"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="label"><label>电话:</label></div>
                            <div class="field field-icon-right">
                                <input type="text" class="input input-big" name="atel" placeholder="电话" data-validate="required:请填写密码" />
                                <span class="icon icon-phone margin-small"></span>
                            </div>
                        </div>
                    </div>
                    <div style="padding: 30px;">
                        <input type="submit" class="button button-block bg-main text-big input-big" value="注册" />
                    </div>

                </div>
            </form>
        </div>
    </div>
</div>

<%--<div class="bg"></div>--%>
<%--<div class="container">--%>
<%--    <div class="line bouncein">--%>
<%--        <div class="xs8 xm5 xs2-move xm3-move">--%>
<%--            <div style="height: 50px;"></div>--%>
<%--            <div class="media media-y margin-big-bottom"></div>--%>
<%--            <form action="${ctx}/login/exRegister" method="post" class="form-x">--%>
<%--                <div class="panel loginbox">--%>
<%--                    <div class="text-center margin-big padding-big-top"><h1>管理员注册</h1></div>--%>
<%--                    <div class="panel-body" style="padding: 30px;padding-bottom: 10px;padding-top: 10px;">--%>
<%--                        <div class="form-group">--%>
<%--                            <div class="label"><label>登录账号:</label></div>--%>
<%--                            <div class="field field-icon-right">--%>
<%--                                <input type="text" class="input input-big" name="aaccount" placeholder="登录账号" data-validate="required:请填写账号" />--%>
<%--                                <span class="icon icon-user margin-small"></span>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="form-group">--%>
<%--                            <div class="label"><label>登录密码:</label></div>--%>
<%--                            <div class="field field-icon-right">--%>
<%--                                <input type="password" class="input input-big" name="apass" placeholder="登录密码" data-validate="required:请填写密码" />--%>
<%--                                <span class="icon icon-key margin-small"></span>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="form-group">--%>
<%--                            <div class="label"><label>真实姓名:</label></div>--%>
<%--                            <div class="field field-icon-right">--%>
<%--                                <input type="text" class="input input-big" name="aname" placeholder="真实姓名" data-validate="required:请填写密码" />--%>
<%--                                <span class="icon icon-user margin-small"></span>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="form-group">--%>
<%--                            <div class="label"><label>电话:</label></div>--%>
<%--                            <div class="field field-icon-right">--%>
<%--                                <input type="text" class="input input-big" name="atel" placeholder="电话" data-validate="required:请填写密码" />--%>
<%--                                <span class="icon icon-phone margin-small"></span>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div style="padding: 30px;">--%>
<%--                        <input type="submit" class="button button-block bg-main text-big input-big" value="注册" />--%>
<%--                    </div>--%>

<%--                </div>--%>
<%--            </form>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

</body>
</html>
