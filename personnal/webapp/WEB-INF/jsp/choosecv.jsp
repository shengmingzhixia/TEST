<%@ page import="cgy.model.Cv" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019\8\23 0023
  Time: 17:22
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
    <title>选择要投递的简历</title>
</head>
<body>
<%@ include file="../../head.jsp" %>
<%
    List<Cv> cvList = (List<Cv>) request.getAttribute("cvList");
    if (cvList == null || cvList.size() == 0) {
%>
<script>
    alert("你还没有一份简历，请先去创建！")
    top.location = "tocvadd"
</script>
<%
} else {
%>
<div>
    <form action="insertInterView" method="post">
        <input type="hidden" value="${requestScope.rct_id}" name="in_rct_id">
        <select name="in_cv_id">
            <c:forEach items="${requestScope.cvList}" var="cv">
                <option value="${cv.cv_id}">简历名称==》${cv.cv_title}</option>
            </c:forEach>
        </select>
        <input type="submit" value="提交简历">
    </form>
</div>
<%
    }
%>
</body>
</html>
