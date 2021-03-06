<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Sign Exam</title>
        <%@include file="dbConnection.jsp"%>
        <%
    
        String username = "noName";
        String role = "noRole";
        int examID;
    
        //Fetch username and role values from cookies
        Cookie cookie = null;
        Cookie[] cookies = null;
        //Get cookies array
        cookies = request.getCookies();
        //check if cookies exist
        if( cookies != null ) {
            //
            for (int i = 0; i < cookies.length; i++) {
                cookie = cookies[i];
                //check if cookie is the username cookie
                if (cookie.getName().equals("username")) {
                    //Store username cookie's value as JSP variable
                    username = cookie.getValue();
                    pageContext.setAttribute("username", username);
                }
                else if (cookie.getName().equals("role")) {
                    //Store role cookie's value as JSP variable
                    role = cookie.getValue();
                    pageContext.setAttribute("role", "ExamSetter");
                }
                       
            }
        
        }
        else {
            //browser didn't store cookies
            out.println("<h2>No cookies found</h2>");
        }    
    
        %>

        <!-- SQL Query to get staffID -->
        <sql:query dataSource = "${connection}" var = "IDlist">
            SELECT ID FROM Staff WHERE Role = ? AND Username = ?
            <sql:param value="${role}"/>
            <sql:param value="${username}"/>   
        </sql:query>

        <c:forEach var="IDRow" items="${IDlist.rows}">
            <c:set var="staffID" value="${IDRow.ID}" scope="session"/>
        </c:forEach>
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
                    <c:choose>
                        <c:when test="${role.equals('Admin')}">
                            <a class="navbar-brand" href="adminDashboard.jsp">Exam Workflow Management System</a>
                        </c:when>
                        <c:when test="${role.equals('ExamSetter')}">
                            <a class="navbar-brand" href="examSetterDashboard.jsp">Exam Workflow Management System</a>
                        </c:when>
                        <c:when test="${role.equals('InternalModerator')}">
                            <a class="navbar-brand" href="internalMouderatorDashboard.jsp">Exam Workflow Management System</a>
                        </c:when>
                        <c:when test="${role.equals('ExamVettingCommittee')}">
                            <a class="navbar-brand" href="examVCDashboard.jsp">Exam Workflow Management System0</a>
                        </c:when>
                        <c:when test="${role.equals('ExternalExaminer')}">
                            <a class="navbar-brand" href="externalExaminer.jsp">Exam Workflow Management System</a>
                        </c:when>
                    </c:choose>
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
                                <c:choose>
                                    <c:when test="${role.equals('Admin')}">
                                        <a href="adminDashboard.jsp"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                                    </c:when>
                                    <c:when test="${role.equals('ExamSetter')}">
                                        <a href="examSetterDashboard.jsp"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                                    </c:when>
                                    <c:when test="${role.equals('InternalModerator')}">
                                        <a href="internalMouderatorDashboard.jsp"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                                    </c:when>
                                    <c:when test="${role.equals('ExamVettingCommittee')}">
                                        <a href="examVCDashboard.jsp"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                                    </c:when>
                                    <c:when test="${role.equals('ExternalExaminer')}">
                                        <a href="externalExaminerDashboard.jsp"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                                    </c:when>
                                </c:choose>
                            </li>
                            <c:choose>
                                <c:when test="${role.equals('Admin')}">
                                    <li>
                                        <a href="#"><i class="fa fa-table fa-fw"></i> Exams<span class="fa arrow"></span></a>
                                        <ul class="nav nav-second-level">
                                            <li>
                                                <a href="adminViewAllExams.jsp">View All Exams</a>
                                            </li>
                                            <li>
                                                <a href="createExam.html">Create Exam</a>
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
                                </c:when>
                                <c:when test="${role.equals('ExamSetter')}">
                                    <li>
                                        <a href="#"><i class="fa fa-table fa-fw"></i> Exams<span class="fa arrow"></span></a>
                                        <ul class="nav nav-second-level">
                                            <li>
                                                <a href="examSetterViewExams.jsp">View Exams</a>
                                            </li>
                                            <li>
                                                <a href="examSetterUploadExam.jsp">Upload Exam</a>
                                            </li>
                                            <li>
                                                <a href="examSetterViewUploadedFiles.jsp">View Uploaded Exam Files</a>
                                            </li>
                                            <li>
                                                <a href="signExamForm.jsp">Sign Exam</a>
                                            </li>
                                        </ul>
                                    </li>
                                </c:when>
                                <c:when test="${role.equals('InternalModerator')}">
                                    <li>
                                        <a href="#"><i class="fa fa-table fa-fw"></i> Exams<span class="fa arrow"></span></a>
                                        <ul class="nav nav-second-level">
                                            <li>
                                                <a href="internalMouderatorViewExams.jsp">View Exams</a>
                                            </li>
                                            <li>
                                                <a href="internalMouderatorUploadExam.jsp">Upload Exam</a>
                                            </li>
                                            <li>
                                                <a href="internalMouderatorViewUploadedFiles.jsp">View Uploaded Exam Files</a>
                                            </li>
                                            <li>
                                                <a href="signExamForm.jsp">Sign Exam</a>
                                            </li>
                                        </ul>
                                    </li>
                                </c:when>
                                <c:when test="${role.equals('ExternalExaminer')}">
                                    <li>
                                        <a href="#"><i class="fa fa-table fa-fw"></i> Exams<span class="fa arrow"></span></a>
                                        <ul class="nav nav-second-level">
                                            <li>
                                                <a href="externalExaminerViewExams.jsp">View Exams</a>
                                            </li>
                                            <li>
                                                <a href="externalExaminerViewUploadedFiles.jsp">View Uploaded Exam Files</a>
                                            </li>
                                            <li>
                                                <a href="signExamForm.jsp">Sign Exam</a>
                                            </li>
                                        </ul>
                                    </li>
                                </c:when>
                                <c:when test="${role.equals('ExamVettingCommittee')}">
                                    <li>
                                        <a href="#"><i class="fa fa-table fa-fw"></i> Exams<span class="fa arrow"></span></a>
                                        <ul class="nav nav-second-level">
                                            <li>
                                                <a href="examVCViewExams.jsp">View Exams</a>
                                            </li>
                                            <li>
                                                <a href="examVCUploadExam.jsp">Upload Exam</a>
                                            </li>
                                            <li>
                                                <a href="examVCViewUploadedFiles.jsp">View Uploaded Exam Files</a>
                                            </li>
                                            <li>
                                                <a href="signExamForm.jsp">Sign Exam</a>
                                            </li>
                                        </ul>
                                    </li>
                                </c:when>
                            </c:choose>
                        </ul>
                    </div>
                    <!-- /.sidebar-collapse -->
                </div>
                <!-- /.navbar-static-side -->
            </nav>

            <div id="page-wrapper">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Sign Exam</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
                <div style="margin: auto; width: 100%;">
                    <h3>Choose Exam:</h3><br>

                    <c:if test = "${role == 'ExamSetter'}">
                        <sql:query  dataSource = "${connection}" var = "exams">
                            SELECT ExamNo, ModuleCode, ModuleName, AcademicYear FROM Exams WHERE ExamSetter = ?
                            <sql:param value="${staffID}"/>  
                        </sql:query>
                    </c:if>

                    <c:if test = "${role == 'InternalModerator'}">
                        <sql:query  dataSource = "${connection}" var = "exams">
                            SELECT ExamNo, ModuleCode, ModuleName, AcademicYear FROM Exams WHERE InternalModerator = ? AND ExamSetter IS NULL
                            <sql:param value="${staffID}"/>  
                        </sql:query>
                    </c:if>

                    <c:if test = "${role == 'ExternalExaminer'}">
                        <sql:query  dataSource = "${connection}" var = "exams">
                            SELECT ExamNo, ModuleCode, ModuleName, AcademicYear FROM Exams WHERE ExternalModerator = ? AND ExamSetter IS NULL AND InternalModerator IS NULL
                            <sql:param value="${staffID}"/>  
                        </sql:query>
                    </c:if>

                    <c:if test = "${role == 'ExamVettingCommittee'}">
                        <sql:query  dataSource = "${connection}" var = "exams">
                            SELECT ExamNo, ModuleCode, ModuleName, AcademicYear FROM Exams 
                        </sql:query>
                    </c:if>

                    <form role="form" action="signExam.jsp" method="post">
                        <select class="form-control" id="examList" name = "examList">
                            <c:forEach var="i" items="${exams.rows}">
                                <option value="${i.ExamNo}">
                                    <c:out value="${i.ModuleCode} ${i.ModuleName} ${i.AcademicYear}"/>
                                </option>
                            </c:forEach>
                        </select>
                        <p></p>
                        <button type="submit" class="btn btn-primary" style="float: right;">Sign Exam</button>
                    </form>
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

