<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019\8\28 0028
  Time: 9:52
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
    <title>添加新的培训信息</title>
</head>
<body>
<form action="addtrain" method="post">
    <input type="text" name="t_title" placeholder="标题">
    <textarea placeholder="内容" name="t_context"></textarea>
    <br/>开始时间<input type="datetime-local" name="t_start_time">
    <br/>结束时间<input type="datetime-local" name="t_end_time">
    <input type="text" name="t_address" placeholder="地址">
    <input type="submit" value="提交">
</form>
</body>
</html>
