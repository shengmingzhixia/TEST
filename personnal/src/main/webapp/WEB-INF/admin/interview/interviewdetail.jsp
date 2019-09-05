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
    <link href="css/main.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="css/bootstrap.min.css">
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
<div id="mainDiv">

    <%@ include file="../../main/head.jsp" %>

    <div id="centerDiv">

        <%@ include file="../../main/left.jsp" %>


        <div id="right">
            <%@ include file="../../main/clock.jsp" %>
            <br/><br/>
            <div style="text-align: center;margin-left: 200px">
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
                        <td>面试职位</td>
                        <td>${requestScope.interView2.in_rct_name}</td>
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
                <c:if test="${requestScope.interView2.in_is_accept==2}">
                    <form action="sendInterView4" method="post">
                        <input type="hidden" value="${requestScope.interView2.in_id}" name="in_id">

                        <select name="in_is_accept" required class="form-control" style="width: 200px;margin-left: 300px">
                            <option hidden></option>
                            <option value="3">录用</option>
                            <option value="4">不录用</option>
                        </select>
                        <input type="submit" value="提交" class="form-control btn btn-primary" style="width: 200px;margin-left: -340px">

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
                        <input type="datetime-local" name="in_date" required>
                        <input type="submit" value="邀请面试">
                    </form>
                </c:if>
            </div>
        </div>
    </div>
    <div id="bottomDiv"></div>
</div>
</body>
</html>
