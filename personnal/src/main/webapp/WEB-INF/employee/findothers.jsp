<%@ page import="cgy.model.Employee" %>
<%@ page import="cgy.model.Page" %>
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
    <title>查询其他职员信息</title>
    <script src="js/index.js"></script>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-1.7.2.js"></script>
    <link href="css/main.css" rel="stylesheet" type="text/css"/>
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
                        <legend>查询</legend>
                        <form action="findothers" method="post">
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
                                &emsp;<input type="submit" value="搜索" class="form-control btn btn-primary">
                            </div>
                        </form>
                    </fieldset>
                </div>
            </div>
            <div class="prod">
                <div>
                    <table class="table table-striped">
                        <tr>
                            <th>员工工号</th>
                            <th>员工姓名</th>
                            <th>员工状态</th>
                            <th>性别</th>
                            <th>职位</th>
                            <th>操作</th>
                        </tr>
                        <%
                            Page<Employee> employeePage = (Page<Employee>) request.getAttribute("employeePage");
                            if (employeePage != null && employeePage.getList() != null &&
                                    employeePage.getList().size() != 0) {
                        %>
                        <c:forEach items="${requestScope.employeePage.list}" var="employee">
                            <tr>
                                <td>${employee.e_account}</td>
                                <td>${employee.e_name}</td>
                                <c:if test="${employee.e_state==2}">
                                    <td>试用期</td>
                                </c:if>
                                <c:if test="${employee.e_state==1}">
                                    <td>在职</td>
                                </c:if>
                                <c:if test="${employee.e_state==0}">
                                    <td>离职</td>
                                </c:if>
                                <td>${employee.e_gender}</td>
                                <td>${requestScope.pos_name}</td>
                                <td><a href="getEmployee?e_id=${employee.e_id}">查看</a></td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
        <div class="div4" style="text-align: center">
            <span>共 <%=employeePage.getTotalPage()%> 页</span>
            <span>当前在第 <%=employeePage.getPageNo()%> 页</span>
            <span><a href="getEmployees?pageNo=1&e_pos_id=${requestScope.e_pos_id}">首页</a></span>
            <span><a
                    href="getEmployees?pageNo=<%=employeePage.getPrevPage()%>&e_pos_id=${requestScope.e_pos_id}">上一页</a></span>
            <span><a
                    href="getEmployees?pageNo=<%=employeePage.getNextPage()%>&e_pos_id=${requestScope.e_pos_id}">下一页</a></span>
            <span><a
                    href="getEmployees?pageNo=<%=employeePage.getTotalPage()%>&e_pos_id=${requestScope.e_pos_id}">尾页</a></span>
            <form action="getEmployees"
                  onsubmit="return checkNum(this.children[2].value,<%=employeePage.getTotalPage()%>)">
                <input type="hidden" name="e_pos_id" value="${requestScope.e_pos_id}">
                <span>跳转到</span><input name="pageNo">
                <input type="submit" value="跳转">
            </form>
        </div>
        <%
            }
        %>
    </div>
    <div id="bottomDiv"></div>
</div>
</body>
</html>
