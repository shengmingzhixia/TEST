<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019\8\31 0031
  Time: 16:05
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
    <title>更新培训信息</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-1.7.2.js"></script>
    <link href="css/main.css" rel="stylesheet" type="text/css"/>
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
                <form action="trainupdate" method="post">
                    <br/>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label>培&emsp;训&emsp;标&emsp;题：</label>
                            <input type="text" name="t_title" class="form-control" value="${training.t_title}" required>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label>培&emsp;训&emsp;地&emsp;址：</label>
                            <input type="text" name="t_address" class="form-control" value="${training.t_address}" required>
                        </div>
                    </div>

                    <div class="col-sm-6">
                        <div class="form-group">
                            <label>开&emsp;始&emsp;时&emsp;间：</label>
                            <input type="datetime-local" name="t_start_time" class="form-control" value="${training.t_start_time}" required>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label>结&emsp;束&emsp;时&emsp;间：</label>
                            <input type="datetime-local" name="t_end_time" class="form-control" value="${training.t_end_time}" required>
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="form-group">
                            <label>培&emsp;训&emsp;内&emsp;容：</label>
                            <textarea name="t_context" maxlength="100" style="height: 90px;resize: none"
                                      class="form-control" required>
                                ${training.t_context}
                            </textarea>
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="form-group">
                            <input type="hidden" value="${training.t_id}" name="t_id"/>
                            <input type="submit" value="提交" class="form-control btn btn-primary">
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
