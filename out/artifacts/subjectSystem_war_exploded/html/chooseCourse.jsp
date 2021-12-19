<%--
  Created by IntelliJ IDEA.
  User: 87428
  Date: 2021/12/15
  Time: 13:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>
        选择课程
    </title>


    <!-- Plugin styles -->
    <link rel="stylesheet" href="../vendors/bundle.css" type="text/css">

    <!-- Fullcalendar -->
    <link rel="stylesheet" href="../vendors/fullcalendar/fullcalendar.min.css" type="text/css">

    <!-- Clockpicker -->
    <link rel="stylesheet" href="../vendors/clockpicker/bootstrap-clockpicker.min.css" type="text/css">

    <!-- Datepicker -->
    <link rel="stylesheet" href="../vendors/datepicker/daterangepicker.css" type="text/css">

    <!-- App styles -->
    <link rel="stylesheet" href="../css/app.min.css" type="text/css">
</head>

<body>

<!-- begin::preloader-->
<div class="preloader">
    <svg xmlns="http://www.w3.org/2000/svg" version="1.1" width="50px" height="50px" viewBox="0 0 128 128"
         xml:space="preserve">
            <rect x="0" y="0" width="100%" height="100%" fill="#FFFFFF" />
        <g>
            <path
                    d="M75.4 126.63a11.43 11.43 0 0 1-2.1-22.65 40.9 40.9 0 0 0 30.5-30.6 11.4 11.4 0 1 1 22.27 4.87h.02a63.77 63.77 0 0 1-47.8 48.05v-.02a11.38 11.38 0 0 1-2.93.37z"
                    fill="#000000" fill-opacity="1" />
            <animateTransform attributeName="transform" type="rotate" from="0 64 64" to="360 64 64" dur="500ms"
                              repeatCount="indefinite">
            </animateTransform>
        </g>
        </svg>
</div>
<!-- end::preloader -->

<!-- begin::navigation -->
<div class="navigation" style="height: 100vh;">

    <!-- begin::logo -->
    <div id="logo">
        <a href="../index.jsp">
            <img class="logo" src="../image/logo.png" alt="logo">
            <img class="logo-sm" src="../image/logo.png" alt="small logo">
            <img class="logo-dark" src="../image/logo.png" alt="dark logo">
        </a>
    </div>
    <!-- end::logo -->

    <!-- begin::navigation header -->
    <header class="navigation-header">
        <figure class="avatar avatar-state-success">
            <img src="../image/user/logo_03.png" class="rounded-circle" alt="image">
        </figure>
        <div>
            <h5>未登录</h5>
            <p class="text-muted">学生端</p>
            <ul class="nav">
                <li class="nav-item">
                    <a href="register.jsp" class="btn nav-link bg-info-bright" title="注册" data-toggle="tooltip">
                        <i data-feather="user"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="login.jsp" class="btn nav-link bg-success-bright" title="登录" data-toggle="tooltip">
                        <i data-feather="log-in"></i>
                    </a>
                </li>
            </ul>
        </div>
    </header>
    <!-- end::navigation header -->

    <!-- begin::navigation menu -->
    <div class="navigation-menu-body">
        <ul>
            <li class="navigation-divider">Main</li>
            <li>
                <a href="../index.jsp">
                    <i class="nav-link-icon" data-feather="bar-chart-2"></i>
                    <span>已修课程</span>
                </a>
            </li>
            <li>
                <a href="chooseCourse.jsp">
                    <i class="nav-link-icon" data-feather="check-circle"></i>
                    <span>选择课程</span>
                </a>
            </li>
            <li>
                <a href="selectedCourse.jsp">
                    <i class="nav-link-icon" data-feather="calendar"></i>
                    <span>已选课程</span>
                </a>
            </li>
            <li class="navigation-divider">Extras</li>
            <li>
                <a href="personalInformation.jsp">
                    <i class="nav-link-icon" data-feather="user"></i>
                    <span>个人信息</span>
                </a>
            </li>
        </ul>
    </div>
    <!-- end::navigation menu -->

</div>
<!-- end::navigation -->

<!-- begin::main -->
<div id="main" style="height: 100vh; overflow-y: auto;">

    <!-- begin::header -->
    <div class="header">

        <!-- begin::header left -->
        <ul class="navbar-nav">

            <!-- begin::navigation-toggler -->
            <li class="nav-item navigation-toggler">
                <a href="#" class="nav-link">
                    <i data-feather="menu"></i>
                </a>
            </li>
            <!-- end::navigation-toggler -->

            <!-- begin::header-logo -->
            <li class="nav-item" id="header-logo">
                <a href="../index.jsp">
                    <img class="logo" src="../image/logo.png" alt="logo">
                    <img class="logo-sm" src="../image/logo.png" alt="small logo">
                    <img class="logo-dark" src="../image/logo.png" alt="dark logo">
                </a>
            </li>
            <!-- end::header-logo -->
        </ul>
        <!-- end::header left -->

        <!-- begin::header-right -->
        <div class="header-right">
            <ul class="navbar-nav">

                <!-- begin::header minimize/maximize -->
                <li class="nav-item dropdown">
                    <a href="#" class="nav-link" title="Fullscreen" data-toggle="fullscreen">
                        <i class="maximize" data-feather="maximize"></i>
                        <i class="minimize" data-feather="minimize"></i>
                    </a>
                </li>
                <!-- end::header minimize/maximize -->
            </ul>

            <!-- begin::mobile header toggler -->
            <ul class="navbar-nav d-flex align-items-center">
                <li class="nav-item header-toggler">
                    <a href="#" class="nav-link">
                        <i data-feather="arrow-down"></i>
                    </a>
                </li>
            </ul>
            <!-- end::mobile header toggler -->
        </div>
        <!-- end::header-right -->
    </div>
    <!-- end::header -->

    <!-- begin::main-content -->
    <div class="main-content">

        <!-- begin::container -->
        <div class="container">

            <div class="page-header">
                <h4>未登录</h4>
                <small class="">Welcome, <span class="text-primary">同学</span></small>
            </div>
        </div>
        <!-- end::container -->

        <div class="container">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-sm-12 col-md-6">
                            <div class="dataTables_length" id="myTable_length">
                                <label>
                                    选课资格
                                    <select name="myTable_length" aria-controls="myTable"
                                            class="custom-select custom-select-sm form-control form-control-sm">
                                        <option value="10">全部</option>
                                        <option value="25">专业选修课</option>
                                        <option value="50">公共任选课</option>
                                        <option value="100">专业必修课</option>
                                    </select>
                                </label>
                            </div>
                        </div>
                    </div>
                    <hr>
                    <table id="myTable" class="table table-striped table-bordered">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>课程编码</th>
                            <th>课程名称</th>
                            <th>课程简介</th>
                            <th>适用专业</th>
                            <th>开设学期</th>
                            <th>课程人数</th>
                            <th>选课资质</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>1</td>
                            <td>225071001</td>
                            <td>网络编程</td>
                            <td>适用java语言进行服务器方面的学习与思考</td>
                            <td>软件工程</td>
                            <td>大三秋</td>
                            <td>67/80</td>
                            <td>专业选修课</td>
                            <td>
                                <button class="btn btn-primary" style="height: 25px;">添加</button>
                            </td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>225071001</td>
                            <td>网络编程</td>
                            <td>适用java语言进行服务器方面的学习与思考</td>
                            <td>软件工程</td>
                            <td>大三秋</td>
                            <td>67/80</td>
                            <td>专业选修课</td>
                            <td>
                                <button class="btn btn-primary" style="height: 25px;">添加</button>
                            </td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>225071001</td>
                            <td>网络编程</td>
                            <td>适用java语言进行服务器方面的学习与思考</td>
                            <td>软件工程</td>
                            <td>大三秋</td>
                            <td>67/80</td>
                            <td>专业选修课</td>
                            <td>
                                <button class="btn btn-primary" style="height: 25px;">添加</button>
                            </td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td>225071001</td>
                            <td>网络编程</td>
                            <td>适用java语言进行服务器方面的学习与思考</td>
                            <td>软件工程</td>
                            <td>大三秋</td>
                            <td>67/80</td>
                            <td>专业选修课</td>
                            <td>
                                <button class="btn btn-primary" style="height: 25px;">添加</button>
                            </td>
                        </tr>
                        </tbody>
                        <tfoot>
                        <tr>
                            <th>#</th>
                            <th>课程编码</th>
                            <th>课程名称</th>
                            <th>课程简介</th>
                            <th>适用专业</th>
                            <th>开设学期</th>
                            <th>课程人数</th>
                            <th>选课资质</th>
                            <th>操作</th>
                        </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <!-- end::main-content -->

    <!-- begin::footer -->
    <footer>
        <div class="container">
            <div>Copyright &copy; 2021.杭州师范大学.选课系统</div>
        </div>
    </footer>
    <!-- end::footer -->

</div>
<!-- end::main -->

<!-- Plugin scripts -->
<script src="../vendors/bundle.js"></script>

<!-- Chartjs -->
<script src="../vendors/charts/chartjs/chart.min.js"></script>

<!-- Apex chart -->
<script src="../vendors/charts/apex/apexcharts.min.js"></script>

<!-- Circle progress -->
<script src="../vendors/circle-progress/circle-progress.min.js"></script>

<!-- Peity -->
<script src="../vendors/charts/peity/jquery.peity.min.js"></script>
<script src="../js/peity.js"></script>

<!-- Datepicker -->
<script src="../vendors/datepicker/daterangepicker.js"></script>

<!-- Slick -->
<script src="../vendors/slick/slick.min.js"></script>

<!-- Vamp -->
<script src="../vendors/vmap/jquery.vmap.min.js"></script>
<script src="../vendors/vmap/maps/jquery.vmap.usa.js"></script>
<script src="../js/vmap.js"></script>

<!-- Dashboard scripts -->
<script src="../js/dashboard.js"></script>



<!-- DataTable -->
<script src="../vendors/dataTable/jquery.dataTables.min.js"></script>
<script src="../vendors/dataTable/dataTables.bootstrap4.min.js"></script>
<script src="../vendors/dataTable/dataTables.responsive.min.js"></script>
<script src="../js/datatable.js"></script>

<!-- Prism -->
<script src="../vendors/prism/prism.js"></script>



<div class="colors">
    <!-- To use theme colors with Javascript -->
    <div class="bg-primary"></div>
    <div class="bg-primary-bright"></div>
    <div class="bg-secondary"></div>
    <div class="bg-secondary-bright"></div>
    <div class="bg-info"></div>
    <div class="bg-info-bright"></div>
    <div class="bg-success"></div>
    <div class="bg-success-bright"></div>
    <div class="bg-danger"></div>
    <div class="bg-danger-bright"></div>
    <div class="bg-warning"></div>
    <div class="bg-warning-bright"></div>
</div>

<!-- App scripts -->
<script src="../js/app.js"></script>
<script src="../js/chooseCourse.js"></script>
</body>

</html>
