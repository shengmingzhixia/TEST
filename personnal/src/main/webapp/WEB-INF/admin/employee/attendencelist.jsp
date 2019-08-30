<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="cgy.model.Attendence" %><%--
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
    <title>考勤管理界面</title>
    <script src="js/jquery-1.7.2.js"></script>
    <link href="css/main.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="css/bootstrap.min.css">
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
                <form action="getAttends" method="post" novalidate="novalidate">
                    <table>
                        <tbody>
                        <tr>
                            <td>
                                <input type="text" name="e_name" maxlength="20" placeholder="按姓名查找">
                                <input type="date" name="date">
                                <input type="submit" value="搜 索">
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </form>
            </div>
            <%
                List<Attendence> list = (List<Attendence>) request.getAttribute("list");
                if (list != null && list.size() != 0) {
            %>
            <div>
                <div class="prod">
                    <div>
                        <table class="table table-striped">
                            <tr>
                                <th>员工工号</th>
                                <th>员工姓名</th>
                                <th>上班打卡</th>
                                <th>下班打卡</th>
                            </tr>
                            <c:forEach items="${requestScope.list}" var="attendence">
                                <tr>
                                    <c:forEach items="${requestScope.employees}" var="employee">
                                        <c:if test="${employee.e_id==attendence.atd_e_id}">
                                            <td>${employee.e_account}</td>
                                            <td>${employee.e_name}</td>
                                            <td><fmt:formatDate value="${attendence.atd_start_time}"
                                                                pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                            <td><fmt:formatDate value="${attendence.atd_end_time}"
                                                                pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                        </c:if>
                                    </c:forEach>
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
