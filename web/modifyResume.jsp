<%@ page import="java.sql.SQLException" %>
<%@ page import="com.workweb.more_person" %>
<%@ page import="com.workweb.more_personDao" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="connection" scope="page" class="com.workweb.Jdbcconn" />
<html>
<head>
    <meta charset="UTF-8">
    <title>修改简历</title>
    <link href="images/icon.png" rel="shortcut icon" />
    <link href="https://cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/Resume.css">
</head>
<body>
<%
    String ID = request.getParameter("id");
    try {
        List<more_person> list = more_personDao.getInstance().selectAllId(ID);
        for (more_person e : list) {
%>

<div id="head">
    <div class="container clearFix">
        <div class="pull-left"><img src="images/logo.png" alt=""></div>
    </div>
</div>

<div class="wrap">
    <div class="user-info">
        <form action="reviseResume" method="post">
            <input type="hidden" name="id" value="${param.id}">
            <section class="page-title clearfix">
                <h3>
                    修改简历
                    <em class="tips-required">
                        必填
                        <i></i>
                    </em>
                </h3>
            </section>
            <!-- 基本信息-->
            <section class="work-exp">
                <h3 class="info-title">
                    <i class="icons24 icon24-work-exp"></i>
                    基本信息
                    <span>填写您的基本信息</span>
                </h3>
                <div class="work-exp-content">
                    <dl>
                        <dd>
                            <span class="module-small">
                                <input class="text input-xlarge width-large"
                                       type="text" name="realname" value="<%=e.getReealname()%>">
                            </span>
                            <span>

                            </span>
                        </dd>
                        <dd>
                            <span class="module-small">
                                <input class="text input-xlarge width-large" name="phone" value="<%=e.getPhone()%>">
                            </span>
                        </dd>
                        <dd>
                            <span class="module-small">
                                <input class="text input-xlarge width-large" name="email" value="<%=e.getEmail()%>">
                            </span>
                        </dd>
                        <dd>
                            <span class="module-small">
                                <input class="text input-xlarge width-large" name="skill" value="<%=e.getSkill()%>">
                            </span>
                        </dd>
                    </dl>
                </div>
            </section>
            <!-- 教育经历-->
            <section class="edu-exp">
                <h3 class="info-title">
                    <i></i>
                    教育背景
                    <span>体现您的学习和专业能力</span>
                </h3>

                <div class="edu-exp-content">
                    <dl>
                        <dd>
                            <input type="text" name="school" class="text input-xlarge width-large"
                                   value="<%=e.getSchool()%>">
                            <select id="input_select" name="maxEducation" value="<%=e.getEducation()%>">
                                <option value="专科">专科</option>
                                <option value="本科">本科</option>
                                <option value="研究生">研究生</option>
                                <option value="博士">博士</option>
                                <option value="硕士">硕士</option>
                            </select>
                        </dd>
                        <dd>
                            <input type="text"  name="major" class="text input-xlarge width-large"
                                   value="<%=e.getMajor()%>">
                            <input type="text" name="enddate" class="text input-xlarge width-large"
                                   style="width: 210px" value="<%=e.getInter()%>">
                        </dd>
                    </dl>
                </div>
            </section>

            <!-- 基本信息-->
            <section class="work-exp">
                <h3 class="info-title">
                    校园经历
                    <span>参加社团参加活动</span>
                </h3>
                <div class="work-exp-content">
                    <dl>
                        <dd>
                            <div class="job-duty-details">
                                <div class="text-content">
                                    <textarea class="job-content" name="project" style="height: 100px;width: 400px"><%=e.getProject()%></textarea>
                                </div>
                            </div>
                        </dd>
                        <dd>
                            <div class="job-duty-details">
                                <div class="text-content">
                                    <textarea class="job-content" name="award"  style="height: 100px;width: 400px"><%=e.getAward()%></textarea>
                                </div>
                            </div>
                        </dd>
                        <dd>
                            <div class="job-duty-details">
                                <div class="text-content">
                                    <textarea class="job-content" name="compusExperise"  style="height: 100px;width: 400px"><%=e.getCampusexperience()%></textarea>
                                </div>
                            </div>
                        </dd>
                        <dd>
                            <input type="submit" class="button_input" placeholder="修改">
                        </dd>
                    </dl>
                </div>
            </section>
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
</body>
</html>
