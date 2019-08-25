<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page import="cgy.model.Customer" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    if (request.getAttribute("view2") != null) {
        boolean view2 = (Boolean) request.getAttribute("view2");
        if (view2) {
%>
<script>
    alert("接受面试邀请成功！")
</script>
<%
} else {
%>
<script>
    alert("拒绝面试邀请成功！")
</script>
<%
        }
    }
%>
<%
    if (request.getAttribute("view5") != null) {
        boolean view5 = (Boolean) request.getAttribute("view5");
        if (view5) {
%>
<script>
    alert("拒绝成功！")
</script>
<%
        }
    }
%>
<%
    if (request.getAttribute("insert") != null) {
        boolean insert = (Boolean) request.getAttribute("insert");
        if (insert) {
%>
<script>
    alert("录入成功！")
</script>
<%
        }
    }
%>
<%
    Customer cust = (Customer) session.getAttribute("cust");
    if (cust == null) {
%>
<div>
    <a href="toLogin">员工登录</a>
    <a href="entertouristLogin">游客登录</a>
    <a href="toRegister">游客注册</a>
</div>
<%
} else {
%>
欢迎用户：<%=cust.getC_account()%>
<a href="getCv">查看你的简历</a>
<a href="getInter2">查看你的面试</a>
<a href="#">修改密码</a>
<%
    }
%>