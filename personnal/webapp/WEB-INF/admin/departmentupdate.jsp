<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019\8\24 0024
  Time: 10:07
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
    <title>更新部门信息</title>
    <script src="js/jquery-1.7.2.js"></script>
    <script>
        $(function () {
            $("input[name=dep_name]").blur(function () {
                $.post("checkDepName", {dep_name: $("input:eq(0)").val()}, function (obj) {
                    $("#sub1").removeAttr("disabled");
                    $("#span1").remove();
                    if ("部门名重复！" == obj) {
                        $("input:eq(0)").after("<span id='span1'>" + obj + "</span>");
                        $("#sub1").attr("disabled", true);
                    }
                })
            })
        })
    </script>
</head>
<body>
<%@ include file="head.jsp" %>
<table>
    <tr>请输入部门名称</tr>
    <tr>
        <form action="updateDepart" method="post">
            <input type="text" name="dep_name" value="${requestScope.department.dep_name}">
            <input type="hidden" value="${requestScope.department.dep_id}" name="dep_id">
            <input type="submit" value="提交" id="sub1">
        </form>
    </tr>
</table>
</body>
</html>
