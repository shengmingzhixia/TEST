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
    <link href="css/main.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdn.bootcss.com/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script>
        function addReason() {
            document.getElementById("button1").style.display = "none"
            document.getElementById("button2").style.display = "block"
        }
    </script>
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
                        <th>应缴社保</th>
                        <th>总计</th>
                        <th>操作</th>
                    </tr>
                    <tr>
                        <td>${sessionScope.employeeNow.e_name}</td>
                        <td><fmt:formatDate value="${requestScope.salary.s_date}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                        <td>${requestScope.salary.s_performance}</td>
                        <td>${requestScope.salary.s_extra}</td>
                        <td>${requestScope.salary.s_reward}</td>
                        <td>${requestScope.salary.s_insurance}</td>
                        <td>${requestScope.salary.s_total}</td>
                        <c:if test="${requestScope.salary.s_is_trouble==0}">
                            <td id="button1">
                                <button onclick="addReason()">异议</button>
                            </td>
                        </c:if>
                        <c:if test="${requestScope.salary.s_is_trouble==1}">
                            <td>异议中</td>
                        </c:if>
                        <c:if test="${requestScope.salary.s_is_trouble==2}">
                            <td>被驳回</td>
                        </c:if>
                        <c:if test="${requestScope.salary.s_is_trouble==3}">
                            <td>异议成功</td>
                        </c:if>
                        <td id="button2" hidden>
                            <form action="updateSalary" method="post">
                                <input type="hidden" name="s_id" value="${requestScope.salary.s_id}">
                                <input type="hidden" name="s_is_trouble" value="1">
                                <input type="text" name="reason" placeholder="请填写异议理由">
                                <input type="submit" value="提交">
                            </form>
                        </td>
                    </tr>
                </table>
            </div>
            <div>
                <a href="getSalaryOwnerAll">查看自己所有的薪资结算</a>
            </div>
        </div>
    </div>
    <div id="bottomDiv"></div>
</div>
</body>
</html>
