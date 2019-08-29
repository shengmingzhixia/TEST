<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019\8\27 0027
  Time: 10:09
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
    <title>海大同公司首页</title>
    <link href="css/slider.css" rel="stylesheet" type="text/css"/>
    <link href="css/common.css" rel="stylesheet" type="text/css"/>
    <link href="css/index.css" rel="stylesheet" type="text/css"/>
    <script src="js/jquery-1.7.2.js"></script>
    <style>
        * {
            margin: 0;
            padding: 0;
            list-style-type: none;
        }

        a, img {
            border: 0;
        }

        #cont {
            position: relative;
            width: 730px;
            height: 454px;
            margin: 40px auto 0 auto
        }

        .imm a {
            position: absolute
        }

        .btn ul {
            position: absolute;
            z-index: 10000;
            bottom: 40px;
            right: 20px;

        }

        .btn ul li {
            width: 20px;
            height: 20px;
            background-color: #cccccc;
            border-radius: 50%;
            list-style: none;
            float: left;
            margin: 0 5px;
            text-align: center;
            color: white;
            line-height: 20px;
            cursor: pointer;
        }

        .btn ul li.on {
            background-color: aquamarine;
        }

        .diin {
            width: 100%;
            height: 30px;
            background-color: black;
            opacity: 0.5;
            position: absolute;
            bottom: 0;
            color: white;
            z-index: 10000;
        }

        #jiao {
            display: none;
        }

        #left {
            width: 35px;
            height: 50px;
            background-color: #555555;
            opacity: 0.6;
            z-index: 9999;
            display: block;
            position: absolute;
            top: 50%;
            left: 20px;
            color: white;
            font-size: 20px;
            line-height: 50px;
            text-align: center;
            text-decoration: none;

        }

        #right {
            width: 35px;
            height: 50px;
            background-color: #555555;
            opacity: 0.6;
            z-index: 9999;
            display: block;
            position: absolute;
            top: 50%;
            right: 20px;
            color: white;
            font-size: 20px;
            line-height: 50px;
            text-align: center;
            text-decoration: none;

        }
    </style>
    <style>
        body, ul, h2, p {
            margin: 0;
            padding: 0;
        }

        li {
            list-style: none;
        }

        a {
            text-decoration: none;
        }

        #box {
            width: 800px;
            padding: 10px 24px 20px;
            background: #FFFAFA;
            overflow: hidden;
            margin: 20px auto 0;
        }

        .left {
            width: 400px;
            float: left;
        }

        .right {
            width: 400px;
            float: right;
        }

        #box h2 {
            height: 38px;
            border-bottom: 1px solid #D2A1A1;
            background: url(/imagesforcode/201211/4401/H2_Bg.png) no-repeat 0 10px;
            padding-left: 20px;
        }

        #box h2 strong {
            float: left;
            line-height: 38px;
            color: #885050;
            font-weight: normal;
        }

        #box h2 a {
            float: right;
            width: 52px;
            height: 14px;
            background: url(/imagesforcode/201211/4401/a_bg.png) no-repeat;
            font-size: 12px;
            text-indent: 10px;
            color: #fff;
            line-height: 12px;
            font-weight: normal;
            margin-top: 10px;
        }

        #box li {
            height: 30px;
            position: relative;
            border-bottom: 1px dashed #D1A1A1;
        }

        #box li div, #box li p {
            height: 30px;
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
        }

        #box li p {
            background: #fff;
            opacity: 0;
            filter: alpha(opacity=0);
        }

        #box li div a, #box li div span {
            line-height: 30px;
            font-size: 12px;
            height: 30px;
        }

        #box li div a {
            float: left;
            background: url(/imagesforcode/201211/4401/li_bg.gif) 8px 12px no-repeat;
            padding-left: 20px;
            color: #7F5454;
            width: 172px;
            overflow: hidden;
        }

        #box li div span {
            padding-right: 10px;
            float: right;
            color: #CF9494;
        }
    </style>
    <script type="text/javascript">
        window.onload = function () {
            var oBox = document.getElementById("box");
            var aLi = document.getElementsByTagName('li');
            var i = 0;
            for (i = 0; i < aLi.length; i++) {
                var oP = aLi[i].getElementsByTagName('p')[0];
                oP.iAlpha = 0;
                oP.time = null;
                aLi[i].onmouseover = function () {
                    var oP = this.getElementsByTagName('p')[0];
                    oP.time ? clearInterval(oP.time) : "";
                    oP.style.opacity = 1;
                    oP.style.filter = "alpha(opacity=100)";
                    oP.iAlpha = 100;
                }
                aLi[i].onmouseout = function () {
                    starmove(this.getElementsByTagName('p')[0]);
                };
            }
        };

        function starmove(obj) {
            obj.time ? clearInterval(obj.time) : "";
            obj.time = setInterval(function () {
                domove(obj);
            }, 14);
        }

        function domove(obj) {
            var iSpeed = 5;
            if (obj.iAlpha <= iSpeed) {
                clearInterval(obj.time);
                obj.iAlpha = 0;
                obj.time = null;
            }
            else {
                obj.iAlpha -= iSpeed;
            }
            obj.style.opacity = obj.iAlpha / 100;
            obj.style.filter = "alpha(opacity=" + obj.iAlpha + ")";
        }

    </script>
</head>
<body>
<%
    Object message = request.getAttribute("message");
    if (message != null) {
%>
<script>
    alert('${requestScope.message}')
</script>
<%
    }
%>
<div class="container header">
    <div class="span5">
        <div class="logo">
            <a>
                <a href="http://www.zhizuobiao.com/"><img src="img/logo.jpg" alt="海同"/></a>
            </a>
        </div>
    </div>
    <div class="span9">
        <div class="headerAd">

        </div>
    </div>
    <%@ include file="menu.jsp" %>
</div>

<div class="container index">
    <div id="cont">

        <div class="lii"></div>
        <div class="btn" id="btn">
            <ul>
                <li class="on">1</li>
                <li>2</li>
                <li>3</li>
                <li>4</li>
                <div style="clear: both"></div>
            </ul>
        </div>
        <div class="imm" id="imm">
            <a href="1" target="_blank"><img src="img/p1.png" alt="第一章"></a>
            <a href="2" target="_blank"><img src="img/p2.png" alt="第二章"></a>
            <a href="3" target="_blank"><img src="img/p3.png" alt="第三章"></a>
            <a href="4" target="_blank"><img src="img/p4.png" alt="第四章"></a>
        </div>
        <div id="jiao">
            <a href="#" id="left">&lt;</a>
            <a href="#" id="right">&gt;</a>
        </div>
    </div>
    <script>
        var tt = null;
        var kkk;
        var n = 0;
        var timer = 0;
        window.onload = function () {
            var li = document.getElementById("btn").getElementsByTagName("li");
            kkk = document.getElementById("imm").getElementsByTagName("a");
            for (var i = 0; i < kkk.length; i++) {
                if (i != 0) {
                    kkk[i].style.opacity = 0;
                }
            }
            for (var j = 0; j < li.length; j++) {
                li[j].onmouseover = function () {
                    var that = this;
                    tt = setTimeout(function () {
                        var index = that.innerHTML - 1;
                        n = index;
                        if (index < kkk.length) {
                            for (var o = 0; o < li.length; o++) {
                                li[o].className = "";
                                kkk[o].style.opacity = 0;
                                kkk[o].style.zIndex = 9998;
                            }
                            that.className = "on";
                            kkk[index].style.opacity = 1;
                            kkk[index].style.zIndex = 9999;
                            kkk[index].style.transition = "opacity 0.8s";
                            leftf(-300, 0, kkk[index]);
                        }
                    }, 100);

                };
                li[j].onmouseout = function () {
                    clearTimeout(tt)
                }
            }


            var left = document.getElementById("left");
            var right = document.getElementById("right");
            var jiao = document.getElementById("jiao");
            var body = document.getElementById("cont");

            timer = setInterval("autoplay()", 5000);
            body.onmouseover = function () {
                jiao.style.display = "block";
                clearInterval(timer);
            };
            body.onmouseout = function () {
                jiao.style.display = "none";
                timer = setInterval("autoplay()", 5000);
            };
            left.onclick = function () {
                if (n > 0) {
                    n--
                } else if (n == 0) {
                    n = kkk.length - 1;
                }
                var li = document.getElementById("btn").getElementsByTagName("li");
                li[n].onmouseover()
            };
            right.onclick = function () {
                n = n >= (kkk.length - 1) ? 0 : ++n;
                var li = document.getElementById("btn").getElementsByTagName("li");
                li[n].onmouseover()
            }
        }

        ;

        function leftf(start, end, ele) {
            var tt = setInterval(function () {
                start += 10;
                ele.style.left = start + "px";
                if (start == end) {
                    clearInterval(tt)
                }
            }, 20)
        }

        function autoplay() {
            n = n >= (kkk.length - 1) ? 0 : ++n;
            var li = document.getElementById("btn").getElementsByTagName("li");
            li[n].onmouseover()
        };
    </script>
</div>
<div id="box">
    <div class="left">
        <h2><strong>每日资讯</strong><a href="#nogo">more</a></h2>
        <ul>
            <li>
                <p></p>
                <div>
                    <a href="#nogo">每日海量招聘资讯不停更新</a>
                    <span>2018-05-29</span>
                </div>
            </li>
            <li>
                <p></p>
                <div>
                    <a href="#nogo">技术大咖评测体验抢先看</a>
                    <span>2018-03-27</span>
                </div>
            </li>
            <li>
                <p></p>
                <div>
                    <a href="#nogo">面试不成功？发现面试成功小技巧</a>
                    <span>2018-05-22</span>
                </div>
            </li>
            <li>
                <p></p>
                <div>
                    <a href="#nogo">进入招聘帮忙APP 发现你专属的HR</a>
                    <span>2018-05-19</span>
                </div>
            </li>
            <li>
                <p></p>
                <div>
                    <a href="#nogo">中国科技企业影响力榜单揭晓</a>
                    <span>2015-05-19</span>
                </div>
            </li>
            <li>
                <p></p>
                <div>
                    <a href="#nogo">加入海同 你也能成为海同人</a>
                    <span>2018-05-19</span>
                </div>
            </li>
            <li>
                <p></p>
                <div>
                    <a href="#nogo">面试圈水太深?专家帮您涨知识</a>
                    <span>2018-05-19</span>
                </div>
            </li>
        </ul>
    </div>
    <div class="right">
        <h2><strong>技术大赏</strong><a href="#nogo">more</a></h2>
        <ul>
            <li>
                <p></p>
                <div>
                    <a href="#nogo">JavaEE从入门到入土</a>
                    <span>2018-05-29</span>
                </div>
            </li>
            <li>
                <p></p>
                <div>
                    <a href="#nogo">MySQL从建库到删库</a>
                    <span>2018-05-27</span>
                </div>
            </li>
            <li>
                <p></p>
                <div>
                    <a href="#nogo">Oracle从入门到删库跑路</a>
                    <span>2018-05-19</span>
                </div>
            </li>
            <li>
                <p></p>
                <div>
                    <a href="#nogo">Spring从小白到光头</a>
                    <span>2018-03-19</span>
                </div>
            </li>
            <li>
                <p></p>
                <div>
                    <a href="#nogo">JavaScript从帅哥到地中海的完美转身</a>
                    <span>2018-05-19</span>
                </div>
            </li>
            <li>
                <p></p>
                <div>
                    <a href="#nogo">JQuery：你已经不需要头发了</a>
                    <span>2018-05-19</span>
                </div>
            </li>
            <li>
                <p></p>
                <div>
                    <a href="#nogo">教你如何成为一个成功的码农</a>
                    <span>2018-05-19</span>
                </div>
            </li>
        </ul>
    </div>
</div>
<div class="container footer">
    <div class="span24">
        <div class="copyright">Copyright © 2019-2019 陈国勇自用招聘系统 版权所有</div>
    </div>
</div>
</body>
</html>