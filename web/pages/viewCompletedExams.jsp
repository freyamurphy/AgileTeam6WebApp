<%-- 
    Document   : viewAllExams
    Created on : 2019年1月24日, 下午3:03:31
    Author     : YHSSSS
--%>
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
                <a class="navbar-brand" href="adminDashboard.html">Team 6 -- the best team :)</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-bell fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-alerts">
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-comment fa-fw"></i> New Comment
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-twitter fa-fw"></i> 3 New Followers
                                    <span class="pull-right text-muted small">12 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-envelope fa-fw"></i> Message Sent
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-tasks fa-fw"></i> New Task
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-upload fa-fw"></i> Server Rebooted
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>See All Alerts</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                    <!-- /.dropdown-alerts -->
                </li>
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
                            <a href="adminDashboard.html"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-table fa-fw"></i> Exams<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="adminViewAllExams.jsp">View All Exams</a>
                                </li>
                                <li>
                                    <a href="createExam.html">Create Exam</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
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
                    <h1 class="page-header">View All New Exams</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="tabbable" style="margin-bottom: 18px;">
             <ul class="nav nav-tabs">   
             <li class="active"><a href="#home" data-toggle="tab">Home</a></li>
             <sql:query dataSource ="${connection}" var = "examCount">
                    SELECT COUNT(*) FROM Exams
             </sql:query>
                <c:set var = "examCountInt" scope = "page" value = "${examCount.getRowsByIndex()[0][0]}"/>
                <c:forEach var = "i" begin="1" end="${examCountInt}">
                    <sql:query dataSource = "${connection}" var = "result">
                        SELECT COUNT(*) FROM Signatures WHERE ExamID = ?
                        <sql:param value = "${i}" />
                    </sql:query>
                    <c:set var = "resultInt" scope = "page" value = "${result.getRowsByIndex()[0][0]}"/>
                    <c:if test="${resultInt == '4'}">
                        <sql:query dataSource="${connection}" var="examResult">
                            SELECT * FROM Exams WHERE ExamNo = ? 
                            <sql:param value = "${i}" />
                        </sql:query>   
                        <c:forEach var="row" items="${examResult.rows}"> 
                            <li><a href="#${row.ModuleCode}" data-toggle="tab"><c:out value="${row.ModuleCode}"/></a></li>
                        </c:forEach>
                    </c:if>
                </c:forEach>
             </ul>
                <div class="tab-content" style="padding-bottom: 9px; border-bottom: 1px solid #ddd;">
                    <div class="tab-pane  active" id="home">
                    <h3>Home</h3>
                     <p>You can get the information of the module and view comments here</p>
                    </div>
                <sql:query dataSource ="${connection}" var = "examCount">
                    SELECT COUNT(*) FROM Exams
                </sql:query>
                <c:set var = "examCountInt" scope = "page" value = "${examCount.getRowsByIndex()[0][0]}"/>
                <c:forEach var = "i" begin="1" end="${examCountInt}">
                    <sql:query dataSource = "${connection}" var = "result">
                        SELECT COUNT(*) FROM Signatures WHERE ExamID = ?
                        <sql:param value = "${i}" />
                    </sql:query>
                    <c:set var = "resultInt" scope = "page" value = "${result.getRowsByIndex()[0][0]}"/>
                    <c:if test="${resultInt == '4'}">
                        <sql:query dataSource="${connection}" var="viewExams">
                            SELECT * FROM Exams WHERE ExamNo = ?
                            <sql:param value = "${i}" />
                        </sql:query>
                        <c:forEach var="row" items="${viewExams.rows}">     
                        <div class="tab-pane" id="${row.ModuleCode}">
                            <h3>Module Details:</h3>
                            Module Name:<c:out value="${row.ModuleName}"/></br>
                            Exam No:<c:out value="${row.ExamNo}"/></br>
                            Academic Year:<c:out value="${row.AcademicYear}"/></br>
                            Exam Type(M: Main Exam; R: Resit Exam): <c:out value="${row.ExamType}"/></br>
                            Module Degree(UG: Undergraduate Exam; PG: Postgraduate Exam): <c:out value="${row.ModuleDegree}"/></br></br>
                            <form action="ViewComments.jsp">
                             <input type="hidden" value="${row.ExamNo}" name="examNo" />
                             <input type="submit" value="View comments" />
                            </form></br>
                        </div>
                        </c:forEach>
                    </c:if>
                </c:forEach>
                </div>
            </div>      
-        </div>   
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
    <script src="../vendor/morrisjs/morris.min.js"></script>
    <script src="../data/morris-data.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>

</body>

</html>
