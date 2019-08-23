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
    <script src="js/jquery-1.7.2.js"></script>
</head>
<body>
<form action="cvUpdate" method="post">
    <input type="hidden" value="${requestScope.cv.id}" name="id">
    <table>
        <tr>
            <td>简历名称：</td>
            <td><input type="text" name="title" value="${requestScope.cv.title}"></td>
        </tr>
        <tr>
            <td>真实姓名</td>
            <td><input type="text" name="name" value="${requestScope.cv.name}"></td>
            <td>性别</td>
            <td>
                <script>
                    $(function () {
                        var gender = '${requestScope.cv.gender}'
                        if("男" == gender){
                            $("#radio1").attr("checked",true)
                        }else {
                            $("#radio2").attr("checked",true)
                        }
                    })
                </script>
                男<input type="radio" name="gender" value="男" id="radio1">
                女<input type="radio" name="gender" value="女" id="radio2">
            </td>
        </tr>
        <tr>
            <td>出生日期</td>
            <td><input type="date" name="birth" value="<fmt:formatDate value="${requestScope.cv.birth}" pattern="yyyy-MM-dd"/>"></td>
            <td>家庭住址</td>
            <td><input type="text" name="address" value="${requestScope.cv.address}"></td>
        </tr>
        <tr>
            <td>毕业院校</td>
            <td><input type="text" name="school" value="${requestScope.cv.school}"></td>
            <td>学历</td>
            <script>
                $(function () {
                    var education = '${requestScope.cv.education}'
                    if("高中" == education){
                        $("#select1").attr("selected",true)
                    }else if ("专科" == education) {
                        $("#select2").attr("selected",true)
                    }else if ("本科" == education) {
                        $("#select3").attr("selected",true)
                    }else {
                        $("#select4").attr("selected",true)
                    }
                })
            </script>
            <td>
                <select name="education">
                    <option value="高中" id="select1">高中</option>
                    <option value="专科" id="select2">专科</option>
                    <option value="本科" id="select3">本科</option>
                    <option value="本科以上" id="select4">本科以上</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>专业</td>
            <td><input type="text" name="major" value="${requestScope.cv.major}"></td>
            <td>入学时间</td>
            <td><input type="date" name="enroll" value="<fmt:formatDate value="${requestScope.cv.enrollDate}" pattern="yyyy-MM-dd"/>"></td>
        </tr>
        <tr>
            <td>毕业时间</td>
            <td><input type="date" name="graduation" value="<fmt:formatDate value="${requestScope.cv.graduationDate}" pattern="yyyy-MM-dd"/>"></td>
            <td>期望薪资</td>
            <script>
                $(function () {
                    var salary = ${requestScope.cv.salary}
                    if(4500 == salary){
                        $("#select5").attr("selected",true)
                    }else if (5500 == salary) {
                        $("#select6").attr("selected",true)
                    }else if (7500 == salary) {
                        $("#select7").attr("selected",true)
                    }else if (8500 == salary) {
                        $("#select8").attr("selected",true)
                    }else {
                        $("#select9").attr("selected",true)
                    }
                })
            </script>
            <td>
                <select name="salary" id="salary">
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
                <textarea name="exprience">${requestScope.cv.exprience}</textarea>
            </td>
            <td>联系电话</td>
            <td><input type="text" name="phone" value="${requestScope.cv.phone}"></td>
        </tr>
        <tr>
            <td><input type="submit" value="提交"></td>
            <td><input type="reset" value="重置"></td>
        </tr>
    </table>
</form>
<a href="getCv">返回</a>
</body>
</html>
