<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019\7\17 0017
  Time: 16:34
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
    <meta charset="UTF-8">
    <title>注册</title>
    <script src="js/jquery-1.7.2.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords"
          content="Trendy Flat Login Form Responsive Widget,Login form widgets, Sign up Web forms , Login signup Responsive web form,Flat Pricing table,Flat Drop downs,Registration Forms,News letter Forms,Elements"/>
    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);

    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>
    <!-- Meta tag Keywords -->
    <!--font-awesome-css-->
    <link href="css/font-awesome.css" rel="stylesheet">
    <!--//font-awesome-css-->
    <!-- css files -->
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all">
    <!-- online-fonts -->
    <link href="//fonts.googleapis.com/css?family=Roboto+Slab:100,300,400,700Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900iSlabo+27px&subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese"
          rel="stylesheet">
    <!--//online-fonts -->
    <script>
        function fun1() {
            var name = document.getElementsByName("name")[0].value;
            var reg1 = /^[A-z]\w{5,10}$/;
            if (!reg1.test(name)) {
                document.getElementById("td1").innerText = "请用字母开头，并用户名长度在6-11位之间";
                document.getElementById("td1").style.color = "red";

            } else {
                document.getElementById("td1").innerText = ""
            }
        }

        function fun2() {
            var pass = document.getElementsByName("pass")[0].value;
            if (pass.length < 5) {
                document.getElementById("td2").innerText = "密码长度不能少于5个字符";
                document.getElementById("td2").style.color = "red";

            } else {
                document.getElementById("td2").innerText = ""
            }
        }
    </script>
    <script>
        $(function () {
            $("input[name=c_name]").blur(function () {
                $.post("checkName", {c_name: $("input:eq(0)").val()}, function (obj) {
                    $("#sub1").removeAttr("disabled");
                    $("span").remove();
                    if ("用户名重复！" == obj) {
                        $("input:eq(0)").after("<span>" + obj + "</span>");
                        $("#sub1").attr("disabled", true);
                    }
                })
            })
        })
    </script>
</head>
<body>
<section class="main-w3l">
    <div class="w3layouts-main">
        <h2>Register Now</h2>
        <div class="w3ls-form">
            <form action="register" method="post">
                <div class="email-w3ls">
                    <input type="text" name="c_account" placeholder="用户名" required="">
                </div>
                <div class="w3ls-password">
                    <input type="password" name="c_pass" placeholder="密码" required="">
                </div>
                <div class="clear"></div>
                <input type="submit" value="注册" id="sub1">
            </form>
        </div>
    </div>
</section>
<!--//main-->
<!--footer-->
<div class="footer-w3l">
    <p>&copy; 2019 Trendy Flat Login Form. All rights reserved | Design by <a href="#">海同科技</a></p>
</div>
</body>
</html>
