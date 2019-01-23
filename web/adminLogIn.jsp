
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
    
    }
    else {
        out.print("<h1>INCORRECT LOGIN</h1>");
    }
%>
