<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019\8\25 0025
  Time: 14:03
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
    <title>员工界面</title>
    <script language="javascript" src="jquery.js"></script>
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

        </div>
    </div>
    <div id="bottomDiv"></div>
</div>
</body>
</html>
