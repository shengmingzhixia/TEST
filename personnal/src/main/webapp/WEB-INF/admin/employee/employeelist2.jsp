<%@ page import="cgy.model.Employee" %>
<%@ page import="cgy.model.Page" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019\8\27 0027
  Time: 13:38
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
    <title>员工管理界面</title>
    <script src="js/index.js"></script>
    <script src="js/jquery-1.7.2.js"></script>
    <link href="css/main.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script>
        function addReason(num) {
            document.getElementById("button1").style.display = "none"
            document.getElementById("button"+num).style.display = "block"
        }
    </script>
</head>
<body>
<div id="mainDiv">

    <%@ include file="../../main/head.jsp" %>

    <div id="centerDiv">

        <%@ include file="../../main/left.jsp" %>


        <div id="right">
            <%@ include file="../../main/clock.jsp" %>
            <br/><br/>
            <div>
                <form action="getEmployeeByName" method="post" novalidate="novalidate">
                    <table>
                        <tbody>
                        <tr>
                            <td>
                                <input type="text" name="e_name" maxlength="20">
                                <input type="submit" value="搜 索">
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </form>
                <div class="prod">
                    <div>
                        <table class="table table-striped">
                            <tr>
                                <th>员工工号</th>
                                <th>员工姓名</th>
                                <th>员工状态</th>
                                <th>性别</th>
                                <th colspan="6" style="text-align: center">操作</th>
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
                                    <td><a href="getEmployee?e_id=${employee.e_id}">查看基本信息</a></td>
                                    <c:choose>
                                        <c:when test="${employee.e_state==0}">
                                            <td></td>
                                        </c:when>
                                        <c:otherwise>
                                            <td><a href="toChangePosition?e_id=${employee.e_id}">换岗</a></td>
                                        </c:otherwise>
                                    </c:choose>
                                    <td><a href="getAttends?e_id=${employee.e_id}">查看考勤</a></td>
                                    <c:choose>
                                        <c:when test="${employee.e_state==2}">
                                            <td><a href="gertTrain?e_id=${employee.e_id}">查看培训记录</a></td>
                                            <td><a href="changestate?e_id=${employee.e_id}">转正</a></td>
                                            <td id="button1">
                                                <button onclick="addReason(${employee.e_id})">离职</button>
                                            </td>
                                            <td id="button${employee.e_id}" hidden style="position: relative;left: -500px">
                                                <form action="goAnywhere" method="post">
                                                    <input type="hidden" name="e_id" value="${employee.e_id}">
                                                    <textarea name="r_reason" placeholder="请填写离职理由"
                                                              class="form-control" required></textarea><br>
                                                    <input type="submit" value="确认">
                                                </form>
                                            </td>
                                        </c:when>
                                        <c:when test="${employee.e_state==1}">
                                            <td><a href="gertTrain?e_id=${employee.e_id}">查看培训记录</a></td>
                                            <td id="button1">
                                                <button onclick="addReason(${employee.e_id})">离职</button>
                                            </td>
                                            <td id="button${employee.e_id}" hidden style="position: relative;left: -500px">
                                                <form action="goAnywhere" method="post">
                                                    <input type="hidden" name="e_id" value="${employee.e_id}">
                                                    <textarea name="r_reason" placeholder="请填写离职理由"
                                                              class="form-control" required></textarea><br>
                                                    <input type="submit" value="确认">
                                                </form>
                                            </td>
                                            <td></td>
                                        </c:when>
                                        <c:otherwise>
                                            <td colspan="3"><a href="gertTrain?e_id=${employee.e_id}">查看培训记录</a></td>
                                        </c:otherwise>
                                    </c:choose>
                                </tr>
                            </c:forEach>
                            <%
                            } else {
                            %>
                            <tr>
                                <td colspan="9">没有数据</td>
                            </tr>
                            <%
                                }
                            %>
                        </table>
                    </div>
                </div>
            </div>
            <div class="div4" style="text-align: center">
                <span>共 <%=employeePage.getTotalPage()%> 页</span>
                <span>当前在第 <%=employeePage.getPageNo()%> 页</span>
                <span><a href="getEmployees?pageNo=1&e_pos_id=${requestScope.e_pos_id}">首页</a></span>
                <span><a href="getEmployees?pageNo=<%=employeePage.getPrevPage()%>&e_pos_id=${requestScope.e_pos_id}">上一页</a></span>
                <span><a href="getEmployees?pageNo=<%=employeePage.getNextPage()%>&e_pos_id=${requestScope.e_pos_id}">下一页</a></span>
                <span><a href="getEmployees?pageNo=<%=employeePage.getTotalPage()%>&e_pos_id=${requestScope.e_pos_id}">尾页</a></span>
                <form action="getEmployees"
                      onsubmit="return checkNum(this.children[2].value,<%=employeePage.getTotalPage()%>)">
                    <input type="hidden" name="e_pos_id" value="${requestScope.e_pos_id}">
                    <span>跳转到</span><input name="pageNo">
                    <input type="submit" value="跳转">
                </form>
            </div>
        </div>
    </div>
    <div id="bottomDiv"></div>
</div>
</body>
</html>
