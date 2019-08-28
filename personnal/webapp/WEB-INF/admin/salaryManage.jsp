<%@ page import="cgy.model.Page" %>
<%@ page import="cgy.model.Salary2" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019\8\28 0028
  Time: 13:08
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
    <title>薪资结算界面</title>
    <%
        if (request.getAttribute("insertSalarys") != null) {
            boolean insertSalarys = (Boolean) request.getAttribute("insertSalarys");
            if (insertSalarys) {
    %>
    <script>
        alert("结算成功！")
    </script>
    <%
    } else {
    %>
    <script>
        alert("今天不是结算日子或已经结算！")
    </script>
    <%
            }
        }
    %>
</head>
<body>
<button><a href="insertAllSalary">一键结算</a></button>
<%
    Page<Salary2> salaryPage = (Page<Salary2>) request.getAttribute("salaryPage");
    if (salaryPage == null) {
%>
<script>
    top.location = "getSalarys";
</script>
<%
        return;
    }
    if (salaryPage != null && salaryPage.getList() != null &&
            salaryPage.getList().size() != 0) {
%>
<div class="prod">
    <div>
        <table border="1" cellspacing="1" cellpadding="0">
            <tr>
                <td>员工姓名</td>
                <td>结算日期</td>
                <td>基本工资</td>
                <td>加班费用</td>
                <td>奖惩费用</td>
                <td>社保</td>
                <td>你的薪水</td>
                <td>复议</td>
            </tr>
            <c:forEach items="${requestScope.salaryPage.list}" var="salary">
                <tr>
                    <td>${salary.s_e_name}</td>
                    <td><fmt:formatDate value="${salary.s_date}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    <td>${salary.s_performance}</td>
                    <td>${salary.s_extra}</td>
                    <td>${salary.s_reward}</td>
                    <td>${salary.s_insurance}</td>
                    <td>${salary.s_total}</td>
                    <td><a>对此疑问</a></td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
<%
} else {
%>
<div>null</div>
<%
    }
%>

</div>
<div class="div4">
    <span>共 <%=salaryPage.getTotalPage()%> 页</span>
    <span>当前在第 <%=salaryPage.getPageNo()%> 页</span>
    <span><a href="getSalarys?pageNo=1">首页</a></span>
    <span><a href="getSalarys?pageNo=<%=salaryPage.getPrevPage()%>">上一页</a></span>
    <span><a href="getSalarys?pageNo=<%=salaryPage.getNextPage()%>">下一页</a></span>
    <span><a href="getSalarys?pageNo=<%=salaryPage.getTotalPage()%>">尾页</a></span>
    <form action="getSalarys" onsubmit="return checkNum(this.children[1].value,<%=salaryPage.getTotalPage()%>)">
        <span>跳转到</span><input name="pageNo">
        <input type="submit" value="跳转">
    </form>
</div>
</body>
</html>
