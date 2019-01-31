<%-- 
    Document   : editUserForm
    Created on : 29 Jan 2019, 10:23:18
    Author     : freyamurphy
--%>

<%@ include file="../dbConnection.jsp"%>

<%
    // Get username from form submission
    String username = request.getParameter("username");
    
    // Convert username variable to a JSTL attribute
    pageContext.setAttribute("username", username);
%>

<script>
    function check(id) {
        document.getElementById(id).checked = true;
    }
</script>

<%--
    The password, first name and last name should be the same for every occurrence
    of the same username. This is thanks to my dodgy database design (sorry).
    A different role will be returned for each row.
--%>
<sql:query sql="SELECT Password, FirstName, LastName, Role FROM Staff WHERE Username='${username}'"
           dataSource="${connection}" var="result">
</sql:query>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit user</title>
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
                <div class="col-md-12">
                <h3>Choose Roles To Assign</h3>
                <br>

            <form action="editUser.jsp">
                <%-- 
                    This loop will only execute once. I cannot figure out a better
                    way to access only the first row of the results.
                --%>
                <c:forEach begin="0" end="0" var="row" items="${result.rows}">
                    <label>First name: </label>
                    <input type="text" name="firstName" placeholder="${row.FirstName}"/>

                    <label>Last name: </label>
                    <input type="text" name="lastName" placeholder="${row.LastName}" />

                    <label>Username: </label>
                    <input type="text" name="username" placeholder="${username}"/>

                    <label>Password: </label>
                    <input type="text" name="password" placeholder="${row.Password}"/>
                </c:forEach>
                
                <label>Admin:</label>
                <input id="adminCheckbox" type="checkbox" name="role" value="admin"/>
                <br>
                <label>Exam setter:</label>
                <input id="ESCheckbox" type="checkbox" name="role" value="examSetter"/>
                <br>
                <label>Internal moderator:</label>
                <input id="IMCheckbox" type="checkbox" name="role" value="internalModerator"/>
                <br>
                <label>Exam vetting committee:</label>
                <input id="EVCCheckbox" type="checkbox" name="role" value="examVettingCommittee"/>
                <br>
                <label>External examiner</label>
                <input id="EECheckbox" type="checkbox" name="role" value="externalExaminer"/>
                <br>
                <label>School office</label>
                <input id="SOCheckbox" type="checkbox" name="role" value="schoolOffice"/>
                    
                <%--
                    Must redo query since you can only iterate through results once
                --%>
                <sql:query sql="SELECT Password, FirstName, LastName, Role FROM Staff WHERE Username='${username}'"
                    dataSource="${connection}" var="roles">
                </sql:query>
                
                <c:forEach var="row" items="${roles.rows}">
                    
                    
                    <c:choose>
                        
                        <c:when test="${row.Role == 'admin'}">
                            <script>
                                check("adminCheckbox");
                            </script>
                        </c:when>

                    </c:choose>
                </c:forEach>
                
                           
                <sql:query sql="SELECT Password, FirstName, LastName, Role FROM Staff WHERE Username='${username}'"
                    dataSource="${connection}" var="roles">
                </sql:query>    
                            
                <c:forEach var="row" items="${roles.rows}">
                    
                    <c:choose>
                        <c:when test="${row.Role == 'examSetter'}">
                            <script>
                                check("ESCheckbox");
                            </script>
                        </c:when>

                    </c:choose>
                </c:forEach>
                    
                            
                 <sql:query sql="SELECT Password, FirstName, LastName, Role FROM Staff WHERE Username='${username}'"
                    dataSource="${connection}" var="roles">
                </sql:query>    
                            
                <c:forEach var="row" items="${roles.rows}">
                            
                    
                    <c:choose>
                        <c:when test="${row.Role == 'internalModerator'}">
                            <script>
                                check("IMCheckbox");
                            </script>
                        </c:when>

                    </c:choose>
                </c:forEach>

                            
                <sql:query sql="SELECT Password, FirstName, LastName, Role FROM Staff WHERE Username='${username}'"
                    dataSource="${connection}" var="roles">
                </sql:query>    
                   
                            
                <c:forEach var="row" items="${roles.rows}">
                    
                    <c:choose>
                        <c:when test="${row.Role == 'examVettingCommittee'}">
                            <script>
                                check("EVCCheckbox");
                            </script>
                        </c:when>

                    </c:choose>
                </c:forEach>

                            
                <sql:query sql="SELECT Password, FirstName, LastName, Role FROM Staff WHERE Username='${username}'"
                    dataSource="${connection}" var="roles">
                </sql:query>    
                            
                <c:forEach var="row" items="${roles.rows}">
                    
                    <c:choose>
                        <c:when test="${row.Role == 'externalExaminer'}">
                            <script>
                                check("EECheckbox");
                            </script>
                        </c:when>

                    </c:choose>
                </c:forEach>
                           
                            
                <sql:query sql="SELECT Password, FirstName, LastName, Role FROM Staff WHERE Username='${username}'"
                    dataSource="${connection}" var="roles">
                </sql:query>    
                            
                <c:forEach var="row" items="${roles.rows}">
                    
                    <c:choose>
                        <c:when test="${row.Role == 'schoolOffice'}">
                            <script>
                                check("SOCheckbox");
                            </script>
                        </c:when>

                    </c:choose>
                </c:forEach>
            
                            <br>
                            <br>
                <input type="submit" value="Update user" />
            </form>
        </div>
            </div>
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
