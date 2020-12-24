<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@include file="/common/taglibs.jsp"%>
<html>
<head>
    <title>首页</title>
    <link rel="stylesheet" href="${ctx}/resource/user/css/style.css">
    <script src="${ctx}/resource/user/js/jquery-1.8.3.min.js"></script>
    <script src="${ctx}/resource/user/js/jquery.luara.0.0.1.min.js"></script>
    <script type="text/javascript" src="${ctx}/resource/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="${ctx}/resource/ueditor/ueditor.all.min.js"></script>
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

</div>
<div class="width100 hidden_yh" style="background: #f0f0f0;padding-top: 34px;padding-bottom: 34px;">
    <div class="width1200 hidden_yh center_yh">
        <div id="vipRight" style="height: 60px;line-height: 60px;text-indent: 50px;background: #f5f8fa;width: 1200px;border: 1px solid #ddd;">
            提出问题
        </div>
        <div class="bj_fff hidden_yh" style="width: 1200px;border: 1px solid #ddd;margin-top: 30px;padding: 50px;">
            <div class="width100" style="height: 32px;line-height: 32px;">
                <div class="left_yh font16 tright" style="width: 120px;"><font class="red">*</font>商品名 :&nbsp;&nbsp; </div>
                <input type="text" value="${obj.pname}" readonly style="width: 243px;border: 1px solid #FFFFFF;outline: none;height: 30px;text-indent: 10px;">
            </div>
            <div class="width100" style="height: 100px;line-height: 32px;margin-top: 25px;">
                <div class="left_yh font16 tright" style="width: 120px;"><font class="red">*</font>主图 :&nbsp;&nbsp; </div>
                <img src="${obj.url1}" width="100" height="100"/>
            </div>
            <div class="width100" style="height: 32px;line-height: 32px;margin-top: 25px;">
                <div class="left_yh font16 tright" style="width: 120px;"><font class="red">*</font>提出者 :&nbsp;&nbsp; </div>
                <input type="text" value="${user.uname}" readonly style="width: 243px;border: 1px solid #FFFFFF;outline: none;height: 30px;text-indent: 10px;">
            </div>
            <form action="${ctx}/problem/exAdd" method="post" class="form-x" enctype="multipart/form-data">
                <input type="hidden" name="productId" value="${obj.id}"/>
                <input type="hidden" name="userId" value="${user.id}"/>
                <div class="width100" style="margin-top: 25px;">
                    <div class="left_yh font16 tright" style="width: 120px;"><font class="red">*</font>问题说明 :&nbsp;&nbsp; </div>
                    <input type="text" name="content" style="width: 486px;border: 1px solid #ddd;outline: none;height: 30px;text-indent: 10px;">
                </div>
                <div class="width100" style="margin-top: 25px;">
                    <div class="left_yh font16 tright" style="width: 120px;"><font class="red">*</font>实物图片 :&nbsp;&nbsp; </div>
                    <div class="field">
                        <input type="file" class="input w50" name="file"/>
                        <div class="tips"></div>
                    </div>
                </div>
                <div class="width100" style="margin-top: 25px;">
                    <div class="label"></div>
                    <div class="field">
                        <button class="left_yh block_yh font16 tcenter ff5802" type="submit" style="width: 244px;height: 33px;line-height: 33px;margin-left: 120px;">提交</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript">

</script>
<%@include file="/common/ufooter.jsp"%>
</body>
</html>
