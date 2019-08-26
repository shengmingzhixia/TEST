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
            if (arr[arr[i]] == null){
                arr[arr[i]][0] == '没有职位！'
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
<div>
    <table border="1" cellspacing="1" cellpadding="0">
        <form action="addRecruit" method="post">
            <tr>
                <td>选择部门</td>
                <td>
                    <select id="dep" onchange="changePos(this.value)"></select>
                </td>
                <td>选择职位</td>
                <td>
                    <select id="pos" name="rct_title" required></select>
                </td>
            </tr>
            <tr>
                <td>详情描述</td>
                <td><textarea name="rct_introduaction"></textarea></td>
                <td>招聘地址</td>
                <td><input type="text" name="rct_address"></td>
            </tr>
            <tr>
                <td>薪资待遇</td>
                <td><input type="text" name="rct_salary"></td>
            </tr>
            <tr><input type="submit" value="提交草稿"></tr>
        </form>
    </table>
</div>
</body>
</html>
