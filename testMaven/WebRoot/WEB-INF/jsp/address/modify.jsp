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
</head>
<body>

<form action="${ctx}/address/modify" method="post" id="modify">
    <input type="hidden" name="id" value="${address.id}">
    <input type="hidden" name="userId" value="${address.userId}">
    <div class="width500" style="height: 32px;line-height: 32px;margin-top: 25px;">
        <div class="left_yh font16 tright" style="width: 120px;">
            <font class="red">*</font>详细地址 :
        </div>
        <textarea name="address" required rows="3" cols="12" style="width: 243px;border: 1px solid #ddd;margin-left: 5px;">${address.address}
        </textarea>
    </div>
    <div class="width500" style="height: 32px;line-height: 32px;margin-top: 35px;">
        <div class="left_yh font16 tright" style="width: 120px;">
            <font class="red" style="display: none">*</font>邮政编码 :
        </div>
        <input type="text" name="posCode" value="${address.posCode}" style="width: 243px;border: 1px solid #ddd;outline: none;height: 30px;text-indent: 10px;margin-left: 5px;">
    </div>
    <div class="width500" style="height: 32px;line-height: 32px;margin-top: 20px;">
        <div class="left_yh font16 tright" style="width: 120px;">
            <font class="red">*</font>收货人姓名 :
        </div>
        <input type="text" name="consignee" required value="${address.consignee}" style="width: 243px;border: 1px solid #ddd;outline: none;height: 30px;text-indent: 10px;margin-left: 5px;">
    </div>
    <div class="width500" style="height: 32px;line-height: 32px;margin-top: 20px;">
        <div class="left_yh font16 tright" style="width: 120px;">
            <font class="red">*</font>手机号码 :
        </div>
        <input type="text" name="phone" required value="${address.phone}" onblur="checkUtel()" style="width: 243px;border: 1px solid #ddd;outline: none;height: 30px;text-indent: 10px;margin-left: 5px;">
    </div>
    <div class="width500" style="height: 32px;line-height: 32px;margin-top: 20px;">
        <a href="javascript:void(0)" class="left_yh block_yh font16 tcenter ff5802 gai" style="width: 244px;height: 33px;line-height: 33px;margin-left: 120px;margin-bottom: 30px;">修改</a>
    </div>
</form>

<script>

</script>
</body>
</html>