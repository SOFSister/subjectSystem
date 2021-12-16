<%--
  Created by IntelliJ IDEA.
  User: 87428
  Date: 2021/12/15
  Time: 15:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>已修课程</title>


    <!-- Plugin styles -->
    <link rel="stylesheet" href="../vendors/bundle.css" type="text/css">

    <!-- Datepicker -->
    <link rel="stylesheet" href="../vendors/datepicker/daterangepicker.css">

    <!-- Slick -->
    <link rel="stylesheet" href="../vendors/slick/slick.css">
    <link rel="stylesheet" href="../vendors/slick/slick-theme.css">

    <!-- Vmap -->
    <link rel="stylesheet" href="../vendors/vmap/jqvmap.min.css">

    <!-- App styles -->
    <link rel="stylesheet" href="../css/app.min.css" type="text/css">

    <!-- DataTable -->
    <link rel="stylesheet" href="../vendors/dataTable/dataTables.min.css" type="text/css">

    <!-- Prism -->
    <link rel="stylesheet" href="../vendors/prism/prism.css" type="text/css">
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
        <a href="admIndex.jsp">
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
            <h5>管理员</h5>
            <p class="text-muted">管理端</p>
            <ul class="nav">
                <li class="nav-item">
                    <a href="#" class="btn nav-link bg-success-bright" title="登出" data-toggle="tooltip">
                        <i data-feather="log-out"></i>
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
                <a href="admIndex.jsp">
                    <i class="nav-link-icon" data-feather="bar-chart-2"></i>
                    <span>编辑课程</span>
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
                <a href="admIndex.jsp">
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


        <div class="container">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-sm-12 col-md-6">
                            <div class="dataTables_length" >
                                <button id="add_course_btn" class="btn btn-primary">添加课程</button>
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
                            <th>课程类型</th>
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
                                <button class="btn btn-primary" style="height: 25px;">编辑</button>
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
                                <button class="btn btn-primary" style="height: 25px;">编辑</button>
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
                                <button class="btn btn-primary" style="height: 25px;">编辑</button>
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
                                <button class="btn btn-primary" style="height: 25px;">编辑</button>
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
                            <th>课程类型</th>
                            <th>操作</th>
                        </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <!-- end::main-content -->

    <!-- 模态框（Modal） -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        添加课程
                    </h4>
                </div>
                <div class="modal-body" id="modal-body">
                    <form>
                        <div class="form-group">
                            <label for="course_id">*课程编码</label>
                            <input id="course_id" type="text" class="form-control" required autofocus oninput="value=value.replace(/[^\d]/g,'')">
                        </div>
                        <div class="form-group">
                            <label for="course_name">*课程名称</label>
                            <input id="course_name" type="text" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label for="course_professional">适用专业</label>
                            <select class="form-control" id="course_professional">
                                <option value="全部">全部</option>
                                <option value="软件工程">软件工程</option>
                                <option value="计算机科学与技术">计算机科学与技术</option>
                                <option value="数学与应用数学">数学与应用数学</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="course_term">*开设学期</label>
                            <input id="course_term" type="text" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label for="course_all">*课程人数</label>
                            <input id="course_all" type="text" class="form-control" required oninput="value=value.replace(/[^\d]/g,'')">
                        </div>
                        <div class="form-group">
                            <label for="course_type">课程类型</label>
                            <select class="form-control" id="course_type">
                                <option value="全部">全部</option>
                                <option value="专业选修课">专业选修课</option>
                                <option value="公共任选课">公共任选课</option>
                                <option value="专业必修课">专业必修课</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="course_pid">前置课程代码</label>
                            <input id="course_pid" type="text" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label for="course_info">课程简介</label>
                            <textarea class="form-control" id="course_info" rows="3"></textarea>
                        </div>
                        <hr>
                        <input type="button" id="enter_btn" class="btn btn-primary btn-block" value="确定">
                    </form>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>

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
<script src="js/admIndex.js"></script>
</body>

</html>