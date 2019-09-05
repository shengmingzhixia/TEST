<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019\8\26 0026
  Time: 10:19
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
    <title>添加一个招聘信息</title>
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
            <%@ include file="../../main/clock.jsp" %>
            <br/><br/>
            <div class="col-sm-10">
                <legend>添加招聘信息</legend>
                <form action="addRecruit" method="post">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label>选&emsp;择&emsp;部&emsp;门：</label>
                            <select id="dep" onchange="changePos(this.value)" required class="form-control">
                            </select>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label>选&emsp;择&emsp;职&emsp;位：</label>
                            <select id="pos" name="rct_title" required class="form-control">
                            </select>
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="form-group">
                            <label>详&emsp;情&emsp;描&emsp;述：</label>
                            <textarea name="rct_introduaction" required class="form-control" maxlength="100"
                                      style="height: 90px;resize: none"></textarea>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label>招&emsp;聘&emsp;地&emsp;址：</label>
                            <input type="text" name="rct_address" required class="form-control">
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label>薪&emsp;资&emsp;待&emsp;遇：</label>
                            <input type="text" name="rct_salary" required class="form-control">
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="form-group">
                            &emsp;<input type="submit" value="提交草稿" class="form-control btn btn-primary">
                        </div>
                    </div>
                </form>

            </div>
        </div>
    </div>
    <div id="bottomDiv"></div>
</div>
</body>
</html>
