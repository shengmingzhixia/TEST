<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="cgy.model.Department" %>
<%@ page import="cgy.model.Page" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019\8\22 0022
  Time: 22:26
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
    <title>部门显示</title>
    <script src="js/index.js"></script>
    <script src="js/jquery-1.7.2.js"></script>
    <link href="css/main.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
<div id="mainDiv">

    <%@ include file="../main/head.jsp" %>

    <div id="centerDiv">

        <%@ include file="../main/left.jsp" %>


        <div id="right">
            <%@ include file="../main/clock.jsp" %>
            <br/><br/>
            <%
                Page<Department> departmentPage = (Page<Department>) request.getAttribute("departmentPage");
                int i = 0;
                if (departmentPage == null) {
            %>
            <script>
                top.location = "getDepart";
            </script>
            <%
                    return;
                }
                if (departmentPage != null && departmentPage.getList() != null &&
                        departmentPage.getList().size() != 0) {
            %>
            <div>
                <table class="table table-striped">
                    <tr>
                        <th>部门名称</th>
                        <th>启用时间</th>
                        <th colspan="3" style="text-align: center">操作</th>
                    </tr>
                    <c:forEach items="${requestScope.departmentPage.list}" var="depart">
                        <tr>
                            <td>${depart.dep_name}</td>
                            <td><fmt:formatDate value="${depart.dep_date}" pattern="yyyy-MM-dd"/></td>
                            <td><a href="getPositions?pos_dep_id=${depart.dep_id}&name=${depart.dep_name}">查看该部门下职位</a>
                            </td>
                            <td><a href="toupdateDepart?dep_id=${depart.dep_id}&dep_name=${depart.dep_name}">修改</a></td>
                            <td><a href="deleteDepart?dep_id=${depart.dep_id}">删除</a></td>
                        </tr>
                    </c:forEach>
                </table>
                <span><a href="todepartmentadd">添加</a>部门</span>
                <%
                } else {
                %>
                <div>还没有部门信息被录入！去<a href="todepartmentadd">添加</a>部门</div>
                <%
                    }
                %>


                <div class="div4" style="text-align: center">
                    <span>共 <%=departmentPage.getTotalPage()%> 页</span>
                    <span>当前在第 <%=departmentPage.getPageNo()%> 页</span>
                    <span><a href="getDepart?pageNo=1">首页</a></span>
                    <span><a href="getDepart?pageNo=<%=departmentPage.getPrevPage()%>">上一页</a></span>
                    <span><a href="getDepart?pageNo=<%=departmentPage.getNextPage()%>">下一页</a></span>
                    <span><a href="getDepart?pageNo=<%=departmentPage.getTotalPage()%>">尾页</a></span>
                    <form action="getDepart"
                          onsubmit="return checkNum(this.children[1].value,<%=departmentPage.getTotalPage()%>)">
                        <span>跳转到</span><input name="pageNo">
                        <input type="submit" value="跳转">
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div id="bottomDiv"></div>
</div>
</body>
</html>
