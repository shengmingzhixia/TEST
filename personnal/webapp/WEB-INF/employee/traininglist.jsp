<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019\8\29 0029
  Time: 9:45
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
    <title>员工查看培训记录</title>
</head>
<body>
<%@ include file="head.jsp" %>
<div>
    <table>
        <tr>
            <td>培训标题</td>
            <td>培训内容</td>
            <td>开始时间</td>
            <td>结束时间</td>
            <td>培训地点</td>
        </tr>
        <c:forEach items="${requestScope.trains}" var="train">
            <tr>
                <td>${train.t_title}</td>
                <td>${train.t_context}</td>
                <td><fmt:formatDate value="${train.t_start_time}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td><fmt:formatDate value="${train.t_end_time}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td>${train.t_address}</td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>