<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="com.workweb.Jdbcconn" %>
<%@ page import="com.workweb.RecruitDao" %>
<%@ page import="com.workweb.Recruit" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="connection" scope="page" class="com.workweb.Jdbcconn" />
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link href="images/icon.png" rel="shortcut icon" />
  <link href="https://cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="css/response.css">
  <title>邮招聘信息发布平台</title>
</head>
<body>
<div id="head">
  <div class="container clearFix">
    <div class="pull-left"><img src="images/logo.png" alt=""></div>
    <p class="pull-left">邮招聘信息发布平台</p>
    <div class="pull-right clearFix aa">
      <%--<div class="search pull-left">--%>
        <%--<input type="text" placeholder="搜索">--%>
        <%--<button class="btn1" type="submit"></button>--%>
      <%--</div>--%>

      <div class="login" id="login" draggable="true">
        <span class="login1" id="login1"></span>
        <div class="sign" style="margin-left: 40px" id="hide"><a href="login.jsp" style="display: block">登陆</a></div>
        <div class="sign" id="show" style="display: none;margin-left: 30px"><a href="login.jsp"></a></div>
        <div class="sign" id="cos" style="display: none">
          <a href="index.jsp">注销</a>
        </div>
      </div>

    </div>
  </div>
</div>
<div id="box">
  <div id="img">
    <ul>
      <li class="on"><img src="images/1504943953691.jpg" alt=""></li>
      <li><img src="images/1504943990555.jpg" alt=""></li>
      <li><img src="images/1504944100013.jpg" alt=""></li>
      <li><img src="images/1504944166916.jpg" alt=""></li>
      <li><img src="images/1511410662359.jpg" alt=""></li>
      <li><img src="images/1514183702392.jpg" alt=""></li>
    </ul>
    <div class="sx">
      <a href="javascript:;" class="p" title="下一张" ></a>
      <a href="javascript:;" class="n" title="上一张" ></a>
    </div>
  </div>
  <div id="tlt">
    <ul class="clearFix">
      <li class="on"></li>
      <li></li>
      <li></li>
      <li></li>
      <li></li>
      <li></li>
    </ul>
  </div>
</div>
<div id="information">
  <div class="container">
    <div class="in_1 row">
      <div class="col-md-4 col-sm-12">
        <div class="login_search">
          <ul>
            <li class="bg2"><a href="StudentMore.jsp">学生</a></li>
            <li class="bg3"><a href="">老师</a></li>
            <li class="bg4"><a href="resumeMore.jsp">老板</a></li>
          </ul>
        </div>
        <ul class="link">
          <li class="link1"><a href="">新闻动态</a></li>
          <li class="link2"><a href="">测试工具</a></li>
          <li class="link3"><a href="">校招指南</a></li>
          <li class="link4"><a href="">职场活动</a></li>
          <li class="link5"><a href="">政策法规</a></li>
        </ul>
      </div>
      <div class="new col-md-5 col-sm-12">
        <ul class="clearFix">
          <%
            try {
              List<Recruit> list = RecruitDao.getInstance().selectAllDesc();
              for (Recruit e : list) {
          %>
          <li><a href="indexmore.jsp?id=<%=e.getId()%>"><span class="new_l"><%=e.getCompanyName()+"招"+e.getDescribe()+"工作"+e.getRequirement()+"面试地点"+e.getPlace()%></span><span class="new_r"><%=e.getSystemTime()%></span></a></li>
          <%
            }
          } catch (SQLException e) {
            e.printStackTrace();
          %>

          <%
            }
          %>
          <a class="pull-right more" href="more.jsp">更多</a>
        </ul>
      </div>
      <div class="time col-md-3 col-sm-12">
        <div class="service">服务大厅</div>
        <div class="clearFix">
          <ul>
            <li class="time1">

              <div class="aaa">
                <a href="more.jsp"><i></i>信息查看
                  <div class="bbb">
                    <div class="dian">
                      <p>点击进入</p>
                    </div>
                  </div>
                </a>
              </div>

            </li>
            <li class="time2">
              <div class="aaa">
                <a href="StudentMore.jsp"><i></i>我要求职
                  <div class="bbb">
                    <div class="dian">
                      <p>点击进入</p>
                    </div>
                  </div>
                </a>
              </div>

            </li>
            <li class="time3">
              <div class="aaa">
                <a href="authrecruit"><i></i>我要招聘
                  <div class="bbb">
                    <div class="dian">
                      <p>点击进入</p>
                    </div>
                  </div>
                </a>
              </div>
            </li>
            <li class="time4">
              <div class="aaa">
                <a href="authresume"><i></i>简历查询
                  <div class="bbb">
                    <div class="dian">
                      <p>点击进入</p>
                    </div>
                  </div>
                </a>
              </div>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</div>
<div id="cooperation">
  <div class="container">
    <div class="coo_1">本网招聘合作单位</div>
    <div class="coo_2" >
      <div class="tu" id="box2" style="left: 0;transition: all .8s ease-out;">
        <ul>
          <li><a href=""><img src="images/1eK6eN0p5q.png" alt=""></a></li>
          <li><a href=""><img src="images/JF8pwaFV6n.png" alt=""></a></li>
          <li><a href=""><img src="images/d4P5Vtqme7.png" alt=""></a></li>
          <li><a href=""><img src="images/GBPUpbqzvh.png" alt=""></a></li>
          <li><a href=""><img src="images/LcQR8dr7oG.png" alt=""></a></li>
          <li><a href=""><img src="images/oUUeTUyj6E.png" alt=""></a></li>
        </ul>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/style.js"></script>
<script type="text/javascript" src="js/jquery.cookie.js"></script>
<script type="text/javascript" src="js/cookie.js"></script>
</body>
</html>
