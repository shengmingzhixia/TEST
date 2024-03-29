<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="cgy.model.Page" %>
<%@ page import="cgy.model.Training" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019\8\28 0028
  Time: 9:19
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
    <title>培训信息</title>
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
                            <th>培训主题</th>
                            <th>培训内容</th>
                            <th>开始时间</th>
                            <th>结束时间</th>
                            <th>培训地点</th>
                            <th>状态</th>
                            <th colspan="3" style="text-align: center">操作</th>
                        </tr>
                        <%
                            Page<Training> trainingPage = (Page<Training>) request.getAttribute("trainingPage");
                            if (trainingPage != null && trainingPage.getList() != null &&
                                    trainingPage.getList().size() != 0) {
                        %>
                        <c:forEach items="${requestScope.trainingPage.list}" var="train">
                            <tr>
                                <td>${train.t_title}</td>
                                <td>${train.t_context}</td>
                                <td><fmt:formatDate value="${train.t_start_time }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                <td><fmt:formatDate value="${train.t_end_time }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                <td>${train.t_address}</td>
                                <c:if test="${train.t_is_publish == 0}">
                                    <td>未发布</td>
                                    <td><a href="toupdatetrain?t_id=${train.t_id}">修改</a></td>
                                    <td><a href="updatetrain?&t_is_publish=1&t_id=${train.t_id}">发布</a></td>
                                    <td><a href="deletetrain?t_id=${train.t_id}">删除</a></td>
                                </c:if>
                                <c:if test="${train.t_is_publish == 1}">
                                    <td>已发布</td>
                                    <td><a href="updatetrain?&t_is_publish=0&t_id=${train.t_id}">下架</a></td>
                                    <td><a href="toChoosePos?t_id=${train.t_id}">选择培训部门</a></td>
                                    <td></td>
                                </c:if>
                            </tr>
                        </c:forEach>
                        <%
                        } else {
                        %>
                        <tr>
                            <td colspan="9">没有培训信息</td>
                        </tr>
                        <%
                            }
                        %>
                    </table>
                </div>
            </div>
            <div>
                <a href="toaddtrain">添加一个培训信息</a>
            </div>
            <div class="div4" style="text-align: center">
                <span>共 <%=trainingPage.getTotalPage()%> 页</span>
                <span>当前在第 <%=trainingPage.getPageNo()%> 页</span>
                <span><a href="totrain?pageNo=1">首页</a></span>
                <span><a href="totrain?pageNo=<%=trainingPage.getPrevPage()%>">上一页</a></span>
                <span><a href="totrain?pageNo=<%=trainingPage.getNextPage()%>">下一页</a></span>
                <span><a href="totrain?pageNo=<%=trainingPage.getTotalPage()%>">尾页</a></span>
                <form action="totrain"
                      onsubmit="return checkNum(this.children[1].value,<%=trainingPage.getTotalPage()%>)">
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
