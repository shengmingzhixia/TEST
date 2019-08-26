<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019\8\24 0024
  Time: 17:05
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
    <title>添加职位</title>
    <script src="js/jquery-1.7.2.js"></script>
    <script>
        $(function () {
            $("input[name=pos_name]").blur(function () {
                $.post("checkPosName", {pos_name: $("input:eq(0)").val()}, function (obj) {
                    $("#sub1").removeAttr("disabled");
                    $("#span1").remove();
                    if ("职位名重复！" == obj) {
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
    <tr>请输入职位名称</tr>
    <tr>
        <form action="addPosition" method="post">
            <input type="text" name="pos_name" >
            <input type="hidden" value="${requestScope.dep_id}" name="pos_dep_id">
            <input type="submit" value="提交" id="sub1">
        </form>
    </tr>
</table>
</body>
</html>