<%@include file="../dbConnection.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>View All Exams</title>

        <!-- Bootstrap Core CSS -->
        <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- MetisMenu CSS -->
        <link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="../dist/css/sb-admin-2.css" rel="stylesheet">

        <!-- Morris Charts CSS -->
        <link href="../vendor/morrisjs/morris.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>

    <body>

        <div id="wrapper">

            <!-- Navigation -->
            <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="adminDashboard.jsp">Exam Workflow Management System</a>
                </div>
                <!-- /.navbar-header -->

                <ul class="nav navbar-top-links navbar-right">
                    <!-- /.dropdown -->
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                            </li>
                        </ul>
                        <!-- /.dropdown-user -->
                    </li>
                    <!-- /.dropdown -->
                </ul>
                <!-- /.navbar-top-links -->

                <div class="navbar-default sidebar" role="navigation">
                    <div class="sidebar-nav navbar-collapse">
                        <ul class="nav" id="side-menu">
                            <li class="sidebar-search">
                                <div class="input-group custom-search-form">
                                    <input type="text" class="form-control" placeholder="Search...">
                                    <span class="input-group-btn">
                                        <button class="btn btn-default" type="button">
                                            <i class="fa fa-search"></i>
                                        </button>
                                    </span>
                                </div>
                                <!-- /input-group -->
                            </li>
                            <li>
                                <a href="adminDashboard.jsp"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-table fa-fw"></i> Exams<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="adminViewAllExams.jsp">View All Exams</a>
                                    </li>
                                    <li>
                                        <a href="adminCreateExam.html">Create Exam</a>
                                    </li>
                                    <li>
                                        <a href="../AssignExam.jsp">Assign Exams</a>
                                    </li>

                                </ul>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-users"></i> Users<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="adminViewAllUsers.jsp">View All Users</a>
                                    </li>
                                    <li>
                                        <a href="adminCreateUser.jsp">Create User</a>
                                    </li>
                                    <li>
                                        <a href="chooseUserToEdit.jsp">Edit Users</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <!-- /.sidebar-collapse -->
                </div>
                <!-- /.navbar-static-side -->
            </nav>

            <div id="page-wrapper">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">View All Exams</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
                <div class="tabbable" style="margin-bottom: 18px;">
                    <ul class="nav nav-tabs">   
                        <li class="active"><a href="#home" data-toggle="tab">Home</a></li>
                            <sql:query dataSource="${connection}" var="result">
                            SELECT * FROM Exams;     
                        </sql:query>   
                        <c:forEach var="row" items="${result.rows}"> 
                            <li><a href="#${row.ModuleCode}" data-toggle="tab"><c:out value="${row.ModuleCode}"/></a></li>
                            </c:forEach>
                    </ul>
                    <div class="tab-content" style="padding-bottom: 9px; border-bottom: 1px solid #ddd;">
                        <div class="tab-pane  active" id="home">
                            <h3>Home</h3>
                            <p>You can get the information of the module and view comments here</p>
                        </div>
                        <sql:query dataSource="${connection}" var="result">
                            SELECT * FROM Exams;     
                        </sql:query>
                        <c:forEach var="row" items="${result.rows}">     
                            <div class="tab-pane" id="${row.ModuleCode}">
                                <table class="table table-striped">
                                    <h3>Module Name: <c:out value="${row.ModuleName}"/></h3>
                                    <tr>
                                        <th>#</th>
                                        <th>Academic Year</th>                                 
                                        <th>Exam Type [M: Main; R: Resit]</th>
                                        <th>Module Degree [UG: Undergraduate; PG: Postgraduate]</th>
                                        <th>Exam Format [P: Paper-based; O: Online]</th>
                                    </tr>
                                    <tr>
                                        <td><c:out value="${row.ExamNo}"/></td>
                                        <td><c:out value="${row.AcademicYear}"/></td>
                                        <td><c:out value="${row.ExamType}"/></td>
                                        <td><c:out value="${row.ModuleDegree}"/></td>
                                        <td><c:out value="${row.ExamFormat}"/></td>
                                    </tr>
                                </table>
                                <form action="ViewComments.jsp">
                                    <input type="hidden" value="${row.ExamNo}" name="examNo" />
                                    <button type="submit" class="btn btn-default" value="View comments">View Comments</button>
                                </form><br>
                                <h3>Progress</h3>
                                <div class="progress progress-striped active">
                                    <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 30%">
                                        30% Complete
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>

            </div>   
            <!-- /#page-wrapper -->

        </div>
        <!-- /#wrapper -->

        <!-- jQuery -->
        <script src="../vendor/jquery/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="../vendor/metisMenu/metisMenu.min.js"></script>

        <!-- Morris Charts JavaScript -->
        <script src="../vendor/raphael/raphael.min.js"></script>
        <script src="../vendor/morrisjs/morr is.min.js"></script>
        <script src="../data/morris-data.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="../dist/js/sb-admin-2.js"></script>

    </body>

</html>
