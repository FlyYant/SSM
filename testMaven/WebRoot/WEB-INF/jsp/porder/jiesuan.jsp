<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@include file="/common/taglibs.jsp"%>
<html>
<head>
    <title>首页</title>
    <link rel="stylesheet" href="${ctx}/resource/user/css/style.css">
    <script src="${ctx}/resource/user/js/jquery-1.8.3.min.js"></script>
    <script src="${ctx}/resource/user/js/jquery.luara.0.0.1.min.js"></script>
    <script src="${ctx}/resource/js/jquery-3.5.1/jquery-3.5.1.min.js"></script>
    <script src="${ctx}/resource/js/layer/layer.js"></script>
    <script src="${ctx}/resource/js/layui-v2.5.7/layui/layui.js"></script>
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
    ><a href="#" class="c_66">我的购物车</a>
</div>
<div class="width1198 hidden_yh center_yh" style="border: 1px solid #ddd;margin-top: 18px;">
    <div class="width100 hidden_yh font14" style="height: 32px;line-height: 32px;
    background: #f0f0f0;text-indent: 21px;color: #000;font-weight: 600;border-bottom: 1px solid #ddd">
        确认收货地址
        <a href="${ctx}/user/view?person=0"><font class="change" style="float: right;font-size: 13px;margin-right: 10px;">管理收货地址</font></a>
    </div>
    <c:forEach items="${addressList}" var="data" varStatus="1">
        <div class="address-list" data-id="${data.id}">
            <div class="userId" style="display: none">
                <font color="red">${data.userId}</font>
            </div>
            <c:if test="${data.dfault == 1}">
                <div class="jisong" style="visibility: visible">
                    <font color="red">寄送至</font>
                </div>
                <div class="gou on">
                    <b><img src="${ctx}/resource/user/images/xzwxz.png"></b>
                </div>
            </c:if>
            <c:if test="${data.dfault != 1}">
                <div class="jisong" style="visibility: hidden">
                    <font color="red">寄送至</font>
                </div>
                <div class="gou">
                    <b><img src="${ctx}/resource/user/images/xzwxz.png"></b>
                </div>
            </c:if>
            <div class="dizhi">
                <font>${data.address}</font>
            </div>
            <div class="shr">
                <font>(${data.consignee} 收)</font>
            </div>
            <div class="dianhua">
                <font>${data.phone}</font>
            </div>
            <c:if test="${data.dfault == 1}">
                <div class="moren">
                    <font color="#a9a9a9">默认地址</font>
                </div>
            </c:if>
        </div>
    </c:forEach>
</div>

<div class="width1198 hidden_yh center_yh" style="border: 1px solid #ddd;margin-top: 18px;">
    <div class="width100 hidden_yh font14" style="height: 32px;line-height: 32px;
    background: #f0f0f0;text-indent: 21px;color: #000;font-weight: 600;border-bottom: 1px solid #ddd">商品详情</div>
    <div class="width100 hidden_yh font14" style="height: 42px;line-height: 42px;border-bottom: 1px solid #ddd;">
        <div class="left_yh tcenter font14" style="width: 486px;">商品</div>
        <div class="left_yh tcenter font14" style="width: 175px;">价格</div>
        <div class="left_yh tcenter font14" style="width: 175px;">数量</div>
        <div class="left_yh tcenter font14" style="width: 175px;">小计</div>
    </div>
    <c:forEach items="${allList}" var="data2" varStatus="11">
        <div class="speCific" data-id="${data2.id}">
            <div class="xzSp">
                <img src="${data2.product.url1}">
                <div class="xzSpIn">
                    <h3 class="font16 c_33 font100">${data2.product.pname}</h3>
                </div>
            </div>
            <div class="xzJg">
                ￥<font>${data2.price}</font>
            </div>
            <div class="xzNum">
                <font>${data2.num}</font>
            </div>
            <div class="xzXj">￥<font>${data2.total}</font></div>
        </div>
    </c:forEach>
</div>

<div class="width1198 center_yh" style="height: 60px;background: #f0f0f0;border: 1px solid #ddd;margin-top: 40px;">
    <div class="center_yh hidden_yh" style="width: 1178px;height: 60px;margin-left: 20px;">
        <div class="sXd">
            <div class="sXd2">合计（不含运费）: ￥<font style="color: #cb1c20" id="zjJg">0</font> </div>
<%--            <a href="${ctx}/porder/exAdd" class="ifJs">确认提交订单</a>--%>
            <a href="javascript:void(0)" class="ifJs" onclick="confirm()">结算</a>
        </div>
    </div>
</div>
<script>
    //选择或不选择一项
    $(".gou").click(function () {
        if($(this).hasClass("on")){
            $(this).removeClass("on");
            $(this).prev().css({"visibility":"hidden"});
            $(".gou").siblings().find(".change").css({"visibility":"hidden"});
        }else {
            $(".gou").removeClass("on");
            $(".gou").prev().css({"visibility":"hidden"});
            $(this).addClass("on");
            $(this).prev().css({"visibility":"visible"});
            $(".gou").siblings().find(".change").css({"visibility":"hidden"});
            $(this).siblings().find(".change").css({"visibility":"visible"});
        }
    });
    //计算总计
    window.onload = function () {
        var allTotal = 0;
        $(".xzSp").each(function () {
            var price = $(this).parent().find(".xzJg").find("font").html();
            var num = $(this).parent().find(".xzNum").find("font").html();
            allTotal += price*num;
        });
        $("#zjJg").html(sswr(allTotal));
    }
    //保留两位小数
    function sswr(num) {
        return num.toFixed(2);
    }
    //确认订单--进入购买流程
    function confirm() {
        var arr = new Array();
        $(".gou.on").each(function () {
            var $id = $(this).parent().attr("data-id");
            var $userId = $(this).parent().find(".userId").find("font").html();
            var $address = $(this).parent().find(".dizhi").find("font").html();
            var $consignee = $(this).parent().find(".shr").find("font").html();
            var $phone = $(this).parent().find(".dianhua").find("font").html();
            var obj = new Object();
            obj.id = $id;
            obj.userId = $userId;
            obj.address = $address;
            obj.consignee = $consignee;
            obj.phone = $phone;
            arr.push(obj);
        });
        if(arr.length==0){
            alert("请先选择收货地址!!!");
            return false;
        }
        $.ajax({
            type:"POST",
            url:"${ctx}/porder/exAdd",
            data:JSON.stringify(arr),
            contentType:"application/json",
            success:function (result) {
                if(result.res == 0){
                    alert("请登录");
                    window.location.href="${ctx}/login/uLogin";
                }else if (result.res == 2){
                    alert("请编辑地址");
                }else {
                    alert("购买成功");
                    window.location.href="${ctx}/porder/my";
                    <%--window.location.href="${ctx}/porder/tijiao";--%>
                }
            }
        });
    }
</script>
<%@include file="/common/ufooter.jsp"%>
</body>
</html>
