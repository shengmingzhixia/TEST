<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="left">
    <div id="lhead">管理菜单</div>
    <div style="margin-top:  -50px;">
        <ul>
            <c:if test="${sessionScope.employeeNow!=null}">
                <c:if test="${sessionScope.employeeNow.e_type==0}">
                    <li><a href="getInter">应聘管理</a></li>
                    <li><a href="getDepart">部门职位</a></li>
                    <li><a href="getMyInter">面试信息</a></li>
                    <li><a href="torct">招聘信息管理</a></li>
                    <li><a href="totrain">培训管理</a></li>
                    <li><a href="toEmployeeManage">员工管理</a></li>
                    <li><a href="getRewards">奖惩管理</a></li>
                    <li><a href="toSalaryManage">薪资管理</a></li>
                    <li><a href="getSalary">个人薪资查看</a></li>
                    <li><a href="getTroubles">工资异议审核</a></li>
                </c:if>
                <c:if test="${sessionScope.employeeNow.e_type==1}">
                    <li><a href="gertOwnerTrain">培训管理</a></li>
                    <li><a href="getSalary">薪资管理</a></li>
                    <li><a href="shangban">上班打卡</a></li>
                    <li><a href="xiaban">下班打卡</a></li>
                </c:if>
            </c:if>
        </ul>
    </div>
</div>