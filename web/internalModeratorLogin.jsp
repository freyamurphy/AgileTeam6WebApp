<%@page import="staff.StaffHandler"%>
<%-- 
    Document   : internalModeratorLogin
    Created on : 23 Jan 2019, 11:28:06
    Author     : freyamurphy
--%>

<% 
    
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    
    staff.StaffHandler staffHandler = new staff.StaffHandler();
    String correctPassword = staffHandler.getIMPassword(username);
    
    if (password.equals(correctPassword)) {
        out.print("<h1>LOGIN SUCCESSFULLY!</h1>");
        out.println("Jumping into home page...");
        %>
        <!--the code below is an auto-refresh code that will change into the createExam.html automatically-->
        <meta http-equiv="refresh" content="3;url=pages/index.html">
        <% 
    }
    else {
         out.print("<h1>INCORRECT PASSWORD!</h1>");  
         out.println("Jumping back to login page...");
        // redirect to admin login?
      %>
      <!--the code below is an auto-refresh code that will change back to the adminLogIn.html automatically-->
      <meta http-equiv="refresh" content="3;url=internalModeratorLogin.html">
      <%
    }
%>
