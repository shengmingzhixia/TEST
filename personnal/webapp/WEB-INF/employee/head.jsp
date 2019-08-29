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
    if (request.getAttribute("insert") != null) {
        boolean insert = (Boolean) request.getAttribute("insert");
        if (insert) {
%>
<script>
    alert("打卡成功！")
</script>
<%
} else {
%>
<script>
    alert("打卡失败，今天已经打过卡")
</script>
<%
        }
    }
%>
<%
    if (request.getAttribute("update") != null) {
        boolean update = (Boolean) request.getAttribute("update");
        if (update) {
%>
<script>
    alert("打卡成功！")
</script>
<%
} else {
%>
<script>
    alert("打卡失败，今天没打上班卡或已经打过下班卡！")
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
    <button><a href="gertOwnerTrain">培训管理</a></button>
    <button><a href="getSalary">薪资管理</a></button>
    <button>工资异议</button>
    <button><a href="javascript:history.go(-1)">返回上一步</a></button>
    <button style="float: right"><a href="xiaban">下班打卡</a></button>
    <button style="float: right"><a href="shangban">上班打卡</a></button>
</div>
