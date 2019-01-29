<%-- 
    Document   : AssignExamStaff
    Created on : 29 Jan 2019, 12:44:42
    Author     : lucymurphy
--%>

<%@ include file="dbConnection.jsp"%>

<sql:update dataSource="${connection}" var="updateSetter">
INSERT INTO Exams (examSetter, internalModerator, externalExaminer ) VALUES (?, ?, ?)
<sql:param value="${param.TeachStaff}" />
<sql:param value="${param.IM}" />
<sql:param value="${param.EE}" />
</sql:update>

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
