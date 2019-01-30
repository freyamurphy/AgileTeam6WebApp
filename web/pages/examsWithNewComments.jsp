<%-- 
    Document   : examsWithNewComments
    Created on : 30 Jan 2019, 15:03:15
    Author     : freyamurphy
--%>

<%@ include file="dbConnection.jsp"%>

<%-- 
    Get comments which have not been replied to yet
--%>
<sql:query sql="SELECT Comments.CommentID FROM Comments LEFT JOIN Replies On Comments.CommentID = Replies.CommentID WHERE Replies.CommentID IS NULL"
           dataSource ="${connection}" var="newComments">
</sql:query>

<c:forEach var="newComment" items="${newComments.rows}">
    
    <%--
        Get exams which have been commented on
    --%>
    <sql:query sql="SELECT ExamNo FROM Comments WHERE CommentID = ${newComment.CommentID}"
               dataSource = "${connection}" var="exams">
    </sql:query>
        
    <c:forEach var="exam" items="${exams.rows}">
        
        <%--
        Get exam details
        --%>
        <sql:query sql="SELECT ModuleCode, ModuleName, AcademicYear FROM Exams WHERE ExamNo = ${exam.ExamNo}"
               dataSource ="${connection}" var="examDetails">
        </sql:query>
        
        <c:forEach var="item" items="${examDetails.rows}">
        
            <%--
                Link to view exam comments
            --%>
            <a href="viewCommentES.jsp?examNo=${exam.examNo}">
                ${item.ModuleCode} ${item.ModuleName} ${item.AcademicYear}
            </a>
            <br>
            
        </c:forEach>
        
    </c:forEach>

</c:forEach>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exams with new comments/title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
