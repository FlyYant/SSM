<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@include file="/common/taglibs.jsp"%>
<html>
<head>
    <title>首页</title>
    <link rel="stylesheet" href="${ctx}/resource/user/css/style.css">
    <script src="${ctx}/resource/user/js/jquery-1.8.3.min.js"></script>
    <script src="${ctx}/resource/user/js/jquery.luara.0.0.1.min.js"></script>
</head>
<body>
    <div class="width100 hidden_yh" style="height: 573px;background: url('${ctx}/resource/user/images/bj.jpg') no-repeat center">
        <div class="width100 hidden_yh center_yh" style="margin-top: 75px;margin-left: 200px;">
            <form action="${ctx}/login/toRes" method="post" onsubmit="return checkAll()">
                <div class="center_yh hidden_yh" style="width: 650px;margin-bottom: 40px;">
                    <span style="color: red; margin-right: 40px;height: 42px;line-height: 42px;width: 100px;" class="left_yh block_yh tright">用户名：</span>
                    <input type="text" name="uname" placeholder="请输入您的用户名" required style="border: 1px solid #c9c9c9;width: 292px;height: 42px;font-size: 16px;text-indent: 22px;" class="left_yh">
                </div>
                <div class="center_yh hidden_yh" style="width: 650px;margin-bottom: 40px;">
                    <span style="color: red; margin-right: 40px;height: 42px;line-height: 42px;width: 100px;" class="left_yh block_yh tright">设置密码：</span>
                    <input type="password" name="upass" id="upass" onblur="checkUpass()" placeholder="建议至少使用两种字符组合,8-16位" style="border: 1px solid #c9c9c9;width: 292px;height: 42px;font-size: 16px;text-indent: 22px;" class="left_yh">
                    <span style="font-size:13px;line-height: 42px" id="upassSpan"></span>
                </div>
                <div class="center_yh hidden_yh" style="width: 650px;margin-bottom: 40px;">
                    <span style="color: red; margin-right: 40px;height: 42px;line-height: 42px;width: 100px;" class="left_yh block_yh tright">邮箱：</span>
                    <input type="text" name="email" id="email" onblur="checkEmail()" placeholder="请输入您的邮箱" style="border: 1px solid #c9c9c9;width: 292px;height: 42px;font-size: 16px;text-indent: 22px;" class="left_yh">
                    <span style="font-size:13px;line-height: 42px" id="emailSpan"></span>
                </div>
                <div class="center_yh hidden_yh" style="width: 650px;margin-bottom: 40px;">
                    <span style="color: red; margin-right: 40px;height: 42px;line-height: 42px;width: 100px;" class="left_yh block_yh tright">手机号：</span>
                    <input type="text" name="utel" id="utel" onblur="checkUtel()" placeholder="建议使用常用的手机" pattern="^1[3|4|5|7|8][0-9]{9}$" style="border: 1px solid #c9c9c9;width: 292px;height: 42px;font-size: 16px;text-indent: 22px;" class="left_yh">
                    <span style="font-size:13px;line-height: 42px" id="utelSpan"></span>
                </div>
                <p class="font14 c_66" style="text-indent: 500px;margin-top: 30px;margin-left: 75px;">
                    <input type="checkbox">我已阅读并同意<a href="#" class="red">《会员注册协议》</a>和<a href="#" class="red">《隐私保护政策》</a>
                </p>
                <input type="submit" value="提交" class="ipt_tj" style="width: 295px;height: 44px;margin-left: 575px;">
            </form>
        </div>
    </div>
<%@include file="/common/ufooter.jsp"%>
<script type="text/javascript">
    function checkAll() {
        if(checkEmail()&&checkUtel()&&checkUpass()){
            return true;
        }else {
            return false;
        }

    }
    function checkEmail() {
        var email = document.getElementById("email").value;
        var emailSpan = document.getElementById("emailSpan");
        var reg = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/i;
        if(reg.test(email)){
            emailSpan.innerHTML = "√".fontcolor("green");
            return true;
        }else {
            emailSpan.innerHTML = "邮箱格式不正确，请重新填写！".fontcolor("red");
            return false;
        }
    }
    function checkUtel() {
        var utel = document.getElementById("utel").value;
        var utelSpan = document.getElementById("utelSpan");
        var reg = /^1[3|4|5|7|8][0-9]{9}$/i;
        if(reg.test(utel)){
            utelSpan.innerHTML = "√".fontcolor("green");
            return true;
        }else {
            utelSpan.innerHTML = "手机号格式不正确，请重新填写！".fontcolor("red");
            return false;
        }
    }
    function checkUpass() {
        var upass = document.getElementById("upass").value;
        var upassSpan = document.getElementById("upassSpan");
        var reg = /(?!.*\s)(?!^[\u4e00-\u9fa5]+$)(?!^[0-9]+$)(?!^[A-z]+$)(?!^[^A-z0-9]+$)^.{8,16}$/i;
        if(reg.test(upass)){
            upassSpan.innerHTML = "√".fontcolor("green");
            return true;
        }else {
            upassSpan.innerHTML = "密码格式不正确，请重新填写！".fontcolor("red");
            return false;
        }
    }
</script>
</body>
</html>
