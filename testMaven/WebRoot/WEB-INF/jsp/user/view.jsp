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
    <%@include file="/common/utop.jsp"%>
<%-- 导航条 --%>
<div class="width100" style="height: 45px;background: #dd4545;margin-top: 40px;position: relative;z-index: 100;">
    <!--中间的部分-->
    <div class="width1200 center_yh relative_yh" style="height: 45px;">
        <!--普通导航-->
        <div class="left_yh font16" id="pageNav">
            <a href="${ctx}/login/uIndex">首页</a>
            <a href="${ctx}/news/list">公告</a>
            <a href="${ctx}/message/add">留言</a>
        </div>
    </div>
</div>
<div class="width1200 center_yh hidden_yh font14" style="height: 40px;line-height: 40px;">
    <span>当前位置:</span><a href="${ctx}/login/uIndex" class="c_66">首页</a>
    ><a href="#" class="c_66">个人中心</a>
    ><a href="#" class="c_66">个人信息</a>
</div>
<div class="width100 hidden_yh" style="background: #f0f0f0;padding-top: 34px;padding-bottom: 34px;">
    <div class="width1200 hidden_yh center_yh">
        <div id="vipNav">
            <a href="${ctx}/user/view?person=0" class="on">个人信息</a>
            <a href="${ctx}/porder/my">我的订单</a>
            <a href="${ctx}/sc/findBySql">商品收藏</a>
            <a href="${ctx}/login/pass">修改密码</a>
        </div>
        <div class="vipRight">
            <div class="hidden_yh bj_fff" style="width: 938px;border: 1px solid #ddd;">
                <div class="width100 font24" id="navLt" style="height: 60px;line-height: 60px;text-indent: 50px;background: #f5f8fa;border-bottom: 1px solid #ddd;">
                    <span class="left_yh font24 width20 tcenter cursor onHover onorange slect">收货地址</span>
                    <span class="left_yh font24 width20 tcenter cursor onHover onorange slect">基本信息</span>
                </div>

                <!--收货地址-->
                <div class="width100 hidden_yh hhD" style="display: block">
                    <c:if test="${person == 0}">
                        <form action="${ctx}/address/exAdd" method="post" id="mya">
                            <font style="color: red;margin-left: 32px;">新增收货地址</font>
                            <div class="width100" style="height: 32px;line-height: 32px;margin-top: 25px;">
                                <div class="left_yh font16 tright" style="width: 120px;">
                                    <font class="red">*</font>详细地址 :
                                </div>
                                <textarea name="address" required rows="3" cols="12" style="width: 243px;border: 1px solid #ddd;margin-left: 5px;">
                                </textarea>
                            </div>
                            <div class="width100" style="height: 32px;line-height: 32px;margin-top: 35px;">
                                <div class="left_yh font16 tright" style="width: 120px;">
                                    <font class="red" style="display: none">*</font>邮政编码 :
                                </div>
                                <input type="text" name="posCode" style="width: 243px;border: 1px solid #ddd;outline: none;height: 30px;text-indent: 10px;margin-left: 5px;">
                            </div>
                            <div class="width100" style="height: 32px;line-height: 32px;margin-top: 20px;">
                                <div class="left_yh font16 tright" style="width: 120px;">
                                    <font class="red">*</font>收货人姓名 :
                                </div>
                                <input type="text" name="consignee" required style="width: 243px;border: 1px solid #ddd;outline: none;height: 30px;text-indent: 10px;margin-left: 5px;">
                            </div>
                            <div class="width100" style="height: 32px;line-height: 32px;margin-top: 20px;">
                                <div class="left_yh font16 tright" style="width: 120px;">
                                    <font class="red">*</font>手机号码 :
                                </div>
                                <input type="text" name="phone" required onblur="checkUtel()" style="width: 243px;border: 1px solid #ddd;outline: none;height: 30px;text-indent: 10px;margin-left: 5px;">
                            </div>
                            <div class="width100" style="height: 32px;line-height: 32px;margin-top: 20px;">
                                <a href="javascript:void(0)" class="left_yh block_yh font16 tcenter ff5802 cun" style="width: 244px;height: 33px;line-height: 33px;margin-left: 120px;margin-bottom: 30px;">保存</a>
                            </div>
                        </form>
                    </c:if>

                    <c:if test="${person == 1}">
                        <form action="${ctx}/address/exUpdate" method="post" id="myg">
                            <font style="color: red;margin-left: 32px;">编辑收货地址</font>
                            <input type="hidden" name="id" value="${address.id}">
                            <div class="width100" style="height: 32px;line-height: 32px;margin-top: 25px;">
                                <div class="left_yh font16 tright" style="width: 120px;">
                                    <font class="red">*</font>详细地址 :
                                </div>
                                <textarea name="address" required rows="3" cols="12" style="width: 243px;border: 1px solid #ddd;margin-left: 5px;">${address.address}
                                </textarea>
                            </div>
                            <div class="width100" style="height: 32px;line-height: 32px;margin-top: 35px;">
                                <div class="left_yh font16 tright" style="width: 120px;">
                                    <font class="red" style="display: none">*</font>邮政编码 :
                                </div>
                                <input type="text" name="posCode" value="${address.posCode}" style="width: 243px;border: 1px solid #ddd;outline: none;height: 30px;text-indent: 10px;margin-left: 5px;">
                            </div>
                            <div class="width100" style="height: 32px;line-height: 32px;margin-top: 20px;">
                                <div class="left_yh font16 tright" style="width: 120px;">
                                    <font class="red">*</font>收货人姓名 :
                                </div>
                                <input type="text" name="consignee" required value="${address.consignee}" style="width: 243px;border: 1px solid #ddd;outline: none;height: 30px;text-indent: 10px;margin-left: 5px;">
                            </div>
                            <div class="width100" style="height: 32px;line-height: 32px;margin-top: 20px;">
                                <div class="left_yh font16 tright" style="width: 120px;">
                                    <font class="red">*</font>手机号码 :
                                </div>
                                <input type="text" name="phone" required value="${address.phone}" onblur="checkUtel()" style="width: 243px;border: 1px solid #ddd;outline: none;height: 30px;text-indent: 10px;margin-left: 5px;">
                            </div>
                            <div class="width100" style="height: 32px;line-height: 32px;margin-top: 20px;">
                                <a href="javascript:void(0)" class="left_yh block_yh font16 tcenter ff5802 gai" style="width: 244px;height: 33px;line-height: 33px;margin-left: 120px;margin-bottom: 30px;">修改</a>
                            </div>
                        </form>
                    </c:if>
                    <div class="width100" style="margin-top: 50px;">
                        <table style="width:90%;border:1px white solid">
                            <tr bgcolor="#4F81BD"style="color: #fff;">
                                <th style="text-align: center">收货人</th>
                                <th style="text-align: center">详细地址</th>
                                <th style="text-align: center">邮编</th>
                                <th style="text-align: center">电话/手机</th>
                                <th style="text-align: center">操作</th>
                                <th style="text-align: center"></th>
                            </tr>
                            <c:forEach items="${addressList}" var="data" varStatus="l">
                                <tr bgcolor="${data.id%2 == 0?'#D0D8E8':'#E9EDF4'}">
                                    <td align="center">${data.consignee}</td>
                                    <td align="center">${data.address}</td>
                                    <td align="center">${data.posCode}</td>
                                    <td align="center">${data.phone}</td>
                                    <td align="center" class="ch"><a href="${ctx}/user/view?person=1&id=${data.id}">修改</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="${ctx}/address/delete?id=${data.id}">删除</a> </td>
                                    <c:if test="${data.dfault == 1}">
                                        <td align="center"><a href="#" style="color: red">默认地址</a> </td>
                                    </c:if>
                                    <c:if test="${data.dfault != 1}">
                                        <td align="center" class="ch"><a href="${ctx}/address/change?id=${data.id}">设为默认</a> </td>
                                    </c:if>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>

                <!--基本信息-->
                <div class="width100 hidden_yh hhD" style="display: none">
                    <form action="${ctx}/user/exUpdate" method="post" id="myf">
                        <div class="width100" style="height: 32px;line-height: 32px;margin-top: 25px;">
                            <div class="left_yh font16 tright" style="width: 120px;">
                                <font class="red">*</font>真实姓名 :
                            </div>
                            <input type="text" name="realname" value="${obj.realname}" style="width: 243px;border: 1px solid #ddd;outline: none;height: 30px;text-indent: 10px;margin-left: 5px;">
                        </div>
                        <div class="width100" style="height: 32px;line-height: 32px;margin-top: 25px;">
                            <div class="left_yh font16 tright" style="width: 120px;">
                                <font class="red">*</font>性别 :
                            </div>
                            <select style="outline: none;border: 1px solid #ddd;height: 30px;margin-left: 5px;" name="usex">
                                <option value="男" ${obj.usex=='男'?'selected="selected"':''}>男</option>
                                <option value="女" ${obj.usex=='女'?'selected="selected"':''}>女</option>
                            </select>
                        </div>
                        <div class="width100" style="height: 32px;line-height: 32px;margin-top: 25px;">
                            <div class="left_yh font16 tright" style="width: 120px;">
                                <font class="red">*</font>邮箱 :
                            </div>
                            <input type="text" name="email" id="email" value="${obj.email}" onblur="checkEmail()" style="width: 243px;border: 1px solid #ddd;outline: none;height: 30px;text-indent: 10px;margin-left: 5px;">
                            <span style="font-size:13px" id="emailSpan"></span>
                        </div>
                        <div class="width100" style="height: 32px;line-height: 32px;margin-top: 25px;">
                            <div class="left_yh font16 tright" style="width: 120px;">
                                <font class="red">*</font>手机号 :
                            </div>
                            <input type="text" name="utel" id="utel" value="${obj.utel}" onblur="checkUtel()" style="width: 243px;border: 1px solid #ddd;outline: none;height: 30px;text-indent: 10px;margin-left: 5px;">
                            <span style="font-size:13px" id="utelSpan"></span>
                        </div>
                        <div class="width100" style="height: 32px;line-height: 32px;margin-top: 25px;">
                            <div class="left_yh font16 tright" style="width: 120px;">
                                <font class="red">*</font>身份证号 :
                            </div>
                            <input type="text" name="uid" id="uid" value="${obj.uid}" onblur="checkUid()" style="width: 243px;border: 1px solid #ddd;outline: none;height: 30px;text-indent: 10px;margin-left: 5px;">
                            <span style="font-size:13px" id="uidSpan"></span>
                        </div>
                        <div class="width100" style="height: 32px;line-height: 32px;margin-top: 70px;">
                            <a href="javascript:void(0)" class="left_yh block_yh font16 tcenter ff5802 sub" style="width: 244px;height: 33px;line-height: 33px;margin-left: 120px;margin-bottom: 30px;">保存</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(function () {
        $(".sub").click(function () {
            alert("修改成功！！！")
            $("#myf").submit();
        })
    });
    $(function () {
        $(".cun").click(function () {
            alert("添加成功！！！")
            $("#mya").submit();
        })
    });
    $(function () {
        $(".gai").click(function () {
            alert("修改成功！！！")
            $("#myg").submit();
        })
    });


    $("#navLt span").click(function () {
        var t = $(this).index();
        $(this).addClass("slect").siblings().removeClass("slect");
        $(".hhD").eq(t).css({display:"block"}).siblings(".hhD").css({display: "none"});
    });

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
    function checkUid() {
        var uid = document.getElementById("uid").value;
        var uidSpan = document.getElementById("uidSpan");
        var reg = /^[1-9]\d{5}(18|19|20|(3\d))\d{2}((0[1-9])|(1[0-2]))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/i;
        if(reg.test(uid)){
            uidSpan.innerHTML = "√".fontcolor("green");
            return true;
        }else {
            uidSpan.innerHTML = "身份证号格式不正确，请重新填写！".fontcolor("red");
            return false;
        }
    }
</script>



<%@include file="/common/ufooter.jsp"%>
</body>
</html>
