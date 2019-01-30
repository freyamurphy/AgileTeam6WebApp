<%-- 
    Document   : adminViewAllUsers
    Created on : 29.01.2019, 15:28:48
    Author     : Momoko Werner
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

        <title>View All Users</title>

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
                    <a class="navbar-brand" href="adminDashboard.jsp">Team 6 -- the best team :)</a>
                </div>
                <!-- /.navbar-header -->

                <ul class="nav navbar-top-links navbar-right">

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
                                <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Exams<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="adminViewAllExams.jsp">View All Exams</a>
                                    </li>
                                    <li>
                                        <a href="adminCreateExam.html">Create Exam</a>
                                    </li>
                                </ul>
                                <!-- /.nav-second-level -->
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
                        <h1 class="page-header">View All Users</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
                <div class="tabbable" style="margin-bottom: 18px;">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#admin" data-toggle="tab">Admins</a></li>
                        <li><a href="#examsetter" data-toggle="tab">Exam Setters</a></li>
                        <li><a href="#internalmoderator" data-toggle="tab">Internal Moderators</a></li>
                        <li><a href="#examcommittee" data-toggle="tab">Exam Vetting Committee</a></li>
                        <li><a href="#externalexaminer" data-toggle="tab">External Examiners</a></li>
                        <li><a href="#schooloffice" data-toggle="tab">School Office</a></li>
                    </ul>

                    <!-- Tabs -->
                    <div class="tab-content" style="padding-bottom: 9px; border-bottom: 1px solid #ddd;">
                        <!-- Admin Tab -->
                        <div class="tab-pane  active" id="admin">
                            <h3>Admins</h3>
                            <p>List of all admins</p>
                            <sql:query dataSource="${connection}" var="result">
                                SELECT * FROM Staff WHERE Role = "admin";     
                            </sql:query>
                            <table class="table table-striped">
                                <tr>
                                    <th>#</th>
                                    <th>First Name</th>                                 
                                    <th>Last Name</th>
                                    <th>Username</th>
                                </tr>
                                <c:forEach var="row" items="${result.rows}"> 
                                    <tr>
                                        <td><c:out value="${row.ID}"/></td>
                                        <td><c:out value="${row.FirstName}"/></td>
                                        <td><c:out value="${row.LastName}"/></td>
                                        <td><c:out value="${row.Username}"/></td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                        <div class="tab-pane" id="examsetter">
                            <h3>Exam Setters</h3>
                            <p>List of all exam setters</p>
                            <sql:query dataSource="${connection}" var="result">
                                SELECT * FROM Staff WHERE Role = "examSetter";     
                            </sql:query>
                            <table class="table table-striped">
                                <tr>
                                    <th>#</th>
                                    <th>First Name</th>                                 
                                    <th>Last Name</th>
                                    <th>Username</th>
                                </tr>
                                <c:forEach var="row" items="${result.rows}"> 
                                    <tr>
                                        <td><c:out value="${row.ID}"/></td>
                                        <td><c:out value="${row.FirstName}"/></td>
                                        <td><c:out value="${row.LastName}"/></td>
                                        <td><c:out value="${row.Username}"/></td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                        <div class="tab-pane" id="internalmoderator">
                            <h3>Internal Moderators</h3>
                            <p>List of all internal moderators</p>
                            <sql:query dataSource="${connection}" var="result">
                                SELECT * FROM Staff WHERE Role = "internalModerator";     
                            </sql:query>
                            <table class="table table-striped">
                                <tr>
                                    <th>#</th>
                                    <th>First Name</th>                                 
                                    <th>Last Name</th>
                                    <th>Username</th>
                                </tr>
                                <c:forEach var="row" items="${result.rows}"> 
                                    <tr>
                                        <td><c:out value="${row.ID}"/></td>
                                        <td><c:out value="${row.FirstName}"/></td>
                                        <td><c:out value="${row.LastName}"/></td>
                                        <td><c:out value="${row.Username}"/></td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                        <div class="tab-pane" id="examcommittee">
                            <h3>Exam Vetting Committee</h3>
                            <p>List of all exam vetting committee members</p>
                            <sql:query dataSource="${connection}" var="result">
                                SELECT * FROM Staff WHERE Role = "examVettingCommittee";     
                            </sql:query>
                            <table class="table table-striped">
                                <tr>
                                    <th>#</th>
                                    <th>First Name</th>                                 
                                    <th>Last Name</th>
                                    <th>Username</th>
                                </tr>
                                <c:forEach var="row" items="${result.rows}"> 
                                    <tr>
                                        <td><c:out value="${row.ID}"/></td>
                                        <td><c:out value="${row.FirstName}"/></td>
                                        <td><c:out value="${row.LastName}"/></td>
                                        <td><c:out value="${row.Username}"/></td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                        <div class="tab-pane" id="externalexaminer">
                            <h3>External Examiner</h3>
                            <p>List of all external examiners</p>
                            <sql:query dataSource="${connection}" var="result">
                                SELECT * FROM Staff WHERE Role = "externalExaminer";     
                            </sql:query>
                            <table class="table table-striped">
                                <tr>
                                    <th>#</th>
                                    <th>First Name</th>                                 
                                    <th>Last Name</th>
                                    <th>Username</th>
                                </tr>
                                <c:forEach var="row" items="${result.rows}"> 
                                    <tr>
                                        <td><c:out value="${row.ID}"/></td>
                                        <td><c:out value="${row.FirstName}"/></td>
                                        <td><c:out value="${row.LastName}"/></td>
                                        <td><c:out value="${row.Username}"/></td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                        <div class="tab-pane" id="schooloffice">
                            <h3>School Office</h3>
                            <p>List of all school office employees</p>
                            <sql:query dataSource="${connection}" var="result">
                                SELECT * FROM Staff WHERE Role = "schoolOffice";     
                            </sql:query>
                            <table class="table table-striped">
                                <tr>
                                    <th>#</th>
                                    <th>First Name</th>                                 
                                    <th>Last Name</th>
                                    <th>Username</th>
                                </tr>
                                <c:forEach var="row" items="${result.rows}"> 
                                    <tr>
                                        <td><c:out value="${row.ID}"/></td>
                                        <td><c:out value="${row.FirstName}"/></td>
                                        <td><c:out value="${row.LastName}"/></td>
                                        <td><c:out value="${row.Username}"/></td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
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
        <script src="../vendor/morrisjs/morris.min.js"></script>
        <script src="../data/morris-data.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="../dist/js/sb-admin-2.js"></script>
    </body>
</html>
