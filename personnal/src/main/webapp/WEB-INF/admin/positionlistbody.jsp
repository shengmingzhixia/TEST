<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="cgy.model.Position" %>
<%@ page import="cgy.model.Page" %>
<script src="js/index.js"></script>
<script src="js/jquery-1.7.2.js"></script>
<%
    Page<Position> positionByPage = (Page<Position>) request.getAttribute("positionByPage");
    if (positionByPage != null && positionByPage.getList() != null &&
            positionByPage.getList().size() != 0) {
%>
<div class="prod">
    <div>
        <table border="1" cellspacing="1" cellpadding="0">
            <tr>
                <td>部门名称</td>
                <td>职位名称</td>
                <td colspan="3">操作</td>
            </tr>
            <c:forEach items="${requestScope.positionByPage.list}" var="pos">
                <tr>
                    <td>${requestScope.dep_name}</td>
                    <td>${pos.pos_name}</td>
                    <td><a href="getEmployees?e_pos_id=${pos.pos_id}&name=${pos.pos_name}">查看下面的员工信息</a></td>
                    <td>
                        <a href="toupdateposition?pos_id=${pos.pos_id}&pos_name=${pos.pos_name}&pos_dep_id=${pos.pos_dep_id}">修改</a>
                    </td>
                    <td><a href="deleteposition?pos_id=${pos.pos_id}&pos_dep_id=${pos.pos_dep_id}">删除</a></td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
<a href="toaddposition?dep_id=${requestScope.positionByPage.list.get(0).pos_dep_id}">添加一个新的职位</a>
<%
} else {
%>
<div>没有职位信息<a href="toaddposition?dep_id=${requestScope.positionByPage.list.get(0).pos_dep_id}">添加一个新的职位</a></div>
<%
    }
%>

</div>
<div class="div4">
    <span>共 <%=positionByPage.getTotalPage()%> 页</span>
    <span>当前在第 <%=positionByPage.getPageNo()%> 页</span>
    <span><a href="getPositions?pageNo=1&pos_dep_id=${requestScope.pos_dep_id}">首页</a></span>
    <span><a href="getPositions?pageNo=<%=positionByPage.getPrevPage()%>&pos_dep_id=${requestScope.pos_dep_id}">上一页</a></span>
    <span><a href="getPositions?pageNo=<%=positionByPage.getNextPage()%>&pos_dep_id=${requestScope.pos_dep_id}">下一页</a></span>
    <span><a href="getPositions?pageNo=<%=positionByPage.getTotalPage()%>&pos_dep_id=${requestScope.pos_dep_id}">尾页</a></span>
    <form action="getPositions" onsubmit="return checkNum(this.children[2].value,<%=positionByPage.getTotalPage()%>)">
        <input type="hidden" name="pos_dep_id" value="${requestScope.pos_dep_id}">
        <span>跳转到</span><input name="pageNo">
        <input type="submit" value="跳转">
    </form>
</div>