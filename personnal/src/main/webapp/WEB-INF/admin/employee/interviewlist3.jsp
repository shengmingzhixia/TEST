<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="cgy.model.InterView2" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019\8\25 0025
  Time: 12:41
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
    <title>查看面试</title>
    <link href="css/main.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
<div id="mainDiv">

    <%@ include file="../../main/head.jsp" %>

    <div id="centerDiv">

        <%@ include file="../../main/left.jsp" %>


        <div id="right">
            <%@ include file="../../main/clock.jsp" %>
            <br/><br/>
            <div class="prod">
                <div>
                    <table class="table table-striped">
                        <tr>
                            <th>投递简历</th>
                            <th>投递岗位</th>
                            <th>面试时间</th>
                            <th>操作</th>
                        </tr>
                        <%
                            List<InterView2> interViews = (List<InterView2>) request.getAttribute("list");
                            if (interViews != null && interViews.size() != 0) {
                        %>
                        <c:forEach items="${requestScope.list}" var="inter">
                            <tr>
                                <td>${inter.in_cv_title}</td>
                                <td>${inter.in_rct_name}</td>
                                <td>
                                    <fmt:formatDate value="${inter.in_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                </td>
                                <td>
                                    <a href="sendInterView3?in_is_accept=2&in_id=${inter.in_id}">面试</a>
                                </td>
                            </tr>
                        </c:forEach>
                        <%
                        } else {
                        %>
                       <tr>
                           <td colspan="4">没有数据</td>
                       </tr>
                        <%
                            }
                        %>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div id="bottomDiv"></div>
</div>
</body>
</html>
