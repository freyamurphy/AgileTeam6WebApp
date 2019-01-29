<%-- 
    Document   : EditUserForm
    Created on : 29 Jan 2019, 09:47:45
    Author     : freyamurphy
--%>

<%@ include file="../dbConnection.jsp"%>

<%-- 
    Each username is unique, but may appear in different
    rows for different roles (my dodgy database design)
    Hence only select distinct usernames.
    Distinct so that bob only drops down once
--%>
<sql:query sql="SELECT DISTINCT Username FROM Staff" 
           var="result" dataSource="${connection}">
</sql:query>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Choose user to edit</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <form action="editUserForm.jsp" method="POST" id="comment"> 
            <label>Choose a user to edit:</label>
            
            <select name = "username">
                <c:forEach var="row" items="${result.rows}">
                    <option value="${row.Username}">
                        <c:out value="${row.Username}"/>
                    </option>
                </c:forEach>
            </select>
            
            <input type="submit" value="Submit"/>
        </form>
    </body>
</html>
