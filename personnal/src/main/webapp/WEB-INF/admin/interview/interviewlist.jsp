<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="cgy.model.InterView" %>
<%@ page import="cgy.model.Page" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019\8\25 0025
  Time: 9:36
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
    <title>简历界面(管理员)</title>
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
            <%@ include file="../../main/clock.jsp" %>
            <br/><br/>
            <div class="prod">
                <div>
                    <table class="table table-striped">
                        <tr>
                            <th>应聘者</th>
                            <th>投递岗位</th>
                            <th>面试时间</th>
                            <th>查看状态</th>
                            <th>面试状态</th>
                            <th>是否接受面试</th>
                            <th colspan="2" style="text-align: center">操作</th>
                        </tr>
                        <%
                            Page<InterView> interViewPage = (Page<InterView>) request.getAttribute("interViewPage");
                            if (interViewPage != null && interViewPage.getList() != null &&
                                    interViewPage.getList().size() != 0) {
                        %>
                        <c:forEach items="${requestScope.interViewPage.list}" var="inter">
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
                                <c:if test="${inter.in_is_agree==0}">
                                    <td>未反馈</td>
                                </c:if>
                                <c:if test="${inter.in_is_agree==1}">
                                    <td>已同意</td>
                                </c:if>
                                <c:if test="${inter.in_is_agree==2}">
                                    <td>已拒绝</td>
                                </c:if>
                                <td>
                                    <a href="cvdetail2?in_cv_id=${inter.in_cv_id}&in_rct_name=${inter.in_rct_name}&in_id=${inter.in_id}&in_is_accept=${inter.in_is_accept}">查看</a>
                                </td>
                                <td>删除</td>
                            </tr>
                        </c:forEach>
                        <%
                        } else {
                        %>
                        <tr>
                            <td colspan="8">没有面试信息</td>
                        </tr>
                        <%
                            }
                        %>
                    </table>
                </div>
            </div>

            <div style="text-align: center">
                <span>共 <%=interViewPage.getTotalPage()%> 页</span>
                <span>当前在第 <%=interViewPage.getPageNo()%> 页</span>
                <span><a href="getInter?pageNo=1">首页</a></span>
                <span><a href="getInter?pageNo=<%=interViewPage.getPrevPage()%>">上一页</a></span>
                <span><a href="getInter?pageNo=<%=interViewPage.getNextPage()%>">下一页</a></span>
                <span><a href="getInter?pageNo=<%=interViewPage.getTotalPage()%>">尾页</a></span>
                <form action="getInter"
                      onsubmit="return checkNum(this.children[1].value,<%=interViewPage.getTotalPage()%>)">
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
