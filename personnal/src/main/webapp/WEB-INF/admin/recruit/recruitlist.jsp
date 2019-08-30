<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="cgy.model.Recruit" %>
<%@ page import="cgy.model.Page" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019\8\26 0026
  Time: 9:59
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
    <title>所有的招聘信息</title>
    <script src="js/index.js"></script>
    <script src="js/jquery-1.7.2.js"></script>
    <link href="css/main.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
<div id="mainDiv">

    <%@ include file="../../main/head.jsp" %>

    <div id="centerDiv">

        <%@ include file="../../main/left.jsp" %>


        <div id="right">
            <div id="current" align="center">&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size: 20px;font-weight: bold;">当前位置--->>>${title}</span>
            </div>
            <br/><br/>

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
            <div class="prod">
                <div>
                    <table class="table table-striped">
                        <tr>
                            <th>招聘主题</th>
                            <th>招聘描述</th>
                            <th>地址</th>
                            <th>薪资</th>
                            <th>发布时间</th>
                            <th colspan="3" style="text-align: center">操作</th>
                        </tr>
                        <c:forEach items="${requestScope.recruitPage.list}" var="rct">
                            <tr>
                                <td>${rct.rct_title}</td>
                                <td>${rct.rct_introduaction}</td>
                                <td>${rct.rct_address}</td>
                                <td>${rct.rct_salary}</td>
                                <c:if test="${rct.rct_is_draft == 1}">
                                    <td>未发布</td>
                                    <td><a href="">修改</a></td>
                                    <td><a href="updateRct?&rct_is_draft=0&rct_is_publish=1&rct_id=${rct.rct_id}">发布</a>
                                    </td>
                                    <td><a href="deleteRct?rct_id=${rct.rct_id}">删除</a></td>
                                </c:if>
                                <c:if test="${rct.rct_is_draft == 0}">
                                    <td><fmt:formatDate value="${rct.rct_publish_time }"
                                                        pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                    <td colspan="3"><a
                                            href="updateRct?&rct_is_draft=1&rct_is_publish=0&rct_id=${rct.rct_id}">下架</a>
                                    </td>
                                    <%--下架时，更新时间为null--%>
                                </c:if>
                            </tr>
                        </c:forEach>
                    </table>
                    <a href="toaddrecruit">添加一个招聘信息</a>
                </div>
            </div>
            <%
            } else {
            %>
            <div>没有招聘信息</div>
            <%
                }
            %>

            <div class="div4" style="text-align: center">
                <span>共 <%=recruitPage.getTotalPage()%> 页</span>
                <span>当前在第 <%=recruitPage.getPageNo()%> 页</span>
                <span><a href="getRecruits?pageNo=1">首页</a></span>
                <span><a href="getRecruits?pageNo=<%=recruitPage.getPrevPage()%>">上一页</a></span>
                <span><a href="getRecruits?pageNo=<%=recruitPage.getNextPage()%>">下一页</a></span>
                <span><a href="getRecruits?pageNo=<%=recruitPage.getTotalPage()%>">尾页</a></span>
                <form action="getRecruits"
                      onsubmit="return checkNum(this.children[1].value,<%=recruitPage.getTotalPage()%>)">
                    <span>跳转到</span><input name="pageNo">
                    <input type="submit" value="跳转">
                </form>
            </div>
        </div>
    </div>
    <div id="bottomDiv"></div>
</div>
</body>
</html>
