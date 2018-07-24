<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="com.workweb.Jdbcconn" %>
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
<%! ResultSet rs = null;%>
<%
    String id = request.getParameter("id");
    String goodsql = "select * from CQUPT_RECRUIT where ID="+id;
    rs = Jdbcconn.getInstance().executeQuery(goodsql);
    if(rs.next()) {
        String companyName = rs.getString("companyName");
        String describe = rs.getString("describe");
        String requirement = rs.getString("requirement");
        String place = rs.getString("place");
        String systemTime = rs.getString("systemTime");
        String treatment = rs.getString("treatment");
        String interviewDate = rs.getString("interviewDate");
        String[] arr = interviewDate.split(" ");
        String inter = arr[0];
        String phone = rs.getString("phone");
        String endDate = rs.getString("endDate");
        String[] arr2 = interviewDate.split(" ");
        String inter2 = arr[0];

        String workplace = rs.getString("workplace");
        String username = rs.getString("username");
        String publisher = rs.getString("publisher");
%>
<div id="head">
    <div class="container clearFix">
        <div class="pull-left"><img src="images/logo.png" alt=""></div>
        <p class="pull-left">邮招聘信息发布平台</p>
    </div>
</div>
<div id="add">
    <div class="container clearFix">
        <form action="changerecruit" method="post">
            <input type="hidden" name="id" value="${param.id}">
            <div class="Release">
                <div class="pull-left add-left">
                    <ul>
                        <li>
                            <div>公司名称：</div>
                            <div><input type="text" name="campanyName" value="<%=companyName%>"></div>
                        </li>
                        <li>
                            <div>职位福利：</div>
                            <div><input type="text" name="treatment" value="<%=treatment%>"></div>
                        </li>
                    </ul>
                    <div>职位描述：</div>
                    <p><textarea cols="50" rows="6" style='resize:vertical;' name="describe"><%=describe%></textarea>
                    </p>
                    <div>任职要求：</div>
                    <p><textarea cols="50" rows="6" style='resize:vertical;' name="requirement"><%=requirement%></textarea>
                    </p>
                </div>
                <div class="pull-right add-right">
                    <ul>
                        <li>
                            <div>面试时间：</div>
                            <input type="text" name="interviewDate" value="<%=inter%>">
                        </li>
                        <li>
                            <div>面试地点：</div>
                            <input type="text" name="place" value="<%=place%>">
                        </li>
                        <li>
                            <div>联系方式：</div>
                            <input type="tel" name="phone" value="<%=phone%>">
                        </li>
                        <li>
                            <div>截至日期：</div>
                            <input type="text" name="endDate" value="<%=inter2%>">
                        </li>
                        <li>
                            <div>工作地点：</div>
                            <input type="text" name="workplace" value="<%=workplace%>">
                        </li>
                        <li>
                            <div>职位发布者：</div>
                            <input type="text" name="publisher" value="<%=publisher%>">
                        </li>
                    </ul>
                </div>
            </div>
            <div class="sub">
                <input type="submit" class="pull-left" value="修改">
            </div>
        </form>
    </div>
</div>
<%
    }
%>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
</body>
</html>
