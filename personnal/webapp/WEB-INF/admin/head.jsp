<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    if (request.getAttribute("login") != null) {
        boolean login = (Boolean) request.getAttribute("login");
        if (login) {
%>
<script>
    alert("登录成功！")
</script>
<%
} else {
%>
<script>
    alert("登录失败！")
</script>
<%
        }
    }
%>
<div>
    <button>应聘管理</button>
    <button><a href="getDepart">部门职位</a></button>
    <button>培训管理</button>
    <button>员工管理</button>
    <button>奖惩管理</button>
    <button>薪资管理</button>
    <button>工资异议</button>
    <button>退出</button>
</div>