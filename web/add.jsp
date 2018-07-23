<%--
  Created by IntelliJ IDEA.
  User: L
  Date: 2018/7/20
  Time: 17:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<div id="head">
    <div class="container clearFix">
        <div class="pull-left"><img src="images/logo.png" alt=""></div>
        <p class="pull-left">邮招聘信息发布平台</p>
    </div>
</div>
<div id="add">
    <div class="container clearFix">
        <form action="addrecruit" method="post">
            <div class="Release">
                <div class="pull-left add-left">
                    <ul>
                        <li>
                            <div>公司名称：</div>
                            <div><input type="text" name="campanyname"></div>
                        </li>
                        <li>
                            <div>职位福利：</div>
                            <div><input type="text" name="treatment"></div>
                        </li>
                    </ul>
                    <div>职位描述：</div>
                    <p><textarea cols="50" rows="6" style='resize:vertical;' name="describe"></textarea>
                    </p>
                    <div>任职要求：</div>
                    <p><textarea cols="50" rows="6" style='resize:vertical;' name="requirement"></textarea>
                    </p>

                </div>
                <div class="pull-right add-right">
                    <ul>
                        <li>
                            <div>面试时间：</div>
                            <input type="date" name="interviewdate">
                        </li>
                        <li>
                            <div>面试地点：</div>
                            <input type="text" name="place">
                        </li>
                        <li>
                            <div>联系方式：</div>
                            <input type="tel" name="phone">
                        </li>
                        <li>
                            <div>截至日期：</div>
                            <input type="date" name="enddate">
                        </li>
                        <li>
                            <div>工作地点：</div>
                            <input type="text" name="workplace">
                        </li>
                        <li>
                            <div>职位发布者：</div>
                            <input type="text" name="publisher">
                        </li>
                    </ul>
                </div>
            </div>
            <div class="sub">
                <input type="submit" value="发布">
            </div>

        </form>
    </div>
</div>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
</body>
</html>
