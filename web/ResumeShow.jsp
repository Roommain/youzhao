<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="com.workweb.Jdbcconn" %>
<%@ page import="com.workweb.ResumeDao" %>
<%@ page import="com.workweb.ResumeJavabean" %>
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
    <link rel="stylesheet" href="css/jlstyle.css">
    <title>更多信息</title>
</head>
<body>
<%
    String ID = request.getParameter("id");
    try {
        List<ResumeJavabean> list = ResumeDao.getInstance().selectById(ID);
        for (ResumeJavabean e : list) {
%>
<div id="head">
    <div class="container clearFix">
        <div class="pull-left"><img src="images/logo.png" alt=""></div>
        <p class="pull-left">邮招聘信息发布平台</p>
    </div>
</div>
<div class="bread-box main-width">
    <a href="index.jsp">首页</a>
    <b target="_self"><%=e.getRealName()%>个人简历信息</b>
</div>
<div id="resume">
    <div class="res_name ">
        <div class="pull-left">
            <img src="images/111.png" alt="头像">
        </div>
        <div class="pull-right name_1">
            <p><%=e.getRealName()%></p>
            <div><span>联系电话：</span><span><%=e.getPhone()%></span></div>
            <div><span>电子邮箱：</span><span><%=e.getEmail()%></span></div>
        </div>
    </div>
    <div class="education">
        <div class="pull-left">
            <div class="edu">教育背景</div>
        </div>
        <div class="edu_2 pull-right">
            <table>
                <tr>
                    <td>毕业时间</td>
                    <td>毕业学校</td>
                    <td>所学专业</td>
                    <td>最高学历</td>
                </tr>
                <tr>
                    <td><%=e.getEndDa()%></td>
                    <td><%=e.getSchool()%></td>
                    <td><%=e.getSkill()%></td>
                    <td><%=e.getMaxEducation()%></td>
                </tr>
            </table>
        </div>
    </div>
    <div class="res_project">
        <div class="pull-left">
            <div class="pro_1">项目经验</div>
        </div>
        <div class="pull-right">
            <div class="pro_2">
                <%=e.getProject()%>
            </div>
        </div>
    </div>
    <div class="res_reward">
        <div class="pull-left">
            <div class="rew_1">所获奖项</div>
        </div>
        <div class="pull-right">
            <div class="rew_2">
                <%=e.getAward()%>
            </div>
        </div>
    </div>
    <div class="res_campus">
        <div class="pull-left">
            <div class="cam_1">校园经历</div>
        </div>
        <div class="pull-right">
            <div class="cam_2">
                <%=e.getCompusExperise()%>
            </div>
        </div>
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
</body>
</html>
