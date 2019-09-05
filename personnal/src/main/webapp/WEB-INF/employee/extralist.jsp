<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019\8\29 0029
  Time: 9:45
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
    <title>加班进度申请查看</title>
    <script>
        function addMoney() {
            document.getElementById("button1").style.display = "none"
            document.getElementById("button2").style.display = "block"
        }
    </script>
    <link href="css/main.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdn.bootcss.com/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
<div id="mainDiv">


    <%@ include file="../main/head.jsp" %>

    <div id="centerDiv">

        <%@ include file="../main/left.jsp" %>


        <div id="right">
            <%@ include file="../main/clock.jsp" %>
            <br/><br/>
            <div>
                <table class="table table-striped">
                    <tr>
                        <th>申请人</th>
                        <th>加班时间</th>
                        <th>结束时间</th>
                        <th>加班理由</th>
                        <th>申请状态</th>
                        <th colspan="2">操作</th>
                    </tr>
                    <c:if test="${requestScope.extraList==null}">
                        <tr>
                            <td colspan="7">没有数据</td>
                        </tr>
                    </c:if>
                    <c:if test="${requestScope.extraList!=null}">
                        <c:forEach items="${requestScope.extraList}" var="extra">
                            <c:forEach items="${requestScope.employeeList}" var="employee">
                                <c:if test="${employee.e_id==extra.ex_e_id}">
                                    <tr>
                                        <td>${employee.e_name}</td>
                                        <td><fmt:formatDate value="${extra.ex_start_date}"
                                                            pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                        <td><fmt:formatDate value="${extra.ex_end_date}"
                                                            pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                        <td>${extra.ex_reason}</td>
                                        <c:if test="${extra.ex_e_state==0}">
                                            <td>已同意</td>
                                        </c:if>
                                        <c:if test="${extra.ex_e_state==1}">
                                            <td>已申请</td>
                                        </c:if>
                                        <c:if test="${extra.ex_e_state==2}">
                                            <td>已驳回</td>
                                        </c:if>
                                        <c:choose>
                                            <c:when test="${sessionScope.employeeNow.e_type==0 and extra.ex_e_state==1}">
                                                <td id="button1">
                                                    <button onclick="addMoney()">同意</button>
                                                </td>
                                                <td id="button2" hidden>
                                                    <form action="updateExtra" method="post">
                                                        <input type="hidden" name="ex_id" value="${extra.ex_id}">
                                                        <input type="hidden" name="r_e_id" value="${employee.e_id}">
                                                        <input type="text" name="r_money" placeholder="请填写金额"><br>
                                                        <input type="text" name="r_reason" placeholder="请填写理由"><br>
                                                        <input type="submit" value="提交">
                                                    </form>
                                                </td>
                                                <td>
                                                    <a href="defExtra?ex_id=${extra.ex_id}&ex_e_state=2">驳回</a>
                                                </td>
                                            </c:when>
                                            <c:otherwise>
                                                <td colspan="2"></td>
                                            </c:otherwise>
                                        </c:choose>
                                    </tr>
                                </c:if>
                            </c:forEach>
                        </c:forEach>
                    </c:if>
                </table>
            </div>
        </div>
    </div>
    <div id="bottomDiv"></div>
</div>
</body>
</html>

