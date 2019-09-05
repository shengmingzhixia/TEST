<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019\8\23 0023
  Time: 16:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>"/>
    <title>修改简历</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/customer.css" type="text/css"/>
    <script src="js/jquery-1.7.2.js"></script>
</head>
<body>
<div class="head">
    <div class="head-main">
        <div class="head-menu">
            <div class="login" style="opacity: 0.8;">
                欢迎 ${sessionScope.customer.c_account} 来到海大同招聘！|
                <a href="logout">退出</a>
            </div>
            <ul id="menu">
                <li>
                    <a href="index.jsp">首&nbsp;&nbsp;页</a>
                </li>
                <li><a class="current-cat">社会招聘</a></li>
                <li><a href="https://job.alibaba.com/zhaopin/about.htm?spm=a2obv.11410903.0.0.5af844f6A10LlV">了解公司</a>
                </li>
                <li><a>联系我们</a></li>
                <li class="current-cat"><a>个人中心</a></li>
            </ul>
        </div>
        <a href="/" class="logo" style="text-align:right;width: 125px;">
            <img src="https://img.alicdn.com/tfs/TB1Zv8_lxSYBuNjSspjXXX73VXa-390-63.png" height="20"/>
        </a>
        <i style="float:left;color:white;font-style:normal;font-size:20px;line-height:52px;margin: 0 10px;opacity: 0.8;">|</i>
        <i style="float:left;color:white;font-style:normal;font-size:14px;line-height:54px;opacity: 0.8;">招聘官网</i>
    </div>
</div>
<div class="container" style="max-width: 1100px;margin-top: 5px;">
    <%--<div class="row">--%>
    <div class="col-sm-2">
        <div class="list-group side-bar">
            <a href="tocvadd" class="list-group-item active"
               style="background-color:#2C2F33;color: #F3732A">新增简历</a>
            <a href="getRecruits" class="list-group-item active" id="addr"
               style="background-color:#2C2F33;color: #F3732A">查看招聘</a>
            <a href="getCv" class="list-group-item" style="background-color:#2C2F33;color: #F3732A">查看简历</a>
            <a href="getInter2" class="list-group-item" style="background-color:#2C2F33;color: #F3732A">我的投递</a>
        </div>
    </div>
    <div class="col-sm-10">

        <div>
            <form action="cvUpdate" method="post">
                <input type="hidden" value="${requestScope.cv.cv_id}" name="cv_id">
                <table class="table table-striped">
                    <tr>
                        <td>简历名称：</td>
                        <td><input type="text" name="cv_title" value="${requestScope.cv.cv_title}" required></td>
                    </tr>
                    <tr>
                        <td>真实姓名</td>
                        <td><input type="text" name="cv_name" value="${requestScope.cv.cv_name}" required></td>
                        <td>性别</td>
                        <td>
                            <script>
                                $(function () {
                                    var gender = '${requestScope.cv.cv_gender}'
                                    if ("男" == gender) {
                                        $("#radio1").attr("checked", true)
                                    } else {
                                        $("#radio2").attr("checked", true)
                                    }
                                })
                            </script>
                            男<input type="radio" name="cv_gender" value="男" id="radio1">
                            女<input type="radio" name="cv_gender" value="女" id="radio2">
                        </td>
                    </tr>
                    <tr>
                        <td>出生日期</td>
                        <td><input type="date" name="cv_birth"
                                   value="<fmt:formatDate value="${requestScope.cv.cv_birth}" pattern="yyyy-MM-dd"/>" required>
                        </td>
                        <td>家庭住址</td>
                        <td><input type="text" name="cv_address" value="${requestScope.cv.cv_address}" required></td>
                    </tr>
                    <tr>
                        <td>毕业院校</td>
                        <td><input type="text" name="cv_school" value="${requestScope.cv.cv_school}" required></td>
                        <td>学历</td>
                        <script>
                            $(function () {
                                var education = '${requestScope.cv.cv_education}'
                                if ("高中" == education) {
                                    $("#select1").attr("selected", true)
                                } else if ("专科" == education) {
                                    $("#select2").attr("selected", true)
                                } else if ("本科" == education) {
                                    $("#select3").attr("selected", true)
                                } else {
                                    $("#select4").attr("selected", true)
                                }
                            })
                        </script>
                        <td>
                            <select name="cv_education" required>
                                <option value="高中" id="select1">高中</option>
                                <option value="专科" id="select2">专科</option>
                                <option value="本科" id="select3">本科</option>
                                <option value="本科以上" id="select4">本科以上</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>专业</td>
                        <td><input type="text" name="cv_major" value="${requestScope.cv.cv_major}" required></td>
                        <td>入学时间</td>
                        <td><input type="date" name="cv_enroll_date"
                                   value="<fmt:formatDate value="${requestScope.cv.cv_enroll_date}" pattern="yyyy-MM-dd"/>" required>
                        </td>
                    </tr>
                    <tr>
                        <td>毕业时间</td>
                        <td><input type="date" name="cv_graduation_date"
                                   value="<fmt:formatDate value="${requestScope.cv.cv_graduation_date}" pattern="yyyy-MM-dd"/>" required>
                        </td>
                        <td>期望薪资</td>
                        <script>
                            $(function () {
                                var salary =
                                ${requestScope.cv.cv_salary}
                                if (4500 == salary) {
                                    $("#select5").attr("selected", true)
                                } else if (5500 == salary) {
                                    $("#select6").attr("selected", true)
                                } else if (7500 == salary) {
                                    $("#select7").attr("selected", true)
                                } else if (8500 == salary) {
                                    $("#select8").attr("selected", true)
                                } else {
                                    $("#select9").attr("selected", true)
                                }
                            })
                        </script>
                        <td>
                            <select name="cv_salary" id="salary" required>
                                <option value="4500" id="select5">4000-5000</option>
                                <option value="5500" id="select6">5000-6000</option>
                                <option value="7500" id="select7">7000-8000</option>
                                <option value="8500" id="select8">8000-9000</option>
                                <option value="9500" id="select9">9000-10000</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>工作经验</td>
                        <td>
                            <textarea name="cv_exprience" maxlength="100" style="height: 90px;resize: none" required>${requestScope.cv.cv_exprience}</textarea>
                        </td>
                        <td>联系电话</td>
                        <td><input type="text" name="cv_phone" value="${requestScope.cv.cv_phone}" required></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="提交"></td>
                        <td><input type="reset" value="重置"></td>
                    </tr>
                </table>
            </form>
        </div>
        <div>
            <a href="getCv">返回</a>
        </div>
    </div>
</div>
</body>
</html>
