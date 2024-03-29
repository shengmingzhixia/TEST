<%@ page import="cgy.model.Recruit" %>
<%@ page import="cgy.model.Page" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Matt
  Date: 2019/5/14
  Time: 21:44
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
    <title>招聘</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/customer.css" type="text/css"/>
    <script src="js/index.js"></script>
    <script src="js/jquery-1.7.2.js"></script>
    <script type="text/javascript">
        $(function () {
            $('.innerCtn').click(function () {
                if ($(this).children(0).hasClass('mui-ellipsis-1')) {
                    $(this).children(0).removeClass('mui-ellipsis-1');
                } else {
                    $(this).children(0).addClass('mui-ellipsis-1');
                }
            });
        });
    </script>
</head>
<body>
<%@ include file="../main/alert.jsp" %>
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
            Page<Recruit> recruitPage = (Page<Recruit>) request.getAttribute("recruitPage");
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
        <fieldset>
            <legend>查看已发布招聘信息</legend>
            <table class="table table-striped">
                <tr>
                    <th>培训主题</th>
                    <th>培训内容</th>
                    <th>培训时间</th>
                    <th>培训地点</th>
                    <th>培训人员</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${requestScope.recruitPage.list}" var="rct">
                    <tr>
                        <td>${rct.rct_title}</td>
                        <td>
                            <div class="innerCtn">
                                <span class="mui-ellipsis-1">
                                        ${rct.rct_introduaction}
                                </span>
                            </div>
                        </td>
                        <td><fmt:formatDate value="${rct.rct_publish_time }"
                                            pattern="yyyy-MM-dd"/></td>
                        <td>
                            <div class="innerCtn">
                                <span class="mui-ellipsis-1">
                                        ${rct.rct_address}
                                </span>
                            </div>
                        </td>
                        <td>${rct.rct_salary}</td>
                        <td><a href="toChooseCv?rctId=${rct.rct_id}">去投简历！</a></td>
                    </tr>
                </c:forEach>
            </table>
        </fieldset>
        <%
            }
        %>
        <fieldset>
            <div style="text-align: center">
                <span>共 <%=recruitPage.getTotalPage()%> 页</span>
                <span>当前在第 <%=recruitPage.getPageNo()%> 页</span>
                <span><a href="getRecruits?pageNo=1">首页</a></span>
                <span><a href="getRecruits?pageNo=<%=recruitPage.getPrevPage()%>">上一页</a></span>
                <span><a href="getRecruits?pageNo=<%=recruitPage.getNextPage()%>">下一页</a></span>
                <span><a href="getRecruits?pageNo=<%=recruitPage.getTotalPage()%>">尾页</a></span>
                <form action="getRecruits"
                      onsubmit="return checkNum(this.children[1].value,<%=recruitPage.getTotalPage()%>)" style="display: inline;">
                    <span>跳转到</span><input name="pageNo">
                    <input type="submit" value="跳转">
                </form>
            </div>

        </fieldset>
    </div>
</div>
</body>
</html>