<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<div id="current" align="center">&nbsp;&nbsp;&nbsp;&nbsp;
    <span id="spanDate" style="font-size: 20px;font-weight: bold;">
        <script>
            document.getElementById('spanDate').innerHTML = new Date().toLocaleString() + ' 星期' + '日一二三四五六'.charAt(new Date().getDay());
            setInterval("document.getElementById('spanDate').innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());", 1000);
        </script>
</span>
</div>