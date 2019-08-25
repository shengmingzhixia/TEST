<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    if (request.getAttribute("login") != null) {
        boolean login = (Boolean) request.getAttribute("login");
        if (login) {
%>
<script>
    alert("登录成功！")
</script>
<%
        }
    }
%>
<%
    if (session.getAttribute("employeeNow") != null) {
%>
<div><span>当前用户===》${sessionScope.employeeNow.e_name}</span></div>
<%
    }
%>
<div>
    <button>培训管理</button>
    <button>薪资管理</button>
    <button>工资异议</button>
    <button><a href="javascript:history.go(-1)">返回上一步</a></button>
</div>
