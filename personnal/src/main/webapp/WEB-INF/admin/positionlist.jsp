<%@ page import="cgy.model.Position" %>
<%@ page import="cgy.model.Page" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019\8\24 0024
  Time: 14:02
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
    <title>职位信息</title>
    <script src="js/index.js"></script>
    <script src="js/jquery-1.7.2.js"></script>
    <link href="css/main.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div id="mainDiv">

    <%@ include file="../main/head.jsp" %>

    <div id="centerDiv">

        <%@ include file="../main/left.jsp" %>


        <div id="right">
            <%@ include file="../main/clock.jsp" %>
            <br/><br/>
            <%@ include file="positionlistbody.jsp" %>
        </div>
    </div>
    <div id="bottomDiv"></div>
</div>
</body>
</html>
