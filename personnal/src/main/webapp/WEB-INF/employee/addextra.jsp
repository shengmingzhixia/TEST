<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019\8\31 0031
  Time: 11:14
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
    <title>申请加班</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/customer.css" type="text/css"/>
    <script src="js/jquery-1.7.2.js"></script>
    <link href="css/main.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div id="mainDiv">

    <%@ include file="../main/head.jsp" %>

    <div id="centerDiv">

        <%@ include file="../main/left.jsp" %>


        <div id="right">
            <%@ include file="../main/clock.jsp" %>
            <br/><br/>

            <div class="col-sm-10">
                <form action="addExtra" method="post">
                    <br/>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label>开&emsp;始&emsp;时&emsp;间：</label>
                            <input type="datetime-local" name="start_date" class="form-control" required>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label>结&emsp;束&emsp;时&emsp;间：</label>
                            <input type="datetime-local" name="end_date" class="form-control" required>
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="form-group">
                            <label>申&emsp;请&emsp;加&emsp;班&emsp;理&emsp;由：</label>
                            <textarea name="ex_reason" maxlength="100" style="height: 90px;resize: none"
                                      class="form-control" required></textarea>
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
    </div>
    <div id="bottomDiv"></div>
</div>
</body>
</html>
