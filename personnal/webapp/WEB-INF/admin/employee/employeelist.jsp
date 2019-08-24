<%@ page import="cgy.model.Employee" %>
<%@ page import="cgy.model.Page" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019\8\24 0024
  Time: 15:46
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
    <title>员工展示界面</title>
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

<c:forEach items="${requestScope.employeePage.list}" var="employee">
    <div class="prod">
        <div>
            <table border="1" cellspacing="1" cellpadding="0">
                <tr>
                    <td>${employee.e_name}</td>
                    <td><a href="getEmployee?e_id=${employee.e_id}">查看</a></td>
                </tr>
            </table>
        </div>
    </div>
</c:forEach>
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
