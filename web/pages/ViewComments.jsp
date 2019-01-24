<%-- 
    Document   : ViewComments
    Created on : 24 Jan 2019, 17:15:37
    Author     : freyamurphy
--%>

<%@include file="../dbConnection.jsp"%>
<%@page import="classes.Comment"%>
<% 
    String examNo = request.getParameter("examNo");
    // Make variable accessible to JSTL
    pageContext.setAttribute("examNo", examNo);
%>

<sql:query sql="SELECT Content, Author, TimeOfComment, AuthorRole FROM Comments WHERE ExamNo = ${examNo}" 
           var="result" dataSource="${connection}">
</sql:query>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View comments</title>
    </head>
    <body>
        <c:forEach var="row" items="${result.rows}">
            <div>
                <p class="content">
                    <c:out value="${row.Content}"/>
                </p>
                <p class="author">
                    <c:out value="${row.Author}"/>
                </p>
                <p class="time">
                    <c:out value="${row.TimeOfComment}"/>
                </p>
                <p>
                    <c:out value="${row.AuthorRole}"/>
                </p>
            </div>
        </c:forEach>
    </body>
</html>
