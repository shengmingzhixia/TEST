<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.List" %>
<%@ page import="cgy.model.InterView2" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019\8\25 0025
  Time: 11:51
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
    <title>查看面试信息</title>
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
            <a href="tocvadd" class="list-group-item active"
               style="background-color:#2C2F33;color: #F3732A">新增简历</a>
            <a href="getRecruits" class="list-group-item active" id="addr"
               style="background-color:#2C2F33;color: #F3732A">查看招聘</a>
            <a href="getCv" class="list-group-item" style="background-color:#2C2F33;color: #F3732A">查看简历</a>
            <a href="getInter2" class="list-group-item" style="background-color:#2C2F33;color: #F3732A">我的投递</a>
        </div>
    </div>
    <div class="col-sm-8" style="margin-top: 20px">

        <%
            List<InterView2> interViews = (List<InterView2>) request.getAttribute("interViews");
            if (interViews != null && interViews.size() != 0) {
        %>
        <fieldset>
            <legend>查看部门</legend>
            <table class="table table-striped">
                <tr>
                    <th>投递简历</th>
                    <th>投递岗位</th>
                    <th>投递面试时间</th>
                    <th>查看状态</th>
                    <th>面试状态</th>
                    <th>面试情况</th>
                    <th colspan="2" style="text-align: center">操作</th>
                </tr>
                <c:forEach items="${requestScope.interViews}" var="inter">
                    <tr>
                        <td>${inter.in_cv_title}</td>
                        <td>${inter.in_rct_name}</td>
                        <td>
                            <fmt:formatDate value="${inter.in_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
                        </td>
                        <c:if test="${inter.in_is_read==0}">
                            <td>未读</td>
                        </c:if>
                        <c:if test="${inter.in_is_read==1}">
                            <td>已读</td>
                        </c:if>
                        <c:if test="${inter.in_is_accept==0}">
                            <td>未邀请</td>
                        </c:if>
                        <c:if test="${inter.in_is_accept==1}">
                            <td>已邀请</td>
                        </c:if>
                        <c:if test="${inter.in_is_accept==2}">
                            <td>完成面试</td>
                        </c:if>
                        <c:if test="${inter.in_is_accept==3}">
                            <td>已被录用</td>
                        </c:if>
                        <c:if test="${inter.in_is_accept==4}">
                            <td>已拒绝</td>
                        </c:if>
                        <c:if test="${inter.in_is_accept==5}">
                            <td>已经同意入职</td>
                        </c:if>
                        <c:if test="${inter.in_is_agree==0}">
                            <td>未反馈</td>
                        </c:if>
                        <c:if test="${inter.in_is_agree==1}">
                            <td>已同意</td>
                        </c:if>
                        <c:if test="${inter.in_is_agree==2}">
                            <td>已拒绝</td>
                        </c:if>
                        <c:if test="${inter.in_is_agree==0 && inter.in_is_accept==1}">
                            <td><a href="sendInterView2?in_is_agree=1&in_id=${inter.in_id}">同意</a></td>
                            <td><a href="sendInterView2?in_is_agree=2&in_id=${inter.in_id}">拒绝</a></td>
                        </c:if>
                        <c:if test="${inter.in_is_accept==3}">
                            <td>
                                <a href="addnewemployee?cv_id=${inter.in_cv_id}&in_rct_id=${inter.in_rct_id}&in_id=${inter.in_id}">同意入职</a>
                            </td>
                            <td><a href="sendInterView5?in_is_accept=4&in_id=${inter.in_id}">拒绝入职</a></td>
                        </c:if>
                    </tr>
                </c:forEach>
            </table>
        </fieldset>
        <%
            }
        %>
    </div>
</div>
</body>
</html>
