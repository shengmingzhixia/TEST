<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link href="css/main.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="css/bootstrap.min.css">
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
<div id="mainDiv">

    <%@ include file="../main/head.jsp" %>

    <div id="centerDiv">

        <%@ include file="../main/left.jsp" %>


        <div id="right">
            <%@ include file="../main/clock.jsp" %>
            <br/><br/>
            <div class="container" style="max-width: 1100px;">
                <div class="col-sm-2"></div>
                <div class="col-sm-8" style="margin-top: 20px">
                    <fieldset>
                        <legend>新增职位</legend>
                        <form action="addPosition" method="post">
                            <div class="col-sm-4">
                                选择部门：
                                <select name="pos_dep_id" class="form-control">
                                    <c:forEach items="${requestScope.departments}" var="department">
                                        <option value=${department.dep_id}>${department.dep_name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-sm-4">
                                请输入职位名：<input type="text" name="pos_name" required class="form-control" maxlength="55">
                            </div>
                            <div class="col-sm-4">
                                &emsp;<input type="submit" value="提交" id="sub1" class="form-control btn btn-primary">
                            </div>
                        </form>
                    </fieldset>
                </div>
            </div>
        </div>
    </div>
    <div id="bottomDiv"></div>
</div>
</body>
</html>
