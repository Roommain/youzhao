<!DOCTYPE html>
<html lang="en">
<head>
    <%@ page language="java" contentType="text/html; charset=UTF-8"
             pageEncoding="UTF-8"%>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>找回密码</title>
    <link rel="stylesheet" type="text/css" href="css/register.css">
</head>
<body>
<div class="contant">
    <div style="text-align: center;padding-top: 2%">
        <div style="width: 170px;height: 107px"></div>
    </div>
    <div class="personalRegis">
        <div class="head-logo" style="padding-top: 2%"></div>
        <div class="personContain">
            <div class="head-logo" style="margin-top: 18px">
                <a href="#">
                    <span class="view-title padding-ahead" style="font-weight: bold;color: #fc7256">找回密码</span>
                </a>
                <a href="login.jsp" style="margin-left: 625px">关闭</a>
            </div>
            <div class="registerItem">
                <form action="RetrievePassword" method="post">
                    <div class="logo-banner">     </div>
                    <div id="personalReg" style="padding-left: 22%">
                        <div class="information">
                            <label class="displayMess">
                                <b style="color: red;">*</b>
                                用户名
                            </label>
                            <input name="employeeName" id="employeeName" type="text" placeholder="姓名">
                            <div id="validateName" class="validate" style="display: none">
                                姓名不能为空
                            </div>
                        </div>
                        <div class="information">
                            <label class="displayMess">
                                <b style="color:red">*</b>
                                手机号
                            </label>
                            <input name="phone" id="phone" type="text" placeholder="手机号">
                            <div id="validatetelCheck" class="validate" style="display: none">
                                手机格式不对
                            </div>
                        </div>
                        <div class="information">
                            <label class="displayMess">
                                <b style="color: red;">*</b>
                                密保问题
                            </label>
                            <select name="question" class="select1">
                                <option>您母亲是？</option>
                                <option>你的小学是?</option>
                                <option>你的大学是?</option>
                            </select>
                        </div>
                        <div class="information">
                            <label class="displayMess">
                                <b style="color: red">*</b>
                                密保问题答案
                            </label>
                            <input  name="answer" id="answer" type="text" placeholder="输入密保问题">
                        </div>

                        <div class="information">
                            <div class="information">
                                <label class="displayMess">
                                    <b style="color: red;">*</b>
                                    你的身份
                                </label>
                                <select name="type" class="select2">
                                    <option>雇主</option>
                                    <option>学生</option>
                                </select>
                            </div>
                        </div>

                        <div class="information">
                            <label class="displayMess">
                                <b style="color: red;">*</b>
                                密码
                            </label>
                            <input name="password" id="password" placeholder="密码" type="password">
                            <div id="validatepass" class="validate" style="display: none">
                                密码不能为空
                            </div>
                        </div>
                        <div class="information">
                            <label class="displayMess">
                                <b style="color: red">*</b>
                                确认密码
                            </label>
                            <input name="rePassword" id="rePassword" placeholder="确认密码" type="password">
                            <div id="validateRepss" class="validate" style="display:none">
                                确认密码不能为空
                            </div>
                            <div id="warning_desc" class="validate" style="display:none">
                                密码不一致
                            </div>
                        </div>
                        <div class="information">
                            <input id="personRegister" type="submit" class="btn-active" value="提&nbsp;交" style="margin-left: 55px;">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>