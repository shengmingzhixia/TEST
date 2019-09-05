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
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script>
        $(function () {
            $("#button1").click(function () {
                $(".update1").removeAttr("disabled")
                $(".sub01").css("display", "block")
                $(this).css("display", "none")
            })
            $("#button2").click(function () {
                $(".update1").attr("disabled", true)
                $(".sub01").css("display", "none")
                $("#button1").css("display", "block")
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
            <%@ include file="../../main/clock.jsp" %>
            <br/><br/>
            <div class="col-sm-10">
                <div class="col-sm-6">
                    <div class="form-group">
                        <label>真&emsp;实&emsp;姓&emsp;名：</label>
                        <input type="text" disabled class="form-control" value="${requestScope.employee1.e_name}">
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="form-group">
                        <label>身&emsp;份：</label>
                        <c:if test="${requestScope.employee1.e_type==1}">
                            <input type="text" disabled class="form-control" value="普通职员">
                        </c:if>
                        <c:if test="${requestScope.employee1.e_type==0}">
                            <input type="text" disabled class="form-control" value="管理员">
                        </c:if>
                        <c:if test="${requestScope.employee1.e_type==-1}">
                            <input type="text" disabled class="form-control" value="最高职等">
                        </c:if>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="form-group">
                        <label>性&emsp;别：</label>
                        <input type="text" disabled class="form-control"
                               value="${requestScope.employee1.e_gender}">
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="form-group">
                        <label>入&emsp;职&emsp;时&emsp;间：</label>
                        <input type="text" class="form-control" disabled
                               value="<fmt:formatDate
                               value="${requestScope.employee1.e_enroll_date}"
                               pattern="yyyy-MM-dd HH:mm:ss"/>">
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="form-group">
                        <label>家&emsp;庭&emsp;住&emsp;址：</label>
                        <input type="text" class="form-control" disabled
                               value="${requestScope.employee1.e_address}">
                    </div>
                </div>
                <form action="updateEmployee" method="post">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label>电&emsp;话：</label>
                            <input type="text" name="e_phone" class="update1 form-control"
                                   value="${requestScope.employee1.e_phone}"
                                   disabled
                                   required>
                        </div>
                    </div>
                    <c:if test="${sessionScope.employeeNow.e_type==0}">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label>银&emsp;行&emsp;卡&emsp;号：</label>
                                <input type="text" name="e_debit" class="update1 form-control"
                                       value="${requestScope.employee1.e_debit}"
                                       disabled
                                       required>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label>薪&emsp;资：</label>
                                <input type="text" class="update1 form-control" name="e_salary"
                                       value="${requestScope.employee1.e_salary}" disabled
                                       required>
                            </div>
                        </div>
                    </c:if>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label>职&emsp;位&emsp;编&emsp;号：</label>
                            <input type="text" class="form-control" disabled
                                   value="${requestScope.employee1.e_pos_id}">
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label>职&emsp;位&emsp;名&emsp;称：</label>
                            <input type="text" class="form-control" disabled
                                   value="${requestScope.posName}">
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label>部&emsp;门&emsp;编&emsp;号：</label>
                            <input type="text" class="form-control" disabled
                                   value="${requestScope.department.dep_id}">
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label>部&emsp;门&emsp;名&emsp;称：</label>
                            <input type="text" class="form-control" disabled
                                   value="${requestScope.department.dep_name}">
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label>状&emsp;态：</label>
                            <c:if test="${requestScope.employee1.e_state==2}">
                                <select name="e_state" class="update1 form-control" disabled required>
                                    <option value="0">离职</option>
                                    <option value="1">在职</option>
                                    <option value="2" selected>试用期</option>
                                </select>
                            </c:if>
                            <c:if test="${requestScope.employee1.e_state==1}">
                                <select name="e_state" class="update1 form-control" disabled required>
                                    <option value="0">离职</option>
                                    <option value="1" selected>在职</option>
                                    <option value="2">试用期</option>
                                </select>
                            </c:if>
                            <c:if test="${requestScope.employee1.e_state==0}">
                                <select name="e_state" class="update1 form-control" disabled required>
                                    <option value="0" selected>离职</option>
                                    <option value="1">在职</option>
                                    <option value="2">试用期</option>
                                </select>
                            </c:if>
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="form-group">
                            <input type="hidden" name="e_id" value="${requestScope.employee1.e_id}">
                            <input type="submit" value="修改" class="sub01 form-control btn btn-primary"
                                   style="display: none">
                        </div>
                    </div>
                </form>
                <c:if test="${sessionScope.employeeNow.e_type==0 && requestScope.employee1.e_state!=0}">
                    <div class="col-sm-12">
                        <div class="form-group">
                            <input type="button" id="button1" value="修改个人信息" class="form-control btn btn-primary"/>
                        </div>
                    </div>
                </c:if>
                <div class="col-sm-12">
                    <div class="form-group">
                        <input type="button" class="sub01 form-control btn btn-primary" id="button2"
                               style="display: none" value="取消修改">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="bottomDiv"></div>
</div>
</body>
</html>
