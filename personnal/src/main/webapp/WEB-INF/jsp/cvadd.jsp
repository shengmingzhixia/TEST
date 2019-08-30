<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019\8\23 0023
  Time: 14:04
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
    <title>新增简历</title>
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
        <form action="cvadd" method="post">
            <br/>
            <div class="col-sm-6">
                <div class="form-group">
                    <label>简&emsp;历&emsp;名&emsp;称：</label>
                    <input type="text" name="cv_title" class="form-control" placeholder="简历1">
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <label>真&emsp;实&emsp;姓&emsp;名：</label>
                    <input type="text" name="cv_name" class="form-control">
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <label>性&emsp;别：</label>
                    <select name="cv_gender" class="form-control" required>
                        <option hidden></option>
                        <option value="男">男</option>
                        <option value="女">女</option>
                    </select>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <label>出&emsp;生&emsp;日&emsp;期：</label>
                    <input type="date" name="cv_birth" class="form-control">
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <label>家&emsp;庭&emsp;住&emsp;址：</label>
                    <input type="text" name="cv_address" class="form-control">
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <label>毕&emsp;业&emsp;院&emsp;校：</label>
                    <input type="text" name="cv_school" class="form-control">
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <label>学&emsp;历：</label>
                    <select name="cv_education" class="form-control">
                        <option hidden></option>
                        <option value="高中">高中</option>
                        <option value="专科">专科</option>
                        <option value="本科">本科</option>
                        <option value="本科以上">本科以上</option>
                    </select>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <label>专&emsp;业：</label>
                    <input type="text" name="cv_major" class="form-control">
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <label>入&emsp;学&emsp;时&emsp;间：</label>
                    <input type="date" name="cv_enroll_date" class="form-control">
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <label>毕&emsp;业&emsp;时&emsp;间：</label>
                    <input type="date" name="cv_graduation_date" class="form-control">
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <label>期&emsp;望&emsp;薪&emsp;资：</label>
                    <select name="cv_salary" class="form-control">
                        <option hidden></option>
                        <option value="4500">4000-5000</option>
                        <option value="5500">5000-6000</option>
                        <option value="7500">7000-8000</option>
                        <option value="8500">8000-9000</option>
                        <option value="9500">9000-10000</option>
                    </select>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <label>联&emsp;系&emsp;电&emsp;话：</label>
                    <input type="text" name="cv_phone" class="form-control">
                </div>
            </div>
            <div class="col-sm-12">
                <div class="form-group">
                    <label>工&emsp;作&emsp;经&emsp;验：</label>
                    <textarea name="cv_exprience" maxlength="100" style="height: 90px;resize: none"
                              class="form-control"></textarea>
                </div>
            </div>
            <div class="col-sm-12">
                <div class="form-group">
                    <input type="submit" value="提交">
                    <input type="reset" value="重置">
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>
