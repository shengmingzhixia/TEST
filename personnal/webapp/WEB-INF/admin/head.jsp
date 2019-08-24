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
<%
    if (request.getAttribute("insertDepart") != null) {
        boolean insertDepart = (Boolean) request.getAttribute("insertDepart");
        if (insertDepart) {
%>
<script>
    alert("添加部门成功！")
</script>
<%
} else {
%>
<script>
    alert("添加部门失败！")
</script>
<%
        }
    }
%>
<%
    if (request.getAttribute("deleteDepart") != null) {
        boolean deleteDepart = (Boolean) request.getAttribute("deleteDepart");
        if (deleteDepart) {
%>
<script>
    alert("删除部门成功！")
</script>
<%
} else {
%>
<script>
    alert("删除部门失败！")
</script>
<%
        }
    }
%>
<%
    if (request.getAttribute("updateDepart") != null) {
        boolean updateDepart = (Boolean) request.getAttribute("updateDepart");
        if (updateDepart) {
%>
<script>
    alert("更新部门成功！")
</script>
<%
} else {
%>
<script>
    alert("更新部门失败！")
</script>
<%
        }
    }
%>
<%
    if (request.getAttribute("insertPosition") != null) {
        boolean insertPosition = (Boolean) request.getAttribute("insertPosition");
        if (insertPosition) {
%>
<script>
    alert("新增职位成功！")
</script>
<%
} else {
%>
<script>
    alert("新增职位失败！")
</script>
<%
        }
    }
%>
<%
    if (request.getAttribute("updatePosition") != null) {
        boolean updatePosition = (Boolean) request.getAttribute("updatePosition");
        if (updatePosition) {
%>
<script>
    alert("修改职位成功！")
</script>
<%
} else {
%>
<script>
    alert("修改职位失败！")
</script>
<%
        }
    }
%>
<%
    if (request.getAttribute("deletePosition") != null) {
        boolean deletePosition = (Boolean) request.getAttribute("deletePosition");
        if (deletePosition) {
%>
<script>
    alert("删除职位成功！")
</script>
<%
} else {
%>
<script>
    alert("删除职位失败！")
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
    <button><a href="javascript:history.go(-1)">返回上一步</a></button>
</div>
<%
    if (request.getAttribute("name") != null) {
        session.setAttribute("name", request.getAttribute("name"));
%>
<div><span>当前===》${requestScope.name}</span></div>
<%
} else if (session.getAttribute("name") != null) {
%>
<div><span>当前===》${sessionScope.name}</span></div>
<%
    }
%>
