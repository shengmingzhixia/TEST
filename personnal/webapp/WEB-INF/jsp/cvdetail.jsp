<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019\8\23 0023
  Time: 15:38
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
    <title>详细简历</title>
</head>
<body>
<table border="1" cellspacing="1" cellpadding="0">
    <tr>
        <td>简历名称：</td>
        <td>${requestScope.cv.title}</td>
    </tr>
    <tr>
        <td>真实姓名</td>
        <td>${requestScope.cv.name}</td>
        <td>性别</td>
        <td>${requestScope.cv.gender}</td>
    </tr>
    <tr>
        <td>出生日期</td>
        <td><fmt:formatDate value="${requestScope.cv.birth}" pattern="yyyy-MM-dd"/></td>
        <td>家庭住址</td>
        <td>${requestScope.cv.address}</td>
    </tr>
    <tr>
        <td>毕业院校</td>
        <td>${requestScope.cv.school}</td>
        <td>学历</td>
        <td>${requestScope.cv.education}</td>
    </tr>
    <tr>
        <td>专业</td>
        <td>${requestScope.cv.major}</td>
        <td>入学时间</td>
        <td><fmt:formatDate value="${requestScope.cv.enrollDate}" pattern="yyyy-MM-dd"/></td>
    </tr>
    <tr>
        <td>毕业时间</td>
        <td><fmt:formatDate value="${requestScope.cv.graduationDate}" pattern="yyyy-MM-dd"/></td>
        <td>期望薪资</td>
        <td>${requestScope.cv.salary}</td>
    </tr>
    <tr>
        <td>工作经验</td>
        <td>${requestScope.cv.exprience}</td>
        <td>联系电话</td>
        <td>${requestScope.cv.phone}</td>
    </tr>
</table>
<a href="getCv">返回</a>
</body>
</html>
