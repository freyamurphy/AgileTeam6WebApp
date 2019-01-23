<%-- 
    Document   : processUserType
    Created on : 23 Jan 2019, 11:41:41
    Author     : freyamurphy
--%>

<%
    String role = request.getParameter("userRole");
    
    String currentURL = request.getContextPath();
    // Remove index.html from url
    String baseURL = currentURL;//.substring(0, currentURL.length() - 10);
    
    String redirectURL = baseURL;
    if (role.equals("admin")) {
        redirectURL += "/adminLogIn.html";
    }
    else if (role.equals("internalModerator")) {
        redirectURL += "/internalModeratorLogin.html";
    }
    else if (role.equals("examSetter")) {
        redirectURL += "/examSetterLogin.html";
    }
    else {
        redirectURL += "/index.html";
    }
    response.sendRedirect(redirectURL);
%>