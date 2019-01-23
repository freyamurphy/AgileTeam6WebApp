<%-- 
    Document   : createExam
    Created on : 23.01.2019, 12:37:28
    Author     : Momoko Werner
--%>

<%@page import="staff.*"%>
<%@include file="dbConnection.jsp"%>

<%
    
    //input that needs to be fetched from HTML form (createExam.html)
    
    String moduleCode = request.getParameter("moduleCode");
    String moduleName = request.getParameter("moduleName");
    String academicYear = request.getParameter("academicYear");
    String examType = request.getParameter("examType");
    String moduleDegree = request.getParameter("moduleDegree");
    
    //need to know who is logged in
    //cookies? who is logged in, use cookie to get right admin
    
    staff.StaffHandler staffhandler = new StaffHandler();
    
    //this won't work until we have the cookie working 
    //for time being use "Craig", replace later with String username
    staff.Admin admin = staffhandler.getAdmin("Craig");    
    
    admin.createExam(academicYear, moduleCode, moduleName, examType, moduleDegree);
    
    pageContext.setAttribute("academicYear",academicYear);
    pageContext.setAttribute("moduleCode",moduleCode);
    pageContext.setAttribute("moduleName",moduleName);
    pageContext.setAttribute("examType",examType);
    pageContext.setAttribute("moduleDegree",moduleDegree);
    /*
    <sql:query dataSource = "${connection}" var = "result">
            SELECT * from Exams;
        </sql:query>
        
    */
%>

<!--
    Connecting to SQL database to store info on new exam
-->
<html>
    <head>
        <title>Create Exam</title>
    </head>
    <body>
        
        <sql:update sql="INSERT INTO Exams VALUES (23,?,?,?,?,?)"
                    dataSource = "${connection}" var = "result">
            <sql:param value="${academicYear}"/>
            <sql:param value="${moduleCode}"/>        
            <sql:param value="${moduleName}"/>
            <sql:param value="${examType}"/>
            <sql:param value="${moduleDegree}"/>
        </sql:update>
        
        
    </body>
</html>
    