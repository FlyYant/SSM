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
    <form action="${ctx}/porder/findBySql" id="listform" method="post">
        <div class="padding border-bottom">
            <ul class="search" style="padding-left: 10px">
                <li>
                    <input type="text" placeholder="请输入订单号" name="code" class="input" value="${obj.code}"
                           style="width: 250px;line-height: 17px;display: inline-block"/>
                    <a href="javascript:void(0);" onclick="changeSearch()" class="button border-main icon-search">搜索</a>
                </li>
            </ul>
        </div>
    </form>
    <table class="table table-hover text-center">
        <tr>
            <th>订单号</th>
            <th>下单时间</th>
            <th>总金额</th>
            <th>下单人</th>
            <th>订单状态</th>
            <th>操作</th>
        </tr>
    <c:forEach items="${pagers.datas}" var="data" varStatus="1">
        <tr>
            <td>${data.code}</td>
            <td><fmt:formatDate value="${data.addTime}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
            <td>${data.orderPrice}</td>
            <td>${data.user.uname}</td>
            <td style="color: red">
                <c:if test="${data.status == 0}">待发货</c:if>
                <c:if test="${data.status == 1}">已取消</c:if>
                <c:if test="${data.status == 3}">待收货</c:if>
                <c:if test="${data.status == 4}">已收货</c:if>
            </td>
            <td>
                <div class="button-group">
                    <a class="button border-main" href="${ctx}/porderDetail/ulist?porderId=${data.id}"><span class="icon-edit">查看购买商品</span> </a>
                    <c:if test="${data.status == 0}">
                        <a class="button border-red" href="${ctx}/porder/fh?id=${data.id}"><span class="icon-trash-o">去发货</span> </a>
                    </c:if>
                </div>
            </td>
        </tr>
    </c:forEach>
        <tr>
            <td colspan="8">
                <div class="pagelist">
                    <%-- 分页开始 --%>
                    <pg:pager url="${ctx}/porder/findBySql" maxIndexPages="5" items="${pagers.total}" maxPageItems="5" export="curPage=pageNumber">
                        <pg:last>
                            共${pagers.total}记录,共${pageNumber}页
                        </pg:last>
                        当前第${curPage}页
                        <pg:first>
                            <a href="${pageUrl}">首页</a>
                        </pg:first>
                        <pg:prev>
                            <a href="${pageUrl}">上一页</a>
                        </pg:prev>
                        <pg:pages>
                            <c:choose>
                                <c:when test="${curPage eq pageNumber}">
                                    <font color="red">[${pageNumber}]</font>
                                </c:when>
                                <c:otherwise>
                                    <a href="${pageUrl}">${pageNumber}</a>
                                </c:otherwise>
                            </c:choose>
                        </pg:pages>
                        <pg:next>
                            <a href="${pageUrl}">下一页</a>
                        </pg:next>
                        <pg:last>
                            <c:choose>
                                <c:when test="${curPage eq pageNumber}">
                                    <font color="red">尾页</font>
                                </c:when>
                                <c:otherwise>
                                    <a href="${pageUrl}">尾页</a>
                                </c:otherwise>
                            </c:choose>
                        </pg:last>
                    </pg:pager>
                </div>
            </td>
        </tr>
    </table>
</div>

</body>
<script>
    function changeSearch() {
        $("#listform").submit();
    }
</script>
</html>