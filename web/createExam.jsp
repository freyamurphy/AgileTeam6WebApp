<%-- 
    Document   : createExam
    Created on : 23.01.2019, 12:37:28
    Author     : Momoko Werner
--%>

<%@page import="staff.*"%>


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
    
    //add functionality
%>
