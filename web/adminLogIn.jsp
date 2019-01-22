
<%@page import="staff.StaffHandler"%>
<%-- 
    Document   : adminLogIn
    Created on : 22 Jan 2019, 10:39:36
    Author     : freyamurphy
--%>

<% 
    
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    
    staff.StaffHandler sf = new staff.StaffHandler();
    String correctPassword = new String();
    correctPassword  = sf.getPassword(username);
    
    if (password == correctPassword) {
        %>
        <h1>CORRECT PASSWORD!!!!</h1>
    <%
    }
    else {
        %> <h1>INCORRECT LOGIN</h1> <%
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
