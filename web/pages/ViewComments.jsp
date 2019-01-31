<%-- 
    Document   : ViewComments
    Created on : 24 Jan 2019, 17:15:37
    Author     : freyamurphy
--%>

<%@include file="../dbConnection.jsp"%>
<% 
    // Get the exam to display comments for
    String examNo = request.getParameter("examNo");
    // Make variable accessible to JSTL
    pageContext.setAttribute("examNo", examNo);

    //String staffID = "5";
    String username ="";
    String role ="";
    
    //Fetch username and role values from cookies
    Cookie cookie = null;
    Cookie[] cookies = null;
    //Get cookies array
    cookies = request.getCookies();
    //check if cookies exist
    if( cookies != null ) {
        //loop through cookie array
        for (int i = 0; i < cookies.length; i++) {
            cookie = cookies[i];
            //check if cookie is the username cookie
            if (cookie.getName().equals("username")) {
                //Store username cookie's value as JSP variable
                username = cookie.getValue();
            }
            else if (cookie.getName().equals("role")) {
                //Store role cookie's value as JSP variable
                role = cookie.getValue();
            }
        }
    }
    else {
        //browser didn't store cookies
        out.println("<h2>No cookies found</h2>");
    }
    
    //turn JSP var into JSTL attributes
    pageContext.setAttribute("username", username);  
    pageContext.setAttribute("role", role);
    
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>View Comments</title>

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
        <!-- SQL Query to get staffID -->
        <sql:query dataSource = "${connection}" var = "IDlist">
            SELECT ID FROM Staff WHERE Role = ? AND Username = ?
            <sql:param value="${role}"/>
            <sql:param value="${username}"/>
        </sql:query>

        <!-- Take results and store in ID var -->
        <c:forEach var="IDRow" items="${IDlist.rows}">
            <c:set var="staffID" value="${IDRow.ID}" scope="session"/>
        </c:forEach>

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
                    <!-- uses cookies to redirect the user to the correct dashboard.-->
                    <c:choose>
                        <c:when test="${role.equals('admin')}">
                            <a class="navbar-brand" href="adminDashboard.jsp">Exam Workflow Management System</a>
                        </c:when>
                        <c:when test="${role.equals('examSetter')}">
                            <a class="navbar-brand" href="examSetterDashboard.jsp">Exam Workflow Management System</a>
                        </c:when>
                        <c:when test="${role.equals('internalModerator')}">
                            <a class="navbar-brand" href="internalMouderatorDashboard.jsp">Exam Workflow Management System</a>
                        </c:when>
                        <c:when test="${role.equals('examVettingCommittee')}">
                            <a class="navbar-brand" href="examVCDashboard.jsp">Exam Workflow Management System</a>
                        </c:when>
                        <c:when test="${role.equals('externalExaminer')}">
                            <a class="navbar-brand" href="externalExaminer.jsp">Exam Workflow Management System</a>
                        </c:when>
                        <c:when test="${role.equals('schoolOffice')}">
                            <a class="navbar-brand" href="schoolOfficeDashboard.jsp">Exam Workflow Management System</a>
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
                                <!-- uses cookies to redirect the user to the correct dashboard.-->
                                <c:choose>
                                    <c:when test="${role.equals('admin')}">
                                        <a href="adminDashboard.jsp"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                                    </c:when>
                                    <c:when test="${role.equals('examSetter')}">
                                        <a href="examSetterDashboard.jsp"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                                    </c:when>
                                    <c:when test="${role.equals('internalModerator')}">
                                        <a href="internalMouderatorDashboard.jsp"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                                    </c:when>
                                    <c:when test="${role.equals('examVettingCommittee')}">
                                        <a href="examVCDashboard.jsp"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                                    </c:when>
                                    <c:when test="${role.equals('externalExaminer')}">
                                        <a href="externalExaminerDashboard.jsp"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                                    </c:when>
                                    <c:when test="${role.equals('schoolOffice')}">
                                        <a href="schoolOfficeDashboard.jsp"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                                    </c:when>
                                </c:choose>
                            </li>
                            <li>
                                <!-- uses cookies to change the nav bar for each user -->
                                <c:choose>
                                    <c:when test="${role.equals('admin')}">
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
                                <c:when test="${role.equals('examSetter')}">
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
                                <c:when test="${role.equals('internalModerator')}">
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
                                <c:when test="${role.equals('externalExaminer')}">
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
                                <c:when test="${role.equals('examVettingCommittee')}">
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
                                <c:when test="${role.equals('schoolOffice')}">
                                    <li>
                                        <a href="#"><i class="fa fa-table fa-fw"></i> Exams<span class="fa arrow"></span></a>
                                        <ul class="nav nav-second-level">
                                            <li>
                                                <a href="viewCompletedExams.jsp">View Completed Exams</a>
                                            </li>
                                        </ul>
                                    </li> 
                                </c:when>
                            </c:choose>

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
                        <h1 class="page-header">View Comments</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <%--
                    Get comments from database
                --%>
                <sql:query sql="SELECT CommentID, Content, Author, TimeOfComment FROM Comments WHERE ExamNo = ${examNo}" 
                           var="commentResult" dataSource="${connection}">
                </sql:query>

                <%--
                    Display each comment
                --%>
                <c:forEach var="comment" items="${commentResult.rows}">

                    <%--
                        Get author details from database
                    --%>
                    <sql:query sql="SELECT FirstName, LastName, Role FROM Staff WHERE ID = ${comment.Author}" 
                               var="staffResult" dataSource="${connection}">
                    </sql:query>

                    <c:forEach var="staff" items="${staffResult.rows}">
                        <div>
                            <blockquote>
                                <p class="content">
                                    <c:out value="${comment.Content}"/>
                                </p>
                                <footer>
                                    <c:out value="${staff.Firstname} ${staff.LastName}"/>, 
                                    <c:out value="${staff.role}" />
                                    <cite title="Source Title">
                                        <c:out value="${comment.TimeOfComment}"/>
                                    </cite>
                                </footer>
                                <br>
                            </blockquote>
                        </div>
                    </c:forEach>

                    <%--
                        Get replies to this comment from database
                    --%>
                    <sql:query sql="SELECT Content, Author, TimeOfReply FROM Replies WHERE CommentID = ${comment.CommentID}" 
                               var="replyResult" dataSource="${connection}">
                    </sql:query>

                    <%--
                        Display each reply
                    --%>
                    <h4>Replies to this comment</h4>
                    <c:forEach var="reply" items="${replyResult.rows}">
                        <sql:query sql="SELECT FirstName, LastName FROM Staff WHERE ID = ${reply.Author}" 
                                   var="staffResult2" dataSource="${connection}">
                        </sql:query>

                        <c:forEach var="staff" items="${staffResult2.rows}">
                            <div>
                                <blockquote>
                                    <p class="content">
                                        <c:out value="${reply.Content}"/>
                                    </p>
                                    <footer>
                                        <c:out value="${staff.Firstname} ${staff.LastName}"/>, 
                                        <c:out value="${staff.role}" />
                                        <cite title="Source Title">
                                            <c:out value="${reply.TimeOfReply}"/>
                                        </cite>
                                    </footer>
                                </blockquote>

                            </div>
                            <br><br>
                        </c:forEach>

                    </c:forEach>


                </c:forEach>
            </div>
        </div>
    </body>
</html>
