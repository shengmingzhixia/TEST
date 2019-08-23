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
</head>
<body>
<form action="cvadd">
    <table>
        <tr>
            <td>简历名称：</td>
            <td><input type="text" name="title" placeholder="简历1"></td>
        </tr>
        <tr>
            <td>真实姓名</td>
            <td><input type="text" name="name"></td>
            <td>性别</td>
            <td>
                男<input type="radio" name="gender" value="男">
                女<input type="radio" name="gender" value="女">
            </td>
        </tr>
        <tr>
            <td>出生日期</td>
            <td><input type="date" name="birth"></td>
            <td>家庭住址</td>
            <td><input type="text" name="address"></td>
        </tr>
        <tr>
            <td>毕业院校</td>
            <td><input type="text" name="school"></td>
            <td>学历</td>
            <td>
                <select name="education">
                    <option value="高中">高中</option>
                    <option value="专科">专科</option>
                    <option value="本科">本科</option>
                    <option value="本科以上">本科以上</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>专业</td>
            <td><input type="text" name="major"></td>
            <td>入学时间</td>
            <td><input type="date" name="enroll"></td>
        </tr>
        <tr>
            <td>毕业时间</td>
            <td><input type="date" name="graduation"></td>
            <td>期望薪资</td>
            <td>
                <select name="salary">
                    <option value="4500">4000-5000</option>
                    <option value="5500">5000-6000</option>
                    <option value="7500">7000-8000</option>
                    <option value="8500">8000-9000</option>
                    <option value="9500">9000-10000</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>工作经验</td>
            <td>
                <textarea name="exprience"></textarea>
            </td>
            <td>联系电话</td>
            <td><input type="text" name="phone"></td>
        </tr>
        <tr>
            <td><input type="submit" value="提交"></td>
            <td><input type="reset" value="重置"></td>
        </tr>
    </table>
</form>
</body>
</html>
