<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="cgy.model.Customer" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
欢迎用户：<%=cust.getAccount()%>
<a href="getCv">查看你的简历</a>
<a href="#">查看你的面试</a>
<a href="#">修改密码</a>
<%
    }
%>