<%-- 
    Document   : viewCommentES
    Created on : 29 Jan 2019, 14:40:38
    Author     : freyamurphy
--%>

<%@include file="../dbConnection.jsp"%>
<% 
    String examNo = request.getParameter("examNo");
    // Make variable accessible to JSTL
    pageContext.setAttribute("examNo", examNo);
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
                                <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Exams<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="examSetterUploadExam.jsp">Upload Exam</a>
                                    </li>
                                    <li>
                                        <a href="examSetterViewExams.jsp">View Exams</a>
                                    </li>
                                    <li>
                                        <a href="examSetterViewUploadedFiles.jsp">View Uploaded Files</a>
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
                <!-- /.row -->   
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Comments on Exam</h1>
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
                                <form action="addReplyForm.jsp">
                                    <input type="hidden" value="${comment.CommentID}" name="commentID"/>
                                    <button type="submit" class="btn btn-default" value="Reply">Reply</button>
                                </form>
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

                                <br>
                            </div>
                        </c:forEach>

                    </c:forEach>

                </c:forEach>
            </div>
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
