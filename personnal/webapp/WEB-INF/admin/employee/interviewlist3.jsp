<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="cgy.model.InterView2" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019\8\25 0025
  Time: 12:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>"/>
    <title>查看面试</title>
</head>
<body>
<%@ include file="../head.jsp" %>
<%
    List<InterView2> interViews = (List<InterView2>) request.getAttribute("list");
    if (interViews != null && interViews.size() != 0) {
%>
<div class="prod">
    <div>
        <table border="1" cellspacing="1" cellpadding="0">
            <tr>
                <td>投递简历</td>
                <td>投递岗位</td>
                <td>面试时间</td>
                <td>操作</td>
            </tr>
            <c:forEach items="${requestScope.list}" var="inter">
                <tr>
                    <td>${inter.in_cv_title}</td>
                    <td>${inter.in_rct_name}</td>
                    <td>
                        <fmt:formatDate value="${inter.in_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
                    </td>
                    <td>
                        <a href="sendInterView3?in_is_accept=2&in_id=${inter.in_id}">面试</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
<%
} else {
%>
<div>没有面试信息</div>
<%
    }
%>

</div>
</body>
</html>
