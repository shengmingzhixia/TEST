<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019\8\23 0023
  Time: 15:38
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
    <title>详细简历</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/customer.css" type="text/css"/>
    <script src="js/jquery-1.7.2.js"></script>
</head>
<body>
<div class="head">
    <div class="head-main">
        <div class="head-menu">
            <div class="login" style="opacity: 0.8;">
                欢迎 ${sessionScope.customer.c_account} 来到海大同招聘！|
                <a href="logout">退出</a>
            </div>
            <ul id="menu">
                <li>
                    <a href="index.jsp">首&nbsp;&nbsp;页</a>
                </li>
                <li><a class="current-cat">社会招聘</a></li>
                <li><a href="https://job.alibaba.com/zhaopin/about.htm?spm=a2obv.11410903.0.0.5af844f6A10LlV">了解公司</a>
                </li>
                <li><a>联系我们</a></li>
                <li class="current-cat"><a>个人中心</a></li>
            </ul>
        </div>
        <a href="/" class="logo" style="text-align:right;width: 125px;">
            <img src="https://img.alicdn.com/tfs/TB1Zv8_lxSYBuNjSspjXXX73VXa-390-63.png" height="20"/>
        </a>
        <i style="float:left;color:white;font-style:normal;font-size:20px;line-height:52px;margin: 0 10px;opacity: 0.8;">|</i>
        <i style="float:left;color:white;font-style:normal;font-size:14px;line-height:54px;opacity: 0.8;">招聘官网</i>
    </div>
</div>
<div class="container" style="max-width: 1100px;margin-top: 5px;">
    <%--<div class="row">--%>
    <div class="col-sm-2">
        <div class="list-group side-bar">
            <a href="getRecruits" class="list-group-item active" id="addr" style="background-color:#2C2F33;color: #F3732A">查看招聘</a>
            <a href="getCv" class="list-group-item" style="background-color:#2C2F33;color: #F3732A">查看简历</a>
            <a href="getInter2" class="list-group-item" style="background-color:#2C2F33;color: #F3732A">我的投递</a>
        </div>
    </div>
    <div class="col-sm-10">
        <div>
            <table border="1" cellspacing="1" cellpadding="0">
                <tr>
                    <td>简历名称：</td>
                    <td>${requestScope.cv.cv_title}</td>
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
                    <td><textarea name="cv_exprience" maxlength="100" style="height: 90px;resize: none">${requestScope.cv.cv_exprience}</textarea></td>
                    <td>联系电话</td>
                    <td>${requestScope.cv.cv_phone}</td>
                </tr>
            </table>
        </div>
        <div>
            <a href="getCv">返回</a>
        </div>
    </div>
</div>
</body>
</html>
