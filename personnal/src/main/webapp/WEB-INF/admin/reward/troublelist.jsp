<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="cgy.model.Trouble" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019\8\27 0027
  Time: 13:38
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
    <title>异议管理界面</title>
    <script src="js/jquery-1.7.2.js"></script>
    <link href="css/main.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdn.bootcss.com/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script>
        function addMoney() {
            document.getElementById("button1").style.display = "none"
            document.getElementById("button2").style.display = "block"
        }
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
            <%
                List<Trouble> list = (List<Trouble>) request.getAttribute("troubles");
                if (list != null && list.size() != 0) {
            %>
            <div>
                <div class="prod">
                    <div>
                        <table class="table table-striped">
                            <tr>
                                <th>员工工号</th>
                                <th>员工姓名</th>
                                <th>薪资结算日期</th>
                                <th>异议理由</th>
                                <th colspan="3" style="text-align: center">操作</th>
                            </tr>
                            <c:forEach items="${requestScope.troubles}" var="trouble">
                                <tr>
                                    <td>${trouble.employee.e_id}</td>
                                    <td>${trouble.employee.e_name}</td>
                                    <td><fmt:formatDate value="${trouble.salary.s_date}"
                                                        pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                    <td>${trouble.trouble.s_reason}</td>
                                    <td>
                                        <button>
                                            <a href="getRewards">去核实</a>
                                        </button>
                                    <td id="button1">
                                        <button onclick="addMoney()">补偿</button>
                                    </td>
                                    <td id="button2" hidden>
                                        <form action="addReward" method="post">
                                            <input type="hidden" name="s_id" value="${trouble.salary.s_id}">
                                            <input type="hidden" name="r_e_id" value="${trouble.salary.s_e_id}">
                                            <input type="text" name="r_money" placeholder="请填写补偿金额"><br>
                                            <input type="text" name="r_reason" placeholder="请填写补偿理由"><br>
                                            <input type="submit" value="提交">
                                        </form>
                                    </td>
                                    <td>
                                        <button>
                                            <a href="refuck?s_id=${trouble.salary.s_id}">驳回</a>
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>
                <%
                    }
                %>
            </div>
        </div>
    </div>
    <div id="bottomDiv"></div>
</div>
</body>
</html>
