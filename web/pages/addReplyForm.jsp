<%-- 
    Document   : addReply
    Created on : 29 Jan 2019, 16:04:00
    Author     : freyamurphy
--%>

<%
    String commentID = request.getParameter("commentID");
    
    pageContext.setAttribute("commentID", commentID);
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add reply form</title>
    </head>
    <body>
        <form action="addReply.jsp" method="POST" id="comment"> 
            <input type="submit" value="Submit"/>
            <input type="hidden" value="${commentID}" name="commentID"
            <label>Reply:</label>
        </form>
        <textarea name="commentBox" form="comment"></textarea>
    </body>
</html>
