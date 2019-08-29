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
</head>
<body>
<div id="mainDiv">

    <%@ include file="../main/head.jsp" %>

    <div id="centerDiv">

        <%@ include file="../main/left.jsp" %>


        <div id="right">
            <div id="current" align="center">&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size: 20px;font-weight: bold;">当前位置--->>>${title}</span>
            </div>
            <br/><br/>
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
                    <c:forEach items="${requestScope.salarys}" var="salary">
                        <tr>
                            <td>${sessionScope.employeeNow.e_name}</td>
                            <td><fmt:formatDate value="${salary.s_date}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                            <td>${salary.s_performance}</td>
                            <td>${salary.s_extra}</td>
                            <td>${salary.s_reward}</td>
                            <td>${salary.s_insurance}</td>
                            <td>${salary.s_total}</td>
                            <td>异议</td>
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
