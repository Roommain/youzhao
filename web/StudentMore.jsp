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

<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<%--<%@page import="java.util.List"%>--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="images/icon.png" rel="shortcut icon" />
    <link href="https://cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/MoreInfomation.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/response.css">
    <title>更多信息</title>
</head>
<body>
<div id="head">
    <div class="container clearFix">
        <div class="pull-left"><img src="images/logo.png" alt=""></div>
        <p class="pull-left">邮招聘信息发布平台</p>
    </div>
</div>
<div class="meun-box">
    <div class="main-width">
        <a class="a" href="index.jsp">首页</a>
        <a class="a" href="more.jsp">企业招聘信息</a>
        <a class="a" href="#">个人求职信息</a>
        <a class="a" href="more.jsp">修改企业招聘信息</a>
    </div>
</div>
<div class="fc">
    <img src="./images/news.png">
</div>
<div class="bread-box main-width">
    <a href="index.jsp">首页</a>
    <b target="_self"> 企业招聘信息</b>
</div>
<div class="main-width about-content">
    <div class="tub_1">
        <div class="tab">
            <table>
                <tr style="color: white">
                    <td>招聘公司</td>
                    <td>招聘职位</td>
                    <td>面试时间</td>
                    <td>面试地点</td>
                    <td>联系方式</td>
                    <td>发布时间</td>
                    <td style="font-size: 14px">投递</td>
                </tr>
            </table>
        </div>
    </div>
    <div class="tub_2">
        <div class="tab">
            <table>
                <%
                    try {
                        List<Recruit> list = RecruitDao.getInstance().selectAllDesc();
                        for (Recruit e : list) {
                %>
                <tr>
                    <td><%=e.getCompanyName()%></td>
                    <td><%=e.getDescribe()%></td>
                    <td><%=e.getInter()%></td>
                    <td><%=e.getWorkplace()%></td>
                    <td><%=e.getPhone()%></td>
                    <td><%=e.getSystemTime()%></td>
                    <td>
                        <a href="Resume.jsp?id=<%=e.getId()%>">投递</a>
                    </td>
                </tr>
                <%
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                %>
                <tr>
                    <th colspan="7">查询失败，请明天再试。</th>
                </tr>
                <%
                    }
                %>
            </table>
        </div>
    </div>
</div>
</body>
</html>

