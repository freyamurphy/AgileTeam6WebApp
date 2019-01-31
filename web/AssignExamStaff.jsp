<%-- 
    Document   : AssignExamStaff
    Created on : 29 Jan 2019, 12:44:42
    Author     : lucymurphy
--%>

<%@ include file="dbConnection.jsp"%>

<sql:update dataSource="${connection}" var="updateSetter">
    UPDATE Exams SET ExamSetter = ?, InternalModerator = ?, ExternalExaminer = ? WHERE ExamNo = ?
    <sql:param value="${param.TeachStaff}" />
    <sql:param value="${param.IM}" />
    <sql:param value="${param.EE}" />
    <sql:param value="${param.Exam}" />
</sql:update>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Assign Exam</title>
    </head>
    <body>
        <h1>Redirecting you back to the assign exam page </h1>
        <script language="javascript">
            window.location.href = "./pages/AssignExam.jsp"
        </script>
    </body>
</html>
