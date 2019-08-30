<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    if (request.getAttribute("touristLogin") != null) {
        boolean touristLogin = (Boolean) request.getAttribute("touristLogin");
        if (touristLogin) {
%>
<script>
    alert("登录成功！")
</script>
<%
        }
        else {
            %>
<script>
    alert("登录未成功！")
</script>
<%
        }
        request.setAttribute("touristLogin",null);
    }
%>
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
        request.setAttribute("login",null);
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
        request.setAttribute("insertDepart",null);
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
        request.setAttribute("deleteDepart",null);
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
        request.setAttribute("updateDepart",null);
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
        request.setAttribute("insertPosition",null);
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
        request.setAttribute("updatePosition",null);
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
        request.setAttribute("deletePosition",null);
    }
%>
<%
    if (request.getAttribute("view0") != null) {
        boolean view0 = (Boolean) request.getAttribute("view0");
        if (view0) {
%>
<script>
    alert("简历投递成功！")
</script>
<%
} else {
%>
<script>
    alert("简历投递失败！")
</script>
<%
        }
        request.setAttribute("view",null);
    }
%>
<%
    if (request.getAttribute("view") != null) {
        boolean view = (Boolean) request.getAttribute("view");
        if (view) {
%>
<script>
    alert("发送面试邀请成功！")
</script>
<%
} else {
%>
<script>
    alert("发送面试邀请失败！")
</script>
<%
        }
        request.setAttribute("view",null);
    }
%>
<%
    if (request.getAttribute("view3") != null) {
        boolean view3 = (Boolean) request.getAttribute("view3");
        if (view3) {
%>
<script>
    alert("面试完成！")
</script>
<%
        }
        request.setAttribute("view3",null);
    }
%>
<%
    if (request.getAttribute("view4") != null) {
        boolean view3 = (Boolean) request.getAttribute("view4");
        if (view3) {
%>
<script>
    alert("录用成功！")
</script>
<%
} else {
%>
<script>
    alert("不录用成功！")
</script>
<%
        }
        request.setAttribute("view4",null);
    }
%>
<%
    if (request.getAttribute("insertRct") != null) {
        boolean insertRct = (Boolean) request.getAttribute("insertRct");
        if (insertRct) {
%>
<script>
    alert("撰写成功！")
</script>
<%
} else {
%>
<script>
    alert("撰写失败！")
</script>
<%
        }
        request.setAttribute("insertRct",null);
    }
%>

<%
    if (request.getAttribute("deleteRct") != null) {
        boolean deleteRct = (Boolean) request.getAttribute("deleteRct");
        if (deleteRct) {
%>
<script>
    alert("删除成功！")
</script>
<%
} else {
%>
<script>
    alert("删除失败！")
</script>
<%
        }
        request.setAttribute("deleteRct",null);
    }
%>
<%
    if (request.getAttribute("updateRct") != null) {
        boolean updateRct = (Boolean) request.getAttribute("updateRct");
        if (request.getAttribute("mark") != null) {
%>
<script>
    alert('${requestScope.mark}')
</script>
<%
    if (updateRct) {
%>
<script>
    alert("更新成功！")
</script>
<%
} else {
%>
<script>
    alert("更新失败！")
</script>
<%
            }
        }
        request.setAttribute("updateRct",null);
    }
%>
<%
    if (request.getAttribute("updateEmployee") != null) {
        boolean updateEmployee = (Boolean) request.getAttribute("updateEmployee");
        if (updateEmployee) {
%>
<script>
    alert("更新成功！")
</script>
<%
} else {
%>
<script>
    alert("更新失败！")
</script>
<%
        }
        request.setAttribute("updateEmployee",null);
    }
%>
<%
    if (request.getAttribute("updateState") != null) {
        boolean updateState = (Boolean) request.getAttribute("updateState");
        if (updateState) {
%>
<script>
    alert("更新成功！")
</script>
<%
} else {
%>
<script>
    alert("更新失败！")
</script>
<%
        }
        request.setAttribute("updateState",null);
    }
%>
<%
    if (request.getAttribute("deletetrain") != null) {
        boolean deletetrain = (Boolean) request.getAttribute("deletetrain");
        if (deletetrain) {
%>
<script>
    alert("删除成功！")
</script>
<%
} else {
%>
<script>
    alert("删除失败！")
</script>
<%
        }
        request.setAttribute("deletetrain",null);
    }
%>
<%
    if (request.getAttribute("addTrain") != null) {
        boolean addTrain = (Boolean) request.getAttribute("addTrain");
        if (addTrain) {
%>
<script>
    alert("新增成功！")
</script>
<%
} else {
%>
<script>
    alert("新增失败！")
</script>
<%
        }
        request.setAttribute("addTrain",null);
    }
%>
<%
    if (request.getAttribute("insertTrainEmployee") != null) {
        boolean insertTrainEmployee = (Boolean) request.getAttribute("insertTrainEmployee");
        if (insertTrainEmployee) {
%>
<script>
    alert("分配成功！")
</script>
<%
} else {
%>
<script>
    alert("分配失败！")
</script>
<%
        }
        request.setAttribute("insertTrainEmployee",null);
    }
%>
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
    if (request.getAttribute("insertNewEmployee") != null) {
        boolean insertNewEmployee = (Boolean) request.getAttribute("insertNewEmployee");
        if (insertNewEmployee) {
%>
<script>
    alert("录入成功！")
</script>
<%
        }
    }
%>