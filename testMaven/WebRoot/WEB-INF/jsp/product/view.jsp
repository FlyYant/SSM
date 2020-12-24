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
    ><a href="#" class="c_66">商品列表</a>
    ><a href="#" class="c_66">详情</a>
    <input type="hidden" id="sc" value="${sc}">
</div>
<div class="width1198 center_yh" style="height: 420px;">
    <div class="left_yh" style="width: 350px;height: 420px;">
        <input type="hidden" id="id" value="${obj.id}">
        <div id="preview">
            <div>
                <img src="${obj.url1}" alt="" height="350" width="350" id="zhu">
            </div>
            <div id="spec-list">
                <ul class="list-h">
                    <li><img src="${obj.url1}" id="xia1"/></li>
                    <li><img src="${obj.url2}" id="xia2"/></li>
                    <li><img src="${obj.url3}" id="xia3"/></li>
                    <li><img src="${obj.url4}" id="xia4"/></li>
                    <li><img src="${obj.url5}" id="xia5"/></li>
                </ul>
            </div>
            <script>
                $("#xia1").click(function () {
                    //获取图片的地址
                    var path = $("#xia1").attr("src");
                    //在需要显示的地方放入地址
                    $("#zhu").attr("src",path);
                });
                $("#xia2").click(function () {
                    var path = $("#xia2").attr("src");
                    $("#zhu").attr("src",path);
                });
                $("#xia3").click(function () {
                    var path = $("#xia3").attr("src");
                    $("#zhu").attr("src",path);
                });
                $("#xia4").click(function () {
                    var path = $("#xia4").attr("src");
                    $("#zhu").attr("src",path);
                });
                $("#xia5").click(function () {
                    var path = $("#xia5").attr("src");
                    $("#zhu").attr("src",path);
                });
            </script>
        </div>
    </div>
    <div class="left_yh" style="width: 729px;height: 420px;margin-left: 42px;">
        <h3 class="font20 font100">${obj.pname}</h3>
        <p class="font16 c_66" style="margin-top: 25px; ">
            <font style="margin-right: 20px;">价格:</font>
            <font class="red font20">
                ￥${obj.price}
            </font>
        </p>
        <c:if test="${obj.zk!=null}">
            <p class="font16 c_66" style="margin-top: 25px;">
                <font style="margin-right: 20px;">促销:</font>
                <font>
                    ${obj.zk}
                    <span style="color: red">折</span>
                </font>
            </p>
        </c:if>
        <p class="font16 c_66 likeColor" style="margin-top: 25px;">
            <font style="margin-right: 20px;">数量:</font>
            <a href="javascript:void(0)" id="min_s">-</a>
            <input type="text" value="1" readonly id="t_a">
            <a href="javascript:void(0)" id="add_s">+</a>
            <font class="font14 c_99" style="margin-left: 20px;">库存${obj.psum}箱</font>
            <script>
                var tr = $("#t_a").val();
                $("#min_s").click(function () {
                    tr--;
                    if(tr<1){
                        $("#t_a").val(1);
                        tr = 1;
                    }else {
                        $("#t_a").val(tr);
                    }
                });
                $("#add_s").click(function () {
                    tr++;
                    $("#t_a").val(tr);
                });
            </script>
        </p>
        <div class="buyFor">
            <a href="${ctx}/sc/exAdd?productId=${obj.id}" class="mstBuy">收藏</a>
            <a href="javascript:void(0)" class="addCar">加入购物车</a>
            <a href="${ctx}/problem/add?productId=${obj.id}" class="addProblem">提问</a>
        </div>
    </div>
</div>
<div class="width1200 hidden_yh center_yh" style="margin-top: 40px;">
    <div class="right_yh" style="width: 1200px;">
        <div class="hidden_yh" id="spXqpj">
            <a href="javascript:void(0)" id="f1" class="on">商品详情</a>
            <a href="javascript:void(0)" id="f2">商品评价</a>
            <a href="javascript:void(0)" id="f3">相关提问</a>
        </div>
        <div class="width100 hidden_yh">
            <div id="spDetail">
                ${obj.ms}
            </div>
            <div id="spPj">
                <div class="width100 hidden_yh" style="padding-bottom: 20px;border-bottom: 1px solid #ddd;margin-bottom: 10px;">
                    <c:forEach items="${obj.pls}" var="data" varStatus="1">
                        <div style="width: 790px;float: right;overflow: hidden;margin-top: 20px;">
                            <img src="${ctx}/resource/user/images/x.jpg" style="width: 40px;height: 40px;border-radius: 50%;float: left;border: 1px solid #ddd;margin-top: 20px;margin-right: 30px;">
                            <h3 class="font16 c_33 font100" style="color: red;font-weight: bold;">${data.user.uname}</h3>
                            <p class="font14 c_99" style="margin-top: 6px;">
                                <fmt:formatDate value="${data.addTime}" pattern="yyyy-MM-dd"/>
                            </p>
                            <p class="font16 c_33" style="margin-top: 6px;">
                                ${data.content}
                            </p>
                            <div class="width100 hidden_yh" style="padding-bottom: 20px;border-bottom: 1px dashed #ddd;margin-bottom: 10px;"></div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div id="spWt">
                <div class="width100 hidden_yh" style="padding-bottom: 20px;border-bottom: 1px solid #ddd;margin-bottom: 10px;">
                    <c:forEach items="${obj.wts}" var="data" varStatus="11">
                        <div style="width: 790px;float: right;overflow: hidden;margin-top: 20px;">
                            <img src="${ctx}/resource/user/images/x.jpg" style="width: 40px;height: 40px;border-radius: 50%;float: left;border: 1px solid #ddd;margin-top: 20px;margin-right: 30px;">
                            <h3 class="font16 c_33 font100" style="color: red;font-weight: bold;">
                                ${data.user.uname}&nbsp;&nbsp;&nbsp;&nbsp;<fmt:formatDate value="${data.solveTime}" pattern="yyyy-MM-dd"/>
                            </h3>
                            <p class="font16 c_99" style="margin-top: 6px;">
                                问 :&nbsp;${data.content}
                            </p>
                            <p class="font16 c_33" style="margin-top: 6px;">
                                答 :&nbsp;${data.solve}
                            </p>
                            <c:if test="${not empty data.url1}">
                                <img src="${data.url1}" style="width: 100px;height: 100px;float: left;border: 1px solid #ddd;margin-top: 20px;margin-right: 30px;">
                            </c:if>

                            <div class="width100 hidden_yh" style="padding-bottom: 20px;border-bottom: 1px dashed #ddd;margin-bottom: 10px;"></div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    var p = $("#sc").val();
    if(p=="1"){
        alert("该商品你已收藏，无需再次收藏!");
    }
    $("#spXqpj").click(function () {
        $(this).addClass("on").siblings().removeClass("on");
    });
    $("#spXqpj a").eq(0).click(function () {
        $("#spDetail").css({display:"block"}).siblings().css({display: "none"});
        $("#f1").addClass("on");
        $("#f2").removeClass("on");
        $("#f3").removeClass("on");
    });
    $("#spXqpj a").eq(1).click(function () {
        $("#spPj").css({display:"block"}).siblings().css({display: "none"});
        $("#f1").removeClass("on");
        $("#f2").addClass("on");
        $("#f3").removeClass("on");
    });
    $("#spXqpj a").eq(2).click(function () {
        $("#spWt").css({display:"block"}).siblings().css({display: "none"});
        $("#f1").removeClass("on");
        $("#f2").removeClass("on");
        $("#f3").addClass("on");
    });

    $(function () {
        $(".addCar").click(function () {
            var id = $("#id").val();
            var num = $("#t_a").val();
            $.ajax({
                type:"POST",
                url:"${ctx}/cart/exAdd?productId="+id+"&num="+num,
                success:function (result) {
                    var re = result;
                    if(re.res == 0){
                        alert("请登录");
                        window.location.href="${ctx}/login/uLogin";
                    }else {
                        window.location.href="${ctx}/cart/findBySql";
                    }
                }
            });
        })
    });
</script>
<%@include file="/common/ufooter.jsp"%>
</body>
</html>
