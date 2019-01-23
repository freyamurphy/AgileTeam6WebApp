<%@page import="staff.StaffHandler"%>
<%-- 
    Document   : examSetterLogin
    Created on : 23 Jan 2019, 11:30:51
    Author     : freyamurphy
--%>

<% 
    
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    
    staff.StaffHandler staffHandler = new staff.StaffHandler();
    String correctPassword = staffHandler.getESPassword(username);
    
    if (password.equals(correctPassword)) {
        
        out.print("<h1>CORRECT PASSWORD!!!!</h1>");
        // Redirect to ES dashboard
    
    }
    else {
        out.print("<h1>INCORRECT LOGIN</h1>");
        // redirect to ES login?
    }
%>
