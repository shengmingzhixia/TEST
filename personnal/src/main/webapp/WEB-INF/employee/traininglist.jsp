<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019\8\29 0029
  Time: 9:45
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
    <title>员工查看培训记录</title>
    <link href="css/main.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdn.bootcss.com/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
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
                        <th>培训标题</th>
                        <th>培训内容</th>
                        <th>开始时间</th>
                        <th>结束时间</th>
                        <th>培训地点</th>
                    </tr>
                    <c:forEach items="${requestScope.trains}" var="train">
                        <tr>
                            <td>${train.t_title}</td>
                            <td>${train.t_context}</td>
                            <td><fmt:formatDate value="${train.t_start_time}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                            <td><fmt:formatDate value="${train.t_end_time}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                            <td>${train.t_address}</td>
                        </tr>
                    </c:forEach>
                    <c:if test="${requestScope.trains==null}">
                        <tr>
                            <td colspan="5">没有培训讯息</td>
                        </tr>
                    </c:if>
                </table>
            </div>
        </div>
    </div>
    <div id="bottomDiv"></div>
</div>
</body>
</html>
