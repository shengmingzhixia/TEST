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
    <link rel="stylesheet" href="https://cdn.bootcss.com/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/customer.css" type="text/css"/>
    <script src="js/jquery-1.7.2.js"></script>
    <script src="js/index.js"></script>
</head>
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
            <a href="getRecruits" class="list-group-item active"
               style="background-color:#2C2F33;color: #F3732A">查看招聘</a>
            <a href="getCv" class="list-group-item" style="background-color:#2C2F33;color: #F3732A">查看简历</a>
            <a href="getInter2" class="list-group-item" style="background-color:#2C2F33;color: #F3732A">我的投递</a>
        </div>
    </div>
    <div class="col-sm-10">
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
        <fieldset>
            <legend>简阅所有简历</legend>
            <table class="table table-striped">
                <c:forEach items="${requestScope.cvByPage.list}" var="cv">
                    <tr>
                        <td>简历==>${cv.cv_title}</td>
                        <td>
                            <button>
                                <a href="cvdetail?id=${cv.cv_id}">查看详情</a>
                            </button>
                        </td>
                        <td>
                            <button>
                                <a href="toCvUpdate?id=${cv.cv_id}">修改</a>
                            </button>
                        </td>
                        <td>
                            <button>
                                <a href="cvDelete?id=${cv.cv_id}">删除</a>
                            </button>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </fieldset>
            <%
        }
    %>
        <fieldset>
            <div style="text-align: center">
                <span>共 <%=cvByPage.getTotalPage()%> 页</span>
                <span>当前在第 <%=cvByPage.getPageNo()%> 页</span>
                <span><a href="getCv?pageNo=1">首页</a></span>
                <span><a href="getCv?pageNo=<%=cvByPage.getPrevPage()%>">上一页</a></span>
                <span><a href="getCv?pageNo=<%=cvByPage.getNextPage()%>">下一页</a></span>
                <span><a href="getCv?pageNo=<%=cvByPage.getTotalPage()%>">尾页</a></span>
                <form action="getCv" onsubmit="return checkNum(this.children[1].value,<%=cvByPage.getTotalPage()%>)"
                      style="display: inline;">
                    <span>跳转到</span><input name="pageNo">
                    <input type="submit" value="跳转">
                </form>
            </div>
        </fieldset>
    </div>
</div>
</body>
</html>
