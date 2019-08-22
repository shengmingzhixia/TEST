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
</head>
<%
    if (request.getAttribute("insertDepart") != null) {
        boolean insertDepart = (Boolean) request.getAttribute("insertDepart");
        if (insertDepart) {
%>
<script>
    alert("添加部门成功！")
</script>
<%
} else {
%>
<script>
    alert("添加部门失败！")
</script>
<%
        }
    }
%>
<%
    if (request.getAttribute("login") != null) {
        boolean login = (Boolean) request.getAttribute("login");
        if (login) {
%>
<script>
    alert("登录成功！")
</script>
<%
        }
    }
%>
<body>
管理员界面
</body>
</html>
