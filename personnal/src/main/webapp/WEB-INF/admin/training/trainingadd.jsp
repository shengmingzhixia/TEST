<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019\8\28 0028
  Time: 9:52
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
    <title>添加新的培训信息</title>
    <link href="css/main.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-1.7.2.js"></script>
</head>
<body>
<div id="mainDiv">

    <%@ include file="../../main/head.jsp" %>

    <div id="centerDiv">

        <%@ include file="../../main/left.jsp" %>


        <div id="right">
            <%@ include file="../../main/clock.jsp" %>
            <br/><br/>
            <div class="col-sm-10">
                <legend>添加培训信息</legend>
                <form action="addtrain" method="post">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label>标&emsp;题：</label>
                            <input type="text" name="t_title" placeholder="标题" class="form-control" required>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label>选&emsp;择&emsp;地&emsp;址：</label>
                            <input type="text" name="t_address" placeholder="地址" class="form-control" required>
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="form-group">
                            <label>详&emsp;情&emsp;描&emsp;述：</label>
                            <textarea placeholder="内容" name="t_context" class="form-control"
                                      maxlength="100" required
                                      style="height: 90px;resize: none"></textarea>
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="form-group">
                            <label>开始时间：</label>
                            <input type="datetime-local" name="t_start_time" class="form-control" required>
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="form-group">
                            <label>结束时间：</label>
                            <input type="datetime-local" name="t_end_time" class="form-control" required>
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="form-group">
                            &emsp;<input type="submit" value="提交草稿" class="form-control btn btn-primary">
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
