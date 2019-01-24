
<%@page import="staff.StaffHandler"%>
<%-- 
    Document   : adminLogIn
    Created on : 22 Jan 2019, 10:39:36
    Author     : freyamurphy
--%>

<% 
    
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    
    staff.StaffHandler staffHandler = new staff.StaffHandler();
    String correctPassword = staffHandler.getAdminPassword(username);
    
    if (password.equals(correctPassword)) {
        
        out.print("<h1>CORRECT PASSWORD!!!!</h1>");
        %>
        <!--the code below is an auto-refresh code that will change into the createExam.html automatically-->
        <meta http-equiv="refresh" content="5;url=http://localhost:8081/AgileTeam6WebApp/createExam.html">
        <%
        // Redirect to admin dashboard
    
    }
    else {
        out.print("<h1>INCORRECT LOGIN</h1>");
        // redirect to admin login?
    }
%>
