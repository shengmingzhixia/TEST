<%@ page import="cgy.model.Department" %>
<%@ page import="cgy.model.Page" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019\8\22 0022
  Time: 22:26
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
    <title>部门显示</title>
    <link rel="stylesheet" type="text/css" href="css/index.css">
    <script src="js/index.js"></script>
    <script src="js/jquery-1.7.2.js"></script>
</head>
<body>
<%@ include file="head.jsp" %>
<%
    Page<Department> departmentPage = (Page<Department>) request.getAttribute("departmentPage");
    int i = 0;
    if (departmentPage == null) {
%>
<script>
    top.location = "getDepart";
</script>
<%
        return;
    }
    if (departmentPage != null && departmentPage.getList() != null &&
            departmentPage.getList().size() != 0) {
%>
部门名称
<c:forEach items="${requestScope.departmentPage.list}"  var="depart">
    <a href="#&dep_id=${depart.id}">${depart.name}</a>
</c:forEach>
<%
} else {
%>
<div>没有商品</div>
<%
    }
%>

</div>
<div class="div4">
    <span>共 <%=departmentPage.getTotalPage()%> 页</span>
    <span>当前在第 <%=departmentPage.getPageNo()%> 页</span>
    <span><a href="getDepart?pageNo=1">首页</a></span>
    <span><a href="getDepart?pageNo=<%=departmentPage.getPrevPage()%>">上一页</a></span>
    <span><a href="getDepart?pageNo=<%=departmentPage.getNextPage()%>">下一页</a></span>
    <span><a href="getDepart?pageNo=<%=departmentPage.getTotalPage()%>">尾页</a></span>
    <form action="getDepart" onsubmit="return checkNum(this.children[1].value,<%=departmentPage.getTotalPage()%>)">
        <span>跳转到</span><input name="pageNo">
        <input type="submit" value="跳转">
    </form>
</div>
</body>
</html>
