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

    <title>Create Exam</title>

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
                            <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Exams<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="adminViewAllExams.jsp">View All Exams</a>
                                </li>
                                <li>
                                    <a href="adminCreateExam.html">Create Exam</a>
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
                    <h1 class="page-header">Create Exam Successfully</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
<%
    //for getting username from cookie later
    String username = "";
    
    //input gets fetched from HTML form (createExam.html)
    
    String moduleCode = request.getParameter("moduleCode");
    String moduleName = request.getParameter("moduleName");
    String academicYear = request.getParameter("academicYear");
    String examType = request.getParameter("examType");
    String moduleDegree = request.getParameter("moduleDegree");
    String examFormat = request.getParameter("examFormat");
    
    //Get username value from cookie to know who is trying to create
    
    //Fetch username value from cookies
    Cookie cookie = null;
    Cookie[] cookies = null;
    //Get cookies array
    cookies = request.getCookies();
    //check if cookies exist
    if( cookies != null ) {
        //go through cookie array, find username cookie and store value
        for (int i = 0; i < cookies.length; i++) {
            cookie = cookies[i];
            //check if cookie is the username cookie
            if (cookie.getName().equals("username")) {
                //Store username cookie's value as JSP variable
                username = cookie.getValue();
            }                 
        }
    }
    else {
        //browser didn't store cookies
        out.println("<h2>No cookies found</h2>");
    }    
    
    //legacy code does not work atm, since users in Hashtable are different to users in SQL DB
    //Cookies are getting DB users and trying to feed into Hashtable so clearly won't work
    
    /*
    staff.StaffHandler staffhandler = new StaffHandler();
    //creating admin project with username fetched from cookie
    staff.Admin admin = staffhandler.getAdmin(username);    
    
    //calling create method in Exam Java class
    admin.createExam(academicYear, moduleCode, moduleName, examType, moduleDegree);
    */
    
    
    
    //taking the JSP variables and converting them into JSTL attributes (essentially also variables...)
    //This allows usage of variables outside of JSP brackets
    pageContext.setAttribute("academicYear",academicYear);
    pageContext.setAttribute("moduleCode",moduleCode);
    pageContext.setAttribute("moduleName",moduleName);
    pageContext.setAttribute("examType",examType);
    pageContext.setAttribute("moduleDegree",moduleDegree);
    pageContext.setAttribute("examFormat", examFormat);
    
%>

        <!--
            SQL Insert statement to insert exam into database   
        -->
        <sql:update sql="INSERT INTO Exams (AcademicYear, ModuleCode, ModuleName, ExamType, ModuleDegree, ExamFormat) VALUES (?,?,?,?,?,?)"
                    dataSource = "${connection}" var = "result">
            
            <!-- Parameters ('?') in SQL statement replaced with the JSTL attributes -->
            <sql:param value="${academicYear}"/>
            <sql:param value="${moduleCode}"/>        
            <sql:param value="${moduleName}"/>
            <sql:param value="${examType}"/>
            <sql:param value="${moduleDegree}"/>
            <sql:param value="${examFormat}"/>
        </sql:update>
        <p>
            Created Successfully!
        </p>
        <p>
            Go to <a href="adminViewAllExams.jsp">view all exams</a>. </br>
        </p>
        <p>
            Or <a href="adminCreateExam.html">create another exam.</a>
        </p>
        
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
