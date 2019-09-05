<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019\8\29 0029
  Time: 10:48
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
    <title>所有的薪资结算</title>
    <link href="css/main.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
<div id="mainDiv">

    <%@ include file="../main/head.jsp" %>

    <div id="centerDiv">

        <%@ include file="../main/left.jsp" %>


        <div id="right">
            <%@ include file="../main/clock.jsp" %>
            <br/><br/>
            <div>
                <table class="table table-striped">
                    <tr>
                        <th>姓名</th>
                        <th>结算日期</th>
                        <th>基本薪资</th>
                        <th>加班费</th>
                        <th>奖惩</th>
                        <th>社保</th>
                        <th>总计</th>
                    </tr>
                    <c:forEach items="${requestScope.salarys}" var="salary">
                        <tr>
                            <td>${sessionScope.employeeNow.e_name}</td>
                            <td><fmt:formatDate value="${salary.s_date}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                            <td>${salary.s_performance}</td>
                            <td>${salary.s_extra}</td>
                            <td>${salary.s_reward}</td>
                            <td>${salary.s_insurance}</td>
                            <td>${salary.s_total}</td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </div>
    <div id="bottomDiv"></div>
</div>
</body>
</html>
