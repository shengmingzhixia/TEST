<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019\8\24 0024
  Time: 16:09
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
    <title>用户详情</title>
</head>
<body>
<%@ include file="../head.jsp" %>
<table border="1" cellspacing="1" cellpadding="0">
    <tr>
        <td>姓名</td>
        <td>${requestScope.employee1.e_name}</td>
    </tr>
    <tr>
        <td>身份</td>
        <td>${requestScope.employee1.e_type}</td>
        <td>性别</td>
        <td>${requestScope.employee1.e_gender}</td>
    </tr>
    <tr>
        <td>入职时间</td>
        <td><fmt:formatDate value="${requestScope.employee1.e_enroll_date}" pattern="yyyy-MM-dd"/></td>
        <td>家庭住址</td>
        <td>${requestScope.employee1.e_address}</td>
    </tr>
    <tr>
        <td>电话</td>
        <td>${requestScope.employee1.e_phone}</td>
        <td>银行卡号</td>
        <td>${requestScope.employee1.e_debit}</td>
    </tr>
    <tr>
        <td>状态</td>
        <td>${requestScope.employee1.e_state}</td>
        <td>薪资</td>
        <td>${requestScope.employee1.e_salary}</td>
    </tr>
    <tr>
        <td>职位id</td>
        <td>${requestScope.employee1.e_pos_id}</td>
        <td>职位名称</td>
        <td>${requestScope.posName}</td>
    </tr>
    <tr>
        <td>部门id</td>
        <td>${requestScope.employee1.e_pos_id}</td>
        <td>部门名称</td>
        <td>${requestScope.depName}</td>
    </tr>
</table>
</body>
</html>
