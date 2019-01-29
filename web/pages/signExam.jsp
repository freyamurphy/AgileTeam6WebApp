<%-- 
    Document   : signExam
    Created on : 24.01.2019, 13:18:12
    Author     : Lucy Taylor
--%>

<%@page import="staff.*"%>
<%@include file="dbConnection.jsp"%>

<%
    
    String username = "";
    String role = "";
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
    
    
    //Fetch Input From HTML Form (currently no exist) 
    //int examID = Integer.parseInt(request.getParameter("examID"));
    
    
    /*Convert JSP variables to JSTL attributes
     *Not needed at the moment since username and role variable not used outside of JSP tags
    */
    //pageContext.setAttribute("username",username);
    //pageContext.setAttribute("role",role);
    
    
    //This is hardcoded in atm, needs to be changed later
    String ExamParam = request.getParameter("examList");
    pageContext.setAttribute("examID", ExamParam);  
    
    //Fill Columns Based On Role
    if (role.equals("internalModerator"))
    {
        pageContext.setAttribute("esSig", null);
        pageContext.setAttribute("imSig", username);
        pageContext.setAttribute("evSig", null);
        pageContext.setAttribute("emSig", null);
    }
    else if (role.equals("examVettingCommittee"))
    {
        pageContext.setAttribute("esSig", null);
        pageContext.setAttribute("imSig", null);
        pageContext.setAttribute("evSig", username);
        pageContext.setAttribute("emSig", null);
    }
    else if (role.equals("externalExaminer"))
    {
        pageContext.setAttribute("esSig", null);
        pageContext.setAttribute("imSig", null);
        pageContext.setAttribute("evSig", null);
        pageContext.setAttribute("emSig", username);
    }
    else if (role.equals("examSetter"))
    {
        pageContext.setAttribute("esSig", username);
        pageContext.setAttribute("imSig", null);
        pageContext.setAttribute("evSig", null);
        pageContext.setAttribute("emSig", null);
    }
        
%>

<!--
    Connecting to SQL database to store info on new exam
-->
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
                <a class="navbar-brand" href="adminDashboard.html">Team 6 -- the best team :)</a>
            </div>
            <!-- /.navbar-header -->
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">

            </div>
            <!-- /.navbar-static-side -->
        </nav>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Success!</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
               
        <c:if test="${imSig != null}">
            <sql:update sql="INSERT INTO Signatures (ExamSetterSignatures, InternalModeratorSignatures, ExamVettingCommitteeSignatures, ExternalModeratorSignatures, ExamID) VALUES (?,?,?,?,?) ON DUPLICATE KEY UPDATE InternalModeratorSignatures=values(InternalModeratorSignatures)" dataSource = "${connection}" var = "result">
                <sql:param value="${esSig}"/>
                <sql:param value="${imSig}"/>
                <sql:param value="${evSig}"/>
                <sql:param value="${emSig}"/>
                <sql:param value="${examID}"/>
            </sql:update>
        </c:if>
        <c:if test="${evSig != null}">
            <sql:update sql="INSERT INTO Signatures (ExamSetterSignatures, InternalModeratorSignatures, ExamVettingCommitteeSignatures, ExternalModeratorSignatures, ExamID) VALUES (?,?,?,?,?) ON DUPLICATE KEY UPDATE ExamVettingCommitteeSignatures=values(ExamVettingCommitteeSignatures)" dataSource = "${connection}" var = "result">
                <sql:param value="${esSig}"/>
                <sql:param value="${imSig}"/>
                <sql:param value="${evSig}"/>
                <sql:param value="${emSig}"/>
                <sql:param value="${examID}"/>
            </sql:update>
        </c:if>
        <c:if test="${emSig != null}">
            <sql:update sql="INSERT INTO Signatures (ExamSetterSignatures, InternalModeratorSignatures, ExamVettingCommitteeSignatures, ExternalModeratorSignatures, ExamID) VALUES (?,?,?,?,?) ON DUPLICATE KEY UPDATE ExternalModeratorSignatures=values(ExternalModeratorSignatures)" dataSource = "${connection}" var = "result">
                <sql:param value="${esSig}"/>
                <sql:param value="${imSig}"/>
                <sql:param value="${evSig}"/>
                <sql:param value="${emSig}"/>
                <sql:param value="${examID}"/>
            </sql:update>
        </c:if>
        <c:if test="${esSig != null}">
            <sql:update sql="INSERT INTO Signatures (ExamSetterSignatures, InternalModeratorSignatures, ExamVettingCommitteeSignatures, ExternalModeratorSignatures, ExamID) VALUES (?,?,?,?,?) ON DUPLICATE KEY UPDATE ExamSetterSignatures=values(ExamSetterSignatures)" dataSource = "${connection}" var = "result">
                <sql:param value="${esSig}"/>
                <sql:param value="${imSig}"/>
                <sql:param value="${evSig}"/>
                <sql:param value="${emSig}"/>
                <sql:param value="${examID}"/>
            </sql:update>
        </c:if>
         
         <h4>You Have Successfully Signed The Exam.</h4>
        <a type="back" href="signExamForm.jsp" class="btn btn-primary" style="float: left;">Back to Dashboard</a>
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