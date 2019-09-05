<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    function funClick(a) {
        var lis = document.getElementsByClassName(a)
        for (var i = 0;i < lis.length;i++) {
            if (lis[i].style.display == "none") {
                lis[i].style.display = "block"
            }else {
                lis[i].style.display = "none"
            }
        }
    }


</script>
<div id="left">
    <div id="lhead">管理菜单</div>
    <div style="margin-top:  -50px;">
        <ul>
            <c:if test="${sessionScope.employeeNow!=null}">
                <c:if test="${sessionScope.employeeNow.e_type==0}">
                    <li onclick="funClick('liAdmin')"><a style="text-decoration: none;color: black">管理员功能</a></li>
                    <li class="liAdmin" style="display: none"><a href="getInter">应聘管理</a></li>
                    <li class="liAdmin" style="display: none"><a href="getMyInter">面试信息</a></li>
                    <li class="liAdmin" style="display: none"><a href="getDepart">部门职位</a></li>
                    <li class="liAdmin" style="display: none"><a href="torct">招聘信息管理</a></li>
                    <li class="liAdmin" style="display: none"><a href="totrain">培训管理</a></li>
                    <li class="liAdmin" style="display: none"><a href="toEmployeeManage">员工管理</a></li>
                    <li class="liAdmin" style="display: none"><a href="getRewards">员工奖惩管理</a></li>
                    <li class="liAdmin" style="display: none"><a href="toSalaryManage">薪资管理</a></li>
                    <li class="liAdmin" style="display: none"><a href="getTroubles">工资异议审核</a></li>
                    <li class="liAdmin" style="display: none"><a href="extralookAll">加班审核</a></li>

                    <li onclick="funClick('liUser')"><a style="text-decoration: none;color: black">员工功能</a></li>
                    <li class="liUser" style="display: none"><a href="tofindothers">员工信息查询</a></li>
                    <li class="liUser" style="display: none"><a href="getRewards2">个人奖惩记录</a></li>
                    <li class="liUser" style="display: none"><a href="getAttends2">个人考勤记录</a></li>
                    <li class="liUser" style="display: none"><a href="gertOwnerTrain">个人培训信息查询</a></li>
                    <li class="liUser" style="display: none"><a href="getSalary">个人薪资查看</a></li>
                    <li class="liUser" style="display: none"><a href="toaddextra">个人加班申请</a></li>
                    <li class="liUser" style="display: none"><a href="extralook">个人加班申请进度</a></li>
                    <li class="liUser" style="display: none"><a href="shangban">上班打卡</a></li>
                    <li class="liUser" style="display: none"><a href="xiaban">下班打卡</a></li>
                </c:if>
                <c:if test="${sessionScope.employeeNow.e_type==1}">
                    <li><a href="tofindothers">员工信息查询</a></li>
                    <li><a href="getRewards2">个人奖惩记录</a></li>
                    <li><a href="getAttends2">个人考勤记录</a></li>
                    <li><a href="gertOwnerTrain">个人培训信息查询</a></li>
                    <li><a href="getSalary">个人薪资查看</a></li>
                    <li><a href="toaddextra">个人加班申请</a></li>
                    <li><a href="extralook">个人加班申请进度</a></li>
                    <li><a href="shangban">上班打卡</a></li>
                    <li><a href="xiaban">下班打卡</a></li>
                </c:if>
            </c:if>
        </ul>
    </div>
</div>