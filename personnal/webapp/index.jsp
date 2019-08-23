<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="cgy.model.Recruit" %>
<%@ page import="cgy.model.Page" %>
<%@ page import="cgy.model.Customer" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019\8\22 0022
  Time: 15:23
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
    <title>海同招聘信息网</title>
    <script src="js/index.js"></script>
    <script src="js/jquery-1.7.2.js"></script>
</head>
<%
    if (request.getAttribute("touristLogin") != null) {
        boolean touristLogin = (Boolean) request.getAttribute("touristLogin");
        if (touristLogin) {
%>
<script>
    alert("登录成功！")
</script>
<%
} else {
%>
<script>
    alert("登录失败！")
</script>
<%
        }
    }
%>
<%
    if (request.getAttribute("view") != null) {
        boolean view = (Boolean) request.getAttribute("view");
        if (view) {
%>
<script>
    alert("投递成功！")
</script>
<%
} else {
%>
<script>
    alert("投递失败！")
</script>
<%
        }
    }
%>
<body>

<%@ include file="head.jsp" %>

<%
    Page<Recruit> recruitPage = (Page<Recruit>) request.getAttribute("recruitPage");
    int i = 0;
    if (recruitPage == null) {
%>
<script>
    top.location = "getRecruits";
</script>
<%
        return;
    }
    if (recruitPage != null && recruitPage.getList() != null &&
            recruitPage.getList().size() != 0) {
%>

<c:forEach items="${requestScope.recruitPage.list}" var="rct">
    <div class="prod">
        <div>
            <table border="1" cellspacing="1" cellpadding="0">
                <tr>
                    <td>招聘主题:</td>
                    <td>${rct.title}</td>
                </tr>
                <tr>
                    <td>招聘描述:</td>
                    <td>${rct.introduaction}</td>
                </tr>
                <tr>
                    <td>发布时间:</td>
                    <td><fmt:formatDate value="${rct.publishtime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                </tr>
                <tr>
                    <td>地址:</td>
                    <td>${rct.address}</td>
                </tr>
                <tr>
                    <td>薪资:</td>
                    <td>${rct.salary}</td>
                </tr>
            </table>
            <a href="toChooseCv?rctId=${rct.id}">去投简历！</a>
        </div>
    </div>
</c:forEach>
<%
} else {
%>
<div>没有招聘信息</div>
<%
    }
%>

</div>
<div class="div4">
    <span>共 <%=recruitPage.getTotalPage()%> 页</span>
    <span>当前在第 <%=recruitPage.getPageNo()%> 页</span>
    <span><a href="getRecruits?pageNo=1">首页</a></span>
    <span><a href="getRecruits?pageNo=<%=recruitPage.getPrevPage()%>">上一页</a></span>
    <span><a href="getRecruits?pageNo=<%=recruitPage.getNextPage()%>">下一页</a></span>
    <span><a href="getRecruits?pageNo=<%=recruitPage.getTotalPage()%>">尾页</a></span>
    <form action="getRecruits" onsubmit="return checkNum(this.children[1].value,<%=recruitPage.getTotalPage()%>)">
        <span>跳转到</span><input name="pageNo">
        <input type="submit" value="跳转">
    </form>
</div>
</body>
</html>
