<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>完善简历</title>
    <link href="images/icon.png" rel="shortcut icon" />
    <link href="https://cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/Resume.css">
</head>
<body>
<div id="head">
    <div class="container clearFix">
        <div class="pull-left"><img src="images/logo.png" alt=""></div>
    </div>
</div>

<div class="wrap">
    <div class="user-info">
        <form action="resume" method="post" onsubmit="return checkForm()">
            <input type="hidden" name="id" value="${param.id}">
            <section class="page-title clearfix">
                <h3>
                    完善简历
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
                                       type="text" name="realName" placeholder="真实姓名">
                            </span>
                            <span>

                            </span>
                        </dd>
                        <dd>
                            <span class="module-small">
                                <input class="text input-xlarge width-large" name="phone" placeholder="手机">
                            </span>
                        </dd>
                        <dd>
                            <span class="module-small">
                                <input class="text input-xlarge width-large" name="email" placeholder="邮箱">
                            </span>
                        </dd>
                        <dd>
                            <span class="module-small">
                                <input class="text input-xlarge width-large" name="skill" placeholder="专业技能">
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
                                   placeholder="学校名称">

                            <%--                            <input type="text" name="maxEducation" class="text input-xlarge width-large"
                                                               placeholder="最高学历">--%>
                            <select id="input_select" name="maxEducation">
                                <option value="专科">专科</option>
                                <option value="本科">本科</option>
                                <option value="研究生">研究生</option>
                                <option value="博士">博士</option>
                                <option value="硕士">硕士</option>
                            </select>
                        </dd>
                        <dd>
                            <input type="text"  name="major" class="text input-xlarge width-large"
                                   placeholder="所属专业">
                            <input type="date" name="endDate" class="text input-xlarge width-large"
                                   style="width: 210px" placeholder="毕业年份">
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
                                    <textarea class="job-content" name="project" placeholder="项目经历" style="height: 100px;width: 400px"></textarea>
                                </div>
                            </div>
                        </dd>
                        <dd>
                            <div class="job-duty-details">
                                <div class="text-content">
                                    <textarea class="job-content" name="award" placeholder="获奖经历" style="height: 100px;width: 400px"></textarea>
                                </div>
                            </div>
                        </dd>
                        <dd>
                            <div class="job-duty-details">
                                <div class="text-content">
                                    <textarea class="job-content" name="compusExperise" placeholder="校园经历" style="height: 100px;width: 400px"></textarea>
                                </div>
                            </div>
                        </dd>
                        <dd>
                            <input type="submit" class="button_input" placeholder="提交">
                            <input type="reset" class="button_input">
                        </dd>
                    </dl>
                </div>
            </section>
        </form>
    </div>
</div>
<script type="text/javascript" src="js/yanz.js"></script>
</body>
</html>
