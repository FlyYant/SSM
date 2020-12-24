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
    <form action="${ctx}/user/findBySql" id="listform" method="post">
        <div class="padding border-bottom">
            <ul class="search" style="padding-left: 10px">
                <li>
                    <input type="text" placeholder="请输入用户名" name="uname" class="input" value="${obj.uname}"
                           style="width: 250px;line-height: 17px;display: inline-block"/>
                    <a href="javascript:void(0);" onclick="changeSearch()" class="button border-main icon-search">搜索</a>

                </li>
            </ul>
        </div>
    </form>
    <table class="table table-hover text-center">
        <tr>
            <th>用户名</th>
            <th>真实姓名</th>
            <th>电话</th>
            <th>性别</th>
            <th>邮箱</th>
            <th>注册时间</th>
            <th>最后登录时间</th>
            <th>状态</th>
<%--            <th>操作</th>--%>
        </tr>
    <c:forEach items="${pagers.datas}" var="data" varStatus="1">
        <tr>
            <td>${data.uname}</td>
            <td>${data.realname}</td>
            <td>${data.utel}</td>
            <td>${data.usex}</td>
            <td>${data.email}</td>
            <td><fmt:formatDate value="${data.zctime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            <td><fmt:formatDate value="${data.lasttime}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
            <td>
                <c:if test="${data.ustate == 0}">
                    <a class="button button-little bg-blue" href="${ctx}/user/close?id=${data.id}">启用</a>
                </c:if>
                <c:if test="${data.ustate == 1}">
                    <a class="button button-little bg-red" href="${ctx}/user/open?id=${data.id}">禁用</a>
                </c:if>
            </td>
        </tr>
    </c:forEach>
        <tr>
            <td colspan="8">
                <div class="pagelist">
                    <%-- 分页开始 --%>
                    <pg:pager url="${ctx}/user/findBySql" maxIndexPages="5" items="${pagers.total}" maxPageItems="5" export="curPage=pageNumber">
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