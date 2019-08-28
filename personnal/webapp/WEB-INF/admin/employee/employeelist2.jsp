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
</head>
<body>
<%@ include file="../head.jsp" %>
<%
    Page<Employee> employeePage = (Page<Employee>) request.getAttribute("employeePage");
    if (employeePage != null && employeePage.getList() != null &&
            employeePage.getList().size() != 0) {
%>
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
        <table border="1" cellspacing="1" cellpadding="0">
            <tr>
                <td>员工工号</td>
                <td>员工姓名</td>
                <td>员工状态</td>
                <td>性别</td>
                <td colspan="4" style="text-align: center">操作</td>
            </tr>
            <c:forEach items="${requestScope.employeePage.list}" var="employee">
                <tr>
                    <td>${employee.e_account}</td>
                    <td>${employee.e_name}</td>
                    <c:if test="${employee.e_state==1}">
                        <td>在职</td>
                    </c:if>
                    <c:if test="${employee.e_state==0}">
                        <td>离职</td>
                    </c:if>
                    <td>${employee.e_gender}</td>
                    <td><a href="getEmployee?e_id=${employee.e_id}">查看基本信息</a></td>
                    <td><a href="toChangePosition?e_id=${employee.e_id}">换岗</a></td>
                    <td><a href="#?e_id=${employee.e_id}">查看考勤</a></td>
                    <td><a href="#?e_id=${employee.e_id}">查看培训记录</a></td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
<%
} else {
%>
<div>没有信息</div>
<%
    }
%>

</div>
<div class="div4">
    <span>共 <%=employeePage.getTotalPage()%> 页</span>
    <span>当前在第 <%=employeePage.getPageNo()%> 页</span>
    <span><a href="getEmployees?pageNo=1&e_pos_id=${requestScope.e_pos_id}">首页</a></span>
    <span><a href="getEmployees?pageNo=<%=employeePage.getPrevPage()%>&e_pos_id=${requestScope.e_pos_id}">上一页</a></span>
    <span><a href="getEmployees?pageNo=<%=employeePage.getNextPage()%>&e_pos_id=${requestScope.e_pos_id}">下一页</a></span>
    <span><a href="getEmployees?pageNo=<%=employeePage.getTotalPage()%>&e_pos_id=${requestScope.e_pos_id}">尾页</a></span>
    <form action="getEmployees" onsubmit="return checkNum(this.children[2].value,<%=employeePage.getTotalPage()%>)">
        <input type="hidden" name="e_pos_id" value="${requestScope.e_pos_id}">
        <span>跳转到</span><input name="pageNo">
        <input type="submit" value="跳转">
    </form>
</div>
</body>
</html>
