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

        <title>View Uploaded Files</title>

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

                    <a class="navbar-brand" href="examSetterDashboard.jsp">Exam Workflow Management System</a>
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
                                <a href="examSetterDashboard.jsp"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                            </li>
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
                        </ul>
                    </div>
                    <!-- /.sidebar-collapse -->
                </div>
                <!-- /.navbar-static-side -->
            </nav>

            <div id="page-wrapper">
                <!-- /.row -->   
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">View Uploaded Exams</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <%
                    //var for cookies
                    String username = "";
                    String role = "";

                    //Fetch username and role values from cookies
                    Cookie cookie = null;
                    Cookie[] cookies = null;
                    //Get cookies array
                    cookies = request.getCookies();
                    //check if cookies exist
                    if (cookies != null) {
                        //loop through cookie array
                        for (int i = 0; i < cookies.length; i++) {
                            cookie = cookies[i];
                            //check if cookie is the username cookie
                            if (cookie.getName().equals("username")) {
                                //Store username cookie's value as JSP variable
                                username = cookie.getValue();
                            } else if (cookie.getName().equals("role")) {
                                //Store role cookie's value as JSP variable
                                role = cookie.getValue();
                            }
                        }
                    } else {
                        //browser didn't store cookies, usually means not logged in
                        out.println("<h2>No cookies found</h2>");
                    }
                    pageContext.setAttribute("username", username);
                    pageContext.setAttribute("role", role);
                %>
                <sql:query dataSource = "${connection}" var = "IDlist">
                    SELECT ID FROM Staff WHERE Role = ? AND Username = ?
                    <sql:param value="${role}"/>
                    <sql:param value="${username}"/>
                </sql:query>

                <!-- Take results and store in ID var -->
                <c:forEach var="IDRow" items="${IDlist.rows}">
                    <c:set var="staffID" value="${IDRow.ID}" scope="session"/>
                </c:forEach>
                Please select the module code of the exam you want to upload: 
                <form action="examSetterViewUploadedFilesHandle.jsp" method="post"></br>
                    <select name="ExamNo">
                        <sql:query dataSource="${connection}" var="result">
                                SELECT * FROM Exams WHERE ExamSetter = ? ORDER BY ModuleCode, AcademicYear, ModuleName
                                <sql:param value="${staffID}"/>
                            </sql:query>   
                            <c:forEach var="row" items="${result.rows}"> 
                                <option value="${row.ExamNo}"><c:out value="${row.AcademicYear}"/>---<c:out value="${row.ModuleCode}"/>---<c:out value="${row.ModuleName}"/>---<c:out value="${row.ExamType}"/></option>
                            </c:forEach>

                    </select>     
                    <input type="submit" value="submit" /></br>
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
