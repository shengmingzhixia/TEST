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
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/customer.css" type="text/css"/>
    <script src="js/jquery-1.7.2.js"></script>
    <style>
        body {
            margin: 0;
            padding: 0;
        }

        td {
            width: 160px;
            height: 30px;
            font-size: 20px;
        }
    </style>
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
            <a href="tocvadd" class="list-group-item active"
               style="background-color:#2C2F33;color: #F3732A">新增简历</a>
            <a href="getRecruits" class="list-group-item active" id="addr"
               style="background-color:#2C2F33;color: #F3732A">查看招聘</a>
            <a href="getCv" class="list-group-item" style="background-color:#2C2F33;color: #F3732A">查看简历</a>
            <a href="getInter2" class="list-group-item" style="background-color:#2C2F33;color: #F3732A">我的投递</a>
        </div>
    </div>
    <div class="col-sm-10">
        <div style="text-align: center">
            <table border=1; cellpadding=12; cellspacing=0; align=center>
                <tr align=center>
                    <td colspan="5">${requestScope.cv.cv_title}</td>
                </tr>
                <tr align=center>
                    <td>姓名:</td>
                    <td>${requestScope.cv.cv_name}</td>
                    <td>性别:</td>
                    <td>${requestScope.cv.cv_gender}</td>
                    <td rowspan="7"><img src="" alt=""></td>
                </tr>
                <tr align=center>
                    <td>毕业院校:</td>
                    <td>${requestScope.cv.cv_school}</td>
                    <td>民族:</td>
                    <td>汉族</td>
                </tr>
                <tr align=center>
                    <td>最高学历:</td>
                    <td>${requestScope.cv.cv_education}</td>
                    <td>政治面貌:</td>
                    <td>共青团员</td>
                </tr>
                <tr align=center>
                    <td>专业:</td>
                    <td>${requestScope.cv.cv_major}</td>
                    <td>出生年月:</td>
                    <td><fmt:formatDate value="${requestScope.cv.cv_birth}" pattern="yyyy-MM-dd"/></td>
                </tr>
                <tr align=center>
                    <td>入学时间:</td>
                    <td><fmt:formatDate value="${requestScope.cv.cv_enroll_date}" pattern="yyyy-MM-dd"/></td>
                    <td>毕业时间:</td>
                    <td><fmt:formatDate value="${requestScope.cv.cv_graduation_date}" pattern="yyyy-MM-dd"/></td>
                </tr>
                <tr align=center>
                    <td>籍贯:</td>
                    <td>${requestScope.cv.cv_address}</td>
                    <td>手机号码:</td>
                    <td>${requestScope.cv.cv_phone}</td>
                </tr>
                <tr align=center>
                    <td>期望薪资：</td>
                    <td>${requestScope.cv.cv_salary}</td>
                    <td>期望行业</td>
                    <td>计算机软件</td>
                </tr>
                <tr align=center>
                    <td>通讯地址:</td>
                    <td colspan="4">${requestScope.cv.cv_phone}</td>
                </tr>
                <tr align=center>
                    <td>电子信箱:</td>
                    <td colspan="4">1461129779@qq.com</td>
                </tr>
                <tr align=center>
                    <td colspan="5">教育背景</td>
                </tr>
                <tr align=center>
                    <td colspan="5" style="height:100px">
                        ${requestScope.cv.cv_school} ${requestScope.cv.cv_major} <fmt:formatDate
                            value="${requestScope.cv.cv_enroll_date}" pattern="yyyy-MM-dd"/>~<fmt:formatDate
                            value="${requestScope.cv.cv_graduation_date}" pattern="yyyy-MM-dd"/>
                            <br><br>某高中 物化班 2011-09-01~2014-06-09
                    </td>
                </tr>
                <tr align=center>
                    <td colspan="5">专业课程</td>
                </tr>
                <tr>
                    <td colspan="5" style="height:100px">
                        软件工程学&nbsp;&nbsp;&nbsp;&nbsp;计算机网络&nbsp;&nbsp;&nbsp;&nbsp;软件设计<br>
                        中间件结构&nbsp;&nbsp;&nbsp;&nbsp;操作系统&nbsp;&nbsp;&nbsp;&nbsp;软件概述
                    </td>
                </tr>
                <tr align=center>
                    <td colspan="5">主要技能</td>
                </tr>
                <tr>
                    <td colspan="5" style="height:100px">
                        (1)Java<br>
                        (2).net<br>
                        (3)Spring
                    </td>
                </tr>
                <tr align=center>
                    <td colspan="5">项目经验</td>
                </tr>
                <tr>
                    <td colspan="5" style="height:100px">${requestScope.cv.cv_exprience}</td>
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
