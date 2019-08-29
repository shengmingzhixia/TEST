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
    <title>奖惩管理界面</title>
    <script src="js/jquery-1.7.2.js"></script>
    <link href="css/main.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div id="mainDiv">

    <%@ include file="../../main/head.jsp" %>

    <div id="centerDiv">

        <%@ include file="../../main/left.jsp" %>


        <div id="right">
            <div id="current" align="center">&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size: 20px;font-weight: bold;">当前位置--->>>${title}</span>
            </div>
            <br/><br/>
            <div>
                <form action="getRewards" method="post" novalidate="novalidate">
                    <table>
                        <tbody>
                        <tr>
                            <td>
                                <input type="text" name="e_name" maxlength="20" placeholder="按姓名查找">
                                <input type="date" name="r_date">
                                <input type="submit" value="搜 索">
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </form>
            </div>
            <%
                List<Reward> list = (List<Reward>) request.getAttribute("rewards");
                if (list != null && list.size() != 0) {
            %>
            <div>
                <div class="prod">
                    <div>
                        <table border="1" cellspacing="1" cellpadding="0">
                            <tr>
                                <td>员工工号</td>
                                <td>员工姓名</td>
                                <td>奖惩日期</td>
                                <td>奖惩理由</td>
                                <td>奖惩金额</td>
                            </tr>
                            <c:forEach items="${requestScope.rewards}" var="reward">
                                <tr>
                                    <c:forEach items="${requestScope.list}" var="employee">
                                        <c:if test="${employee.e_id==reward.r_e_id}">
                                            <td>${employee.e_account}</td>
                                            <td>${employee.e_name}</td>
                                        </c:if>
                                    </c:forEach>
                                    <td><fmt:formatDate value="${reward.r_date}"
                                                        pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                    <td>${reward.r_reason}</td>
                                    <td>${reward.r_money}</td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>
                <%
                } else {
                %>
                <div>没有信息</div>
                <%
                    }
                %>

            </div>
        </div>
    </div>
    <div id="bottomDiv"></div>
</div>
</body>
</html>
