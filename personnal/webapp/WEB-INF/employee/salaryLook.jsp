<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019\8\29 0029
  Time: 10:23
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
    <title>查看薪资表</title>
</head>
<body>
<div>
    <table>
        <tr>
            <td>姓名</td>
            <td>结算日期</td>
            <td>基本薪资</td>
            <td>加班费</td>
            <td>奖惩</td>
            <td>社保</td>
            <td>总计</td>
            <td>操作</td>
        </tr>
        <tr>
            <td>${sessionScope.employeeNow.e_name}</td>
            <td><fmt:formatDate value="${requestScope.salary.s_date}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            <td>${requestScope.salary.s_performance}</td>
            <td>${requestScope.salary.s_extra}</td>
            <td>${requestScope.salary.s_reward}</td>
            <td>${requestScope.salary.s_insurance}</td>
            <td>${requestScope.salary.s_total}</td>
            <td>异议</td>
        </tr>
    </table>
</div>
<div>
    <a href="getSalaryOwnerAll">查看自己所有的薪资结算</a>
</div>
</body>
</html>
