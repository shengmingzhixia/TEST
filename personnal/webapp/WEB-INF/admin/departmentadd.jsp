<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019\8\22 0022
  Time: 15:59
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
    <title>$</title>
    <script src="js/jquery-1.7.2.js"></script>
</head>
<body>
<%@ include file="head.jsp" %>
<table>
    <tr>请输入部门名称</tr>
    <tr>
        <form action="insertDepart" method="post">
            <input type="text" name="dep_name">
            <input type="submit" value="提交">
        </form>
    </tr>
</table>
</body>
</html>
