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
<div>
    <button onclick="">应聘管理</button>
    <button onclick="">部门职位</button>
    <button onclick="">培训管理</button>
    <button onclick="">员工管理</button>
    <button onclick="">奖惩管理</button>
    <button onclick="">薪资管理</button>
    <button onclick="">工资异议</button>
    <button onclick="">退出</button>
</div>
</body>
</html>
