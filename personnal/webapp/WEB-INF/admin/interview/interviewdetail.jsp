<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019\8\25 0025
  Time: 11:02
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
    <title>简历详情(管理员)</title>
    <script src="js/jquery-1.7.2.js"></script>
</head>
<body>
<%@ include file="../head.jsp" %>
<table border="1" cellspacing="1" cellpadding="0">
    <tr>
        <td>简历名称：</td>
        <td>${requestScope.cv.cv_title}</td>
        <td>面试职位</td>
        <td>${requestScope.interView2.in_rct_name}</td>
    </tr>
    <tr>
        <td>真实姓名</td>
        <td>${requestScope.cv.cv_name}</td>
        <td>性别</td>
        <td>${requestScope.cv.cv_gender}</td>
    </tr>
    <tr>
        <td>出生日期</td>
        <td><fmt:formatDate value="${requestScope.cv.cv_birth}" pattern="yyyy-MM-dd"/></td>
        <td>家庭住址</td>
        <td>${requestScope.cv.cv_address}</td>
    </tr>
    <tr>
        <td>毕业院校</td>
        <td>${requestScope.cv.cv_school}</td>
        <td>学历</td>
        <td>${requestScope.cv.cv_education}</td>
    </tr>
    <tr>
        <td>专业</td>
        <td>${requestScope.cv.cv_major}</td>
        <td>入学时间</td>
        <td><fmt:formatDate value="${requestScope.cv.cv_enroll_date}" pattern="yyyy-MM-dd"/></td>
    </tr>
    <tr>
        <td>毕业时间</td>
        <td><fmt:formatDate value="${requestScope.cv.cv_graduation_date}" pattern="yyyy-MM-dd"/></td>
        <td>期望薪资</td>
        <td>${requestScope.cv.cv_salary}</td>
    </tr>
    <tr>
        <td>工作经验</td>
        <td>${requestScope.cv.cv_exprience}</td>
        <td>联系电话</td>
        <td>${requestScope.cv.cv_phone}</td>
    </tr>
</table>
<c:if test="${requestScope.interView2.in_is_accept==2}">
    <form action="sendInterView4" method="post">
        <input type="hidden" value="${requestScope.interView2.in_id}" name="in_id">
        录用：<input type="radio" value="3" name="in_is_accept"><br>
        不录用：<input type="radio" value="4" name="in_is_accept">
        <input type="submit" value="提交">
    </form>
    <script>
        $(function () {
            $("#action1").attr("hidden", true)
        })
    </script>
</c:if>
<c:if test="${requestScope.interView2.in_is_accept==0}">
    <form action="sendInterView" method="post" id="action1">
        <input type="hidden" value="${requestScope.interView2.in_id}" name="in_id">
        <input type="datetime-local" name="in_date">
        <input type="submit" value="邀请面试">
    </form>
</c:if>
<a href="javascript:history.go(-1)">返回</a>
</body>
</html>
