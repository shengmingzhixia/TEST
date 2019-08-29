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
    <link href="css/main.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div id="mainDiv">

    <%@ include file="../main/head.jsp" %>

    <div id="centerDiv">

        <%@ include file="../main/left.jsp" %>


        <div id="right">
            <div id="current" align="center">&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size: 20px;font-weight: bold;">当前位置--->>>${title}</span>
            </div>
            <br/><br/>
            <%
                List<InterView2> interViews = (List<InterView2>) request.getAttribute("interViews");
                if (interViews != null && interViews.size() != 0) {
            %>
            <div class="prod">
                <div>
                    <table border="1" cellspacing="1" cellpadding="0">
                        <tr>
                            <td>投递简历</td>
                            <td>投递岗位</td>
                            <td>面试时间</td>
                            <td>查看状态</td>
                            <td>面试状态</td>
                            <td>是否接受面试</td>
                            <td colspan="2" style="text-align: center">操作</td>
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
                                    <td><a href="sendInterView5?in_is_accept=4">拒绝入职</a></td>
                                </c:if>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
            <%
            } else {
            %>
            <div>没有面试信息</div>
            <%
                }
            %>

        </div>
    </div>
    <div id="bottomDiv"></div>
</div>
</body>
</html>
