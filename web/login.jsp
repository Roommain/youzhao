<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>登录界面</title>
    <link  rel="stylesheet" type="text/css" href="css/login.css" >
</head>
<body>
<div class="head_park">
</div>
<div class="containr">
    <div class="warpper" style="width: 100%">
        <div id="block" class="content">
            <div id="errorMsg" class="msg-wrapper">
                <p class="error-msg"></p>
            </div>
            <div class="login">
                <form action="login" method="post">
                    <div id="userInfoPanel">
                        <input id="appCode" type="hidden" value="">
                        <div style="height: 40px"></div>

                        <input name="account" id="account"type="text" placeholder="用户名">
                        <input name="password" id="password" placeholder="密码" type="password">
                        <div class="login-option" >
                            <input id="submitLogin" type="submit" class="btn-active" value="登录">
                        </div>

                        <div class="login-other">
                            <div>
                                <a href="#" id="resetPassword" style="color: #fc7256" >忘记密码</a>
                            </div>
                            <div>
                                <a href="register.jsp" id="register" style="color: #fc7256">注册</a>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>