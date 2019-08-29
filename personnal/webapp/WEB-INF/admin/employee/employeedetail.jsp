<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019\8\24 0024
  Time: 16:09
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
    <title>用户详情</title>
    <script src="js/jquery-1.7.2.js"></script>
    <link href="css/main.css" rel="stylesheet" type="text/css"/>
    <script>
        $(function () {
            $("#button1").click(function () {
                $(".update1").removeAttr("disabled")
                $(".sub01").removeAttr("hidden")
                $(this).attr("hidden", true)
            })
            $("#button2").click(function () {
                $(".update1").attr("disabled", true)
                $(".sub01").attr("hidden", true)
                $("#button1").removeAttr("hidden")
            })
        })
    </script>
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
            <table border="1" cellspacing="1" cellpadding="0">
                <tr>
                    <td>姓名</td>
                    <td>${requestScope.employee1.e_name}</td>
                </tr>
                <tr>
                    <td>身份</td>
                    <c:if test="${requestScope.employee1.e_type==1}">
                        <td>普通职员</td>
                    </c:if>
                    <c:if test="${requestScope.employee1.e_type==0}">
                        <td>管理员</td>
                    </c:if>
                    <c:if test="${requestScope.employee1.e_type==-1}">
                        <td>最高职等</td>
                    </c:if>
                    <td>性别</td>
                    <td>${requestScope.employee1.e_gender}</td>
                </tr>
                <tr>
                    <td>入职时间</td>
                    <td><fmt:formatDate value="${requestScope.employee1.e_enroll_date}" pattern="yyyy-MM-dd"/></td>
                    <td>家庭住址</td>
                    <td>${requestScope.employee1.e_address}</td>
                </tr>
                <form action="updateEmployee" method="post">
                    <tr>
                        <td>电话</td>
                        <td><input type="text" name="e_phone" class="update1" value="${requestScope.employee1.e_phone}"
                                   disabled
                                   required></td>
                        <td>银行卡号</td>
                        <td><input type="text" name="e_debit" class="update1" value="${requestScope.employee1.e_debit}"
                                   disabled
                                   required></td>
                    </tr>
                    <tr>
                        <td>状态</td>
                        <c:if test="${requestScope.employee1.e_state==1}">
                            <td>
                                <select name="e_state" class="update1" disabled required>
                                    <option value="0">离职</option>
                                    <option value="1" selected>在职</option>
                                </select>
                            </td>
                        </c:if>
                        <c:if test="${requestScope.employee1.e_state==0}">
                            <td>
                                <select name="e_state" class="update1" disabled required>
                                    <option value="0" selected>离职</option>
                                    <option value="1">在职</option>
                                </select>
                            </td>
                        </c:if>
                        <td>薪资</td>
                        <td><input type="text" class="update1" name="e_salary"
                                   value="${requestScope.employee1.e_salary}" disabled
                                   required></td>
                    </tr>
                    <tr>
                        <td>职位id</td>
                        <td>${requestScope.employee1.e_pos_id}</td>
                        <td>职位名称</td>
                        <td>${requestScope.posName}</td>
                    </tr>
                    <tr>
                        <td>部门id</td>
                        <td>${requestScope.employee1.e_pos_id}</td>
                        <td>部门名称</td>
                        <td>${requestScope.depName}</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="hidden" name="e_id" value="${requestScope.employee1.e_id}">
                            <input type="submit" value="修改" class="sub01" hidden>
                        </td>
                </form>
                <td>
                    <button id="button1">修改个人信息</button>
                </td>
                <td>
                    <button class="sub01" id="button2" hidden>取消修改</button>
                </td>
                </tr>
            </table>
        </div>
    </div>
    <div id="bottomDiv"></div>
</div>
</body>
</html>
