<%@include file="../dbConnection.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
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
                        <h1 class="page-header">View All Completed Exams</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- probably will need to update a sql statement in this area  and cookies-->
                <!-- /.row -->
                <div class="tabbable" style="margin-bottom: 18px;">
                    <ul class="nav nav-tabs">   
                        <li class="active"><a href="#home" data-toggle="tab">Home</a></li>
                        <!-- admin and Exam Vetting Committee -->
                        <c:if test= "${role.equals('admin') || role.equals('examVettingCommittee')}">
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
                                    <c:forEach var="Examsrow" items="${examResult.rows}"> 
                                        <li><a href="#${Examsrow.ModuleCode}" data-toggle="tab"><c:out value="${Examsrow.ModuleCode}"/></a></li>
                                        </c:forEach>
                                    </c:if>
                                </c:forEach>
                            </c:if>
                        <!-- exam setter -->
                        <c:if test= "${role.equals('examSetter')}">
                            <sql:query dataSource ="${connection}" var = "examCount">
                                SELECT COUNT(*) FROM Exams WHERE ExamSetter = ?
                                <sql:param value="${staffID}"/>
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
                                        SELECT * FROM Exams WHERE ExamNo = ? AND ExamSetter = ?
                                        <sql:param value = "${i}" />
                                        <sql:param value="${staffID}"/>
                                    </sql:query>   
                                    <c:forEach var="Examsrow" items="${examResult.rows}"> 
                                        <li><a href="#${Examsrow.ModuleCode}" data-toggle="tab"><c:out value="${Examsrow.ModuleCode}"/></a></li>
                                        </c:forEach>
                                    </c:if>
                                </c:forEach>
                            </c:if>
                        <!-- internal moderator -->
                        <c:if test= "${role.equals('internalModerator')}">
                            <sql:query dataSource ="${connection}" var = "examCount">
                                SELECT COUNT(*) FROM Exams WHERE InternalModerator = ?
                                <sql:param value="${staffID}"/>
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
                                        SELECT * FROM Exams WHERE ExamNo = ? AND InternalModerator = ?
                                        <sql:param value = "${i}" />
                                        <sql:param value="${staffID}"/>
                                    </sql:query>   
                                    <c:forEach var="Examsrow" items="${examResult.rows}"> 
                                        <li><a href="#${Examsrow.ModuleCode}" data-toggle="tab"><c:out value="${Examsrow.ModuleCode}"/></a></li>
                                        </c:forEach>
                                    </c:if>
                                </c:forEach>
                            </c:if>
                        <!-- external examiner -->
                        <c:if test= "${role.equals('externalExaminer')}">
                            <sql:query dataSource ="${connection}" var = "examCount">
                                SELECT COUNT(*) FROM Exams WHERE ExternalExaminer = ?
                                <sql:param value="${staffID}"/>
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
                                        SELECT * FROM Exams WHERE ExamNo = ? AND ExternalExaminer = ?
                                        <sql:param value = "${i}" />
                                        <sql:param value="${staffID}"/>
                                    </sql:query>   
                                    <c:forEach var="Examsrow" items="${examResult.rows}"> 
                                        <li><a href="#${Examsrow.ModuleCode}" data-toggle="tab"><c:out value="${Examsrow.ModuleCode}"/></a></li>
                                        </c:forEach>
                                    </c:if>
                                </c:forEach>
                            </c:if>
                    </ul>
                    <div class="tab-content" style="padding-bottom: 9px; border-bottom: 1px solid #ddd;">
                        <div class="tab-pane  active" id="home">
                            <h3>Home</h3>
                            <p>You can get the information of the module and view comments here</p>
                        </div>
                        <!-- admin and exam vetting committee -->
                        <c:if test="${role.equals('admin') || role.equals('examVettingCommittee')}">
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
                        </c:if>
                        <!-- exam setter -->
                        <c:if test="${role.equals('examSetter')}">
                            <sql:query dataSource ="${connection}" var = "examCount">
                                SELECT COUNT(*) FROM Exams WHERE ExamSetter = ?
                                <sql:param value="${staffID}"/>
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
                                        SELECT * FROM Exams WHERE ExamNo = ? AND ExamSetter = ?
                                        <sql:param value = "${i}" />
                                        <sql:param value="${staffID}"/>
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
                        </c:if>
                        <!-- internal moderator -->
                        <c:if test="${role.equals('internalModerator')}">
                            <sql:query dataSource ="${connection}" var = "examCount">
                                SELECT COUNT(*) FROM Exams WHERE InternalModerator = ?
                                <sql:param value="${staffID}"/>
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
                                        SELECT * FROM Exams WHERE ExamNo = ? AND InternalModerator = ?
                                        <sql:param value = "${i}" />
                                        <sql:param value="${staffID}"/>
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
                        </c:if>
                        <!-- external examiner -->
                        <c:if test="${role.equals('examExaminer')}">
                            <sql:query dataSource ="${connection}" var = "examCount">
                                SELECT COUNT(*) FROM Exams WHERE ExternalExaminer = ?
                                <sql:param value="${staffID}"/>
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
                                        SELECT * FROM Exams WHERE ExamNo = ? AND ExternalExaminer = ?
                                        <sql:param value = "${i}" />
                                        <sql:param value="${staffID}"/>
                                    </sql:query>
                                    <c:forEach var="row" items="${viewExams.rows}">     
                                        <div class="tab-pane" id="${row.ModuleCode}">
                                            <h3>Module Details:</h3>
                                            Module Name: <c:out value="${row.ModuleName}"/></br>
                                            Exam No: <c:out value="${row.ExamNo}"/></br>
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
                        </c:if>
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
