<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019\8\27 0027
  Time: 16:52
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
    <title>换岗操作</title>
    <script src="js/jquery-1.7.2.js"></script>
    <link href="css/main.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script>
        var arr = new Array()
        var i = 0
        <c:forEach items="${requestScope.departs}" var="depart">
        var j = 0
        var a = '${depart.dep_name}'
        arr[i] = a
        arr[arr[i]] = new Array()
        <c:forEach items="${requestScope.positions}" var="position">
        <c:if test="${depart.dep_id == position.pos_dep_id}">
        var b = '${position.pos_name}'
        arr[arr[i]][j] = b
        j++
        </c:if>
        </c:forEach>
        if (arr[arr[i]].length == 0) {
            arr[arr[i]][0] = 'null'
        }
        i++
        </c:forEach>

        function init() {
            //给第一个select赋值，创建option
            createOption(arr, "dep");
            createOption(arr[arr[0]], "pos");
        }

        function createOption(array, id) {
            document.getElementById(id).innerHTML = "";
            for (var i = 0; i < array.length; i++) {
                var option = document.createElement("option");
                option.innerText = array[i];
                document.getElementById(id).appendChild(option);
            }
        }

        function changePos(value) {
            createOption(arr[value], "pos");
        }
    </script>
</head>
<body onload="init()">
<div id="mainDiv">


    <%@ include file="../../main/head.jsp" %>

    <div id="centerDiv">

        <%@ include file="../../main/left.jsp" %>


        <div id="right">
            <div id="current" align="center">&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size: 20px;font-weight: bold;">当前位置--->>>${title}</span>
            </div>
            <br/><br/>
            <div class="container" style="max-width: 1100px;">
                <div class="col-sm-2"></div>
                <div class="col-sm-8" style="margin-top: 20px">
                    <fieldset>
                        <legend>换岗</legend>
                        <form action="updatePos" method="post">
                            <input type="hidden" value="${requestScope.employee.e_id}" name="e_id">
                            <div class="col-sm-4">
                                选择部门：
                                <select id="dep" onchange="changePos(this.value)" required class="form-control">

                                </select>
                            </div>
                            <div class="col-sm-4">
                                选择职位：
                                <select id="pos" name="pos_name" required class="form-control">

                                </select>
                            </div>
                            <div class="col-sm-4">
                                &emsp;<input type="submit" value="确定更改" class="form-control btn btn-primary">
                                <a href="tohead">返回</a>
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
