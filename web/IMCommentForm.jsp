<%-- 
    Document   : IMCommentForm
    Created on : 24 Jan 2019, 13:29:52
    Author     : freyamurphy
--%>
<%@ include file="dbConnection.jsp"%>

<sql:query sql="SELECT ExamNo, ModuleCode, ModuleName, AcademicYear FROM Exams" 
           var="result" dataSource="${connection}">
</sql:query>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Add comment</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <h1>Please enter a comment</h1>
        <form action="addComment.jsp" method="POST" id="comment"> 
            <input type="submit" value="Submit"/>
            <select name = "examNo">
                <c:forEach var="row" items="${result.rows}">
                    <option value="${row.ExamNo}">
                        <c:out value="${row.ModuleCode} ${row.ModuleName} ${row.AcademicYear}"/>
                    </option>
                </c:forEach>
            </select>
        </form>
        <textarea name="commentBox" form="comment"></textarea>
    </body>
</html>
