<%--
  Created by IntelliJ IDEA.
  User: 87428
  Date: 2021/12/15
  Time: 13:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title></title>

    <!-- Plugin styles -->
    <link rel="stylesheet" href="../vendors/bundle.css" type="text/css">

    <!-- App styles -->
    <link rel="stylesheet" href="../css/app.min.css" type="text/css">
</head>
<body class="form-membership">

<!-- begin::preloader-->
<div class="preloader">
    <svg xmlns="http://www.w3.org/2000/svg" version="1.1" width="50px" height="50px" viewBox="0 0 128 128"
         xml:space="preserve">
        <rect x="0" y="0" width="100%" height="100%" fill="#FFFFFF"/>
        <g>
            <path d="M75.4 126.63a11.43 11.43 0 0 1-2.1-22.65 40.9 40.9 0 0 0 30.5-30.6 11.4 11.4 0 1 1 22.27 4.87h.02a63.77 63.77 0 0 1-47.8 48.05v-.02a11.38 11.38 0 0 1-2.93.37z"
                  fill="#000000" fill-opacity="1"/>
            <animateTransform attributeName="transform" type="rotate" from="0 64 64" to="360 64 64"
                              dur="500ms" repeatCount="indefinite">
            </animateTransform>
        </g>
    </svg>
</div>
<!-- end::preloader -->

<div class="form-wrapper">

    <!-- logo -->
    <div id="logo">
        <img class="logo" src="../image/logo.png" alt="image">
        <img class="logo-dark" src="../image/logo.png" alt="image">
    </div>
    <!-- ./ logo -->

    <h5>登录</h5>

    <!-- form -->
    <form>
        <div class="form-group">
            <input type="text" class="form-control" placeholder="学号" required autofocus>
        </div>
        <div class="form-group">
            <input type="password" class="form-control" placeholder="密码" required>
        </div>
        <div class="form-group d-flex justify-content-between">
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" checked="" id="customCheck1">
                <label class="custom-control-label" for="customCheck1">自动登录</label>
            </div>
        </div>
        <button class="btn btn-primary btn-block">登录</button>
        <hr>
        <p class="text-muted">没有账号？</p>
        <a href="register.jsp" class="btn btn-outline-light btn-sm">立即注册！</a>
    </form>
    <!-- ./ form -->

</div>

<!-- Plugin scripts -->
<script src="../vendors/bundle.js"></script>

<!-- App scripts -->
<script src="../js/app.js"></script>
<script src="../js/login.js"></script>
</body>
</html>
