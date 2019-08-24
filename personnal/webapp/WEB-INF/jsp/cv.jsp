<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="cgy.model.Cv" %>
<%@ page import="cgy.model.Page" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019\8\23 0023
  Time: 13:04
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
    <title>简历仓库</title>
</head>
<%
    if (request.getAttribute("addCv") != null) {
        boolean addCv = (Boolean) request.getAttribute("addCv");
        if (addCv) {
%>
<script>
    alert("新增成功！")
</script>
<%
} else {
%>
<script>
    alert("新增失败！")
</script>
<%
        }
    }
%>
<%
    if (request.getAttribute("updateCv") != null) {
        boolean updateCv = (Boolean) request.getAttribute("updateCv");
        if (updateCv) {
%>
<script>
    alert("更新成功！")
</script>
<%
} else {
%>
<script>
    alert("更新失败！")
</script>
<%
        }
    }
%>
<%
    if (request.getAttribute("cvDelete") != null) {
        boolean cvDelete = (Boolean) request.getAttribute("cvDelete");
        if (cvDelete) {
%>
<script>
    alert("删除成功！")
</script>
<%
} else {
%>
<script>
    alert("删除失败！")
</script>
<%
        }
    }
%>
<body>
<%
    Page<Cv> cvByPage = (Page<Cv>) request.getAttribute("cvByPage");
    if (cvByPage != null && cvByPage.getList() != null &&
            cvByPage.getList().size() != 0) {
%>

<c:forEach items="${requestScope.cvByPage.list}" var="cv">
    <div class="prod">
        <div>
            <a href="cvdetail?id=${cv.cv_id}">简历==>${cv.cv_title}</a>
            <a href="toCvUpdate?id=${cv.cv_id}">修改</a>
            <a href="cvDelete?id=${cv.cv_id}">删除</a>
        </div>
    </div>
</c:forEach>
<%
} else {
%>
<div>没有简历 去<a href="tocvadd">添加</a>一个简历吧！</div>
<%
    }
%>
<a href="tocvadd">添加</a>一个简历
</div>
<div class="div4">
    <span>共 <%=cvByPage.getTotalPage()%> 页</span>
    <span>当前在第 <%=cvByPage.getPageNo()%> 页</span>
    <span><a href="GetCv?pageNo=1">首页</a></span>
    <span><a href="GetCv?pageNo=<%=cvByPage.getPrevPage()%>">上一页</a></span>
    <span><a href="GetCv?pageNo=<%=cvByPage.getNextPage()%>">下一页</a></span>
    <span><a href="GetCv?pageNo=<%=cvByPage.getTotalPage()%>">尾页</a></span>
    <form action="GetCv" onsubmit="return checkNum(this.children[1].value,<%=cvByPage.getTotalPage()%>)">
        <span>跳转到</span><input name="pageNo">
        <input type="submit" value="跳转">
    </form>
</div>
</body>
</html>
