<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="cgy.model.Reward" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019\8\27 0027
  Time: 13:38
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
    <title>个人奖惩查看界面</title>
    <script src="js/jquery-1.7.2.js"></script>
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
                <form action="getRewards2" method="post" novalidate="novalidate">
                    <table>
                        <tbody>
                        <tr>
                            <td>
                                <input type="date" name="r_date">
                                <input type="submit" value="搜 索">
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </form>
            </div>
            <div>
                <div class="prod">
                    <div>
                        <table class="table table-striped">
                            <tr>
                                <th>员工工号</th>
                                <th>员工姓名</th>
                                <th>奖惩日期</th>
                                <th>奖惩理由</th>
                                <th>奖惩金额</th>
                            </tr>
                            <%
                                List<Reward> list = (List<Reward>) request.getAttribute("rewards");
                                if (list != null && list.size() != 0) {
                            %>
                            <c:forEach items="${requestScope.rewards}" var="reward">
                                <tr>

                                    <td>${sessionScope.employeeNow.e_account}</td>
                                    <td>${sessionScope.employeeNow.e_name}</td>
                                    <td><fmt:formatDate value="${reward.r_date}"
                                                        pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                    <td>${reward.r_reason}</td>
                                    <td>${reward.r_money}</td>
                                </tr>
                            </c:forEach>
                        </table>
                        <%
                        } else {
                        %>
                        <tr>
                            <td colspan="5">没有信息</td>
                        </tr>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="bottomDiv"></div>
</div>
</body>
</html>
