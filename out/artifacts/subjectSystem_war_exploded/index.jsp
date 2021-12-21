<%@ page import="user.User" %>
<%@ page import="db.UserDAO" %>
<%@ page import="course.Course" %>
<%@ page import="db.CourseDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="course.HaveCourse" %>
<%@ page import="db.HaveCourseDAO" %>
<%@ page import="db.SelectedCourseDAO" %><%--
  Created by IntelliJ IDEA.
  User: 87428
  Date: 2021/12/15
  Time: 10:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String userID=null;
    User user=null;
    try {
        userID= (String) session.getAttribute("userID");
        if(userID!=null){
           user=UserDAO.selectById(userID);
        }
    }
    catch (Exception ex){
        ex.printStackTrace();
    }
%>
<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>已修课程</title>


    <!-- Plugin styles -->
    <link rel="stylesheet" href="vendors/bundle.css" type="text/css">

    <!-- Datepicker -->
    <link rel="stylesheet" href="vendors/datepicker/daterangepicker.css">

    <!-- Slick -->
    <link rel="stylesheet" href="vendors/slick/slick.css">
    <link rel="stylesheet" href="vendors/slick/slick-theme.css">

    <!-- Vmap -->
    <link rel="stylesheet" href="vendors/vmap/jqvmap.min.css">

    <!-- App styles -->
    <link rel="stylesheet" href="css/app.min.css" type="text/css">

    <!-- DataTable -->
    <link rel="stylesheet" href="vendors/dataTable/dataTables.min.css" type="text/css">

    <!-- Prism -->
    <link rel="stylesheet" href="vendors/prism/prism.css" type="text/css">
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
        <a href="index.jsp">
            <img class="logo" src="image/logo.png" alt="logo">
            <img class="logo-sm" src="image/logo.png" alt="small logo">
            <img class="logo-dark" src="image/logo.png" alt="dark logo">
        </a>
    </div>
    <!-- end::logo -->

    <!-- begin::navigation header -->
    <header class="navigation-header">
        <figure class="avatar avatar-state-success">
            <img src="image/user/logo_03.png" class="rounded-circle" alt="image">
        </figure>
        <div>
            <%
                if(userID==null){%>
                    <h5>未登录</h5>
                <%}
                else{%>
                    <h5><%=user.getName()%></h5>
                <%}
            %>
            <p class="text-muted">学生端</p>
            <ul class="nav">
                <%
                    if(userID==null){%>
                    <li class="nav-item">
                        <a href="html/register.jsp" class="btn nav-link bg-info-bright" title="注册" data-toggle="tooltip">
                            <i data-feather="user"></i>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="html/login.jsp" class="btn nav-link bg-success-bright" title="登录" data-toggle="tooltip">
                            <i data-feather="log-in"></i>
                        </a>
                    </li>
                <%}
                else{%>
                    <li class="nav-item">
                        <a href="#" id="logout_btn" class="btn nav-link bg-success-bright" title="注销" data-toggle="tooltip">
                            <i data-feather="log-out"></i>
                        </a>
                    </li>
                <%}
                %>

            </ul>
        </div>
    </header>
    <!-- end::navigation header -->

    <!-- begin::navigation menu -->
    <div class="navigation-menu-body">
        <ul>
            <li class="navigation-divider">Main</li>
            <li>
                <a href="index.jsp">
                    <i class="nav-link-icon" data-feather="bar-chart-2"></i>
                    <span>已修课程</span>
                </a>
            </li>
            <li>
                <a href="html/chooseCourse.jsp">
                    <i class="nav-link-icon" data-feather="check-circle"></i>
                    <span>选择课程</span>
                </a>
            </li>
            <li>
                <a href="html/selectedCourse.jsp">
                    <i class="nav-link-icon" data-feather="calendar"></i>
                    <span>已选课程</span>
                </a>
            </li>
            <li class="navigation-divider">Extras</li>
            <li>
                <a href="html/personalInformation.jsp">
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
                <a href="index.jsp">
                    <img class="logo" src="image/logo.png" alt="logo">
                    <img class="logo-sm" src="image/logo.png" alt="small logo">
                    <img class="logo-dark" src="image/logo.png" alt="dark logo">
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
                <%
                    if(userID==null){%>
                    <h4>未登录</h4>
                    <small class="">Welcome, <span class="text-primary">同学</span></small>
                <%}
                else{%>
                    <h4><%=user.getCollege()+"  "+user.getProfessional()%></h4>
                    <small class="">Welcome, <span class="text-primary"><%=user.getName()%></span></small>
                <%}
                %>
            </div>
        </div>
        <!-- end::container -->
        <%
            ArrayList<HaveCourse> courseArrayList=null;
            if(userID!=null)
                courseArrayList= HaveCourseDAO.selectAll(userID);
        %>
        <div class="container">
            <div class="card">
                <div class="card-body">
                    <table id="myTable" class="table table-striped table-bordered">
                        <thead>
                        <tr>
                            <th>课程编码</th>
                            <th>课程名称</th>
                            <th>适用专业</th>
                            <th>开设学期</th>
                            <th>课程类型</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            if (userID!=null)
                            for(HaveCourse course:courseArrayList){
                        %>
                        <tr>
                            <td><%=course.getId()%></td>
                            <td><%=course.getName()%></td>
                            <td><%=course.getProfessional()%></td>
                            <td><%=course.getTerm()%></td>
                            <td><%=course.getKind()%></td>
                        </tr>
                        <%}
                        %>
                        </tbody>
                        <tfoot>
                        <tr>
                            <th>课程编码</th>
                            <th>课程名称</th>
                            <th>适用专业</th>
                            <th>开设学期</th>
                            <th>课程类型</th>
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
<script src="vendors/bundle.js"></script>

<!-- Chartjs -->
<script src="vendors/charts/chartjs/chart.min.js"></script>

<!-- Apex chart -->
<script src="vendors/charts/apex/apexcharts.min.js"></script>

<!-- Circle progress -->
<script src="vendors/circle-progress/circle-progress.min.js"></script>

<!-- Peity -->
<script src="vendors/charts/peity/jquery.peity.min.js"></script>
<script src="js/peity.js"></script>

<!-- Datepicker -->
<script src="vendors/datepicker/daterangepicker.js"></script>

<!-- Slick -->
<script src="vendors/slick/slick.min.js"></script>

<!-- Vamp -->
<script src="vendors/vmap/jquery.vmap.min.js"></script>
<script src="vendors/vmap/maps/jquery.vmap.usa.js"></script>
<script src="js/vmap.js"></script>

<!-- Dashboard scripts -->
<script src="js/dashboard.js"></script>



<!-- DataTable -->
<script src="vendors/dataTable/jquery.dataTables.min.js"></script>
<script src="vendors/dataTable/dataTables.bootstrap4.min.js"></script>
<script src="vendors/dataTable/dataTables.responsive.min.js"></script>
<script src="js/datatable.js"></script>

<!-- Prism -->
<script src="vendors/prism/prism.js"></script>



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
<script src="js/app.js"></script>
<script src="js/index.js"></script>
</body>

</html>
