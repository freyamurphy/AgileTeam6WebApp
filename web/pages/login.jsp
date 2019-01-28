<%-- 
    Document   : login
    Created on : 28 Jan 2019, 10:50:35
    Author     : freyamurphy
--%>

<%@include file="../dbConnection.jsp"%>
<%
    // Get form inputs
    String username = request.getParameter("username"); 
    String password = request.getParameter("password");
    String role = request.getParameter("role");
    
    // Make variables visible to JSTL (for SQL stuff)
    pageContext.setAttribute("username", username);
    pageContext.setAttribute("password", password);
    pageContext.setAttribute("role", role);
%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <sql:query sql="SELECT Password, FirstName FROM Staff WHERE Username='${username}' AND Role='${role}'" 
           var="result" dataSource="${connection}">
        </sql:query>

        <c:forEach var="row" items="${result.rows}">
            <c:choose>
            <c:when test="${password == row.Password}">
                <p>Correct password</p>
            </c:when>
            <c:otherwise>
                <p>Incorrect password </p>
            </c:otherwise>
            </c:choose>
         </c:forEach>
    </body>
</html>
