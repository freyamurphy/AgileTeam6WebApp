<%-- 
    Document   : viewCommentES
    Created on : 29 Jan 2019, 14:40:38
    Author     : freyamurphy
--%>

<%@include file="../dbConnection.jsp"%>
<% 
    String examNo = request.getParameter("examNo");
    examNo = "1";
    // Make variable accessible to JSTL
    pageContext.setAttribute("examNo", examNo);
%>

<sql:query sql="SELECT CommentID, Content, Author, TimeOfComment FROM Comments WHERE ExamNo = ${examNo}" 
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
            <sql:query sql="SELECT FirstName, LastName, Role FROM Staff WHERE ID = ${row.Author}" 
                       var="staffResult" dataSource="${connection}">
            </sql:query>
            <c:forEach var="staff" items="${staffResult.rows}">
                <div>
                    <p class="content">
                        <c:out value="${row.Content}"/>
                    </p>
                    <p class="author">
                        <c:out value="${staff.Firstname} ${staff.LastName}"/>
                    </p>
                    <p class="time">
                        <c:out value="${row.TimeOfComment}"/>
                    </p>
                    <p>
                        <c:out value="${staff.role}" />
                    </p>
                    <form action="addReply.jsp">
                        <input type="hidden" value="${row.CommentID}" name="commentID"/>
                        <input type="submit" value="Reply" />
                    </form>
                    <br>
                </div>
            </c:forEach>
        </c:forEach>
    </body>
</html>
