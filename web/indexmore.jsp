<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="com.workweb.Jdbcconn" %>
<%@ page import="com.workweb.RecruitDao" %>
<%@ page import="com.workweb.Recruit" %>
<%@ page import="java.util.List" %>
<%@ page import="java.lang.String" %>
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
    <link rel="stylesheet" href="css/add.css">
    <title>邮招聘信息发布平台</title>
</head>
<body>
<%
    String ID = request.getParameter("id");
    try {
        List<Recruit> list = RecruitDao.getInstance().selectById(ID);
        for (Recruit e : list) {
%>
<div id="head">
    <div class="container clearFix">
        <div class="pull-left"><img src="images/logo.png" alt=""></div>
        <p class="pull-left">邮招聘信息发布平台</p>
    </div>
</div>
<div id="add">
    <div class="container clearFix">
        <form action="index.jsp" method="post">
            <input type="hidden" name="id" value="${param.id}">
            <div class="Release">
                <div class="pull-left add-left">
                    <ul>
                        <li>
                            <div>公司名称：</div>
                            <div><input type="text" name="campanyName" readonly="readonly" value="<%=e.getCompanyName()%>"></div>
                        </li>
                        <li>
                            <div>职位福利：</div>
                            <div><input type="text" name="treatment" readonly="readonly" value="<%=e.getTreatment()%>"></div>
                        </li>
                    </ul>
                    <div>职位描述：</div>
                    <p><textarea readonly cols="50" rows="6" style='resize:vertical;'  name="describe"><%=e.getDescribe()%></textarea>
                    </p>
                    <div>任职要求：</div>
                    <p><textarea readonly cols="50" rows="6" style='resize:vertical;' name="requirement"><%=e.getRequirement()%></textarea>
                    </p>
                </div>
                <div class="pull-right add-right">
                    <ul>
                        <li>
                            <div>面试时间：</div>
                            <input type="text" name="interviewDate" readonly="readonly" value="<%=e.getInter()%>">
                        </li>
                        <li>
                            <div>面试地点：</div>
                            <input type="text" name="place" readonly="readonly" value="<%=e.getPlace()%>">
                        </li>
                        <li>
                            <div>联系方式：</div>
                            <input type="tel" name="phone" readonly="readonly" value="<%=e.getPhone()%>">
                        </li>
                        <li>
                            <div>截至日期：</div>
                            <input type="text" name="endDate" readonly="readonly" value="<%=e.getEndD()%>">
                        </li>
                        <li>
                            <div>工作地点：</div>
                            <input type="text" name="workplace" readonly="readonly" value="<%=e.getWorkplace()%>">
                        </li>
                        <li>
                            <div>职位发布者：</div>
                            <input type="text" name="publisher" readonly="readonly" value="<%=e.getPublisher()%>">
                        </li>
                    </ul>
                </div>
            </div>
            <div class="sub">
                <input type="submit" class="pull-left" value="返回">
            </div>
        </form>
    </div>
</div>
<%
    }
} catch (SQLException e) {
    e.printStackTrace();
%>
<%
    }
%>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
</body>
</html>

