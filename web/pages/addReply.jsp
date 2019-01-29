<%-- 
    Document   : addReply
    Created on : 29 Jan 2019, 16:10:44
    Author     : freyamurphy
--%>

<%@page import="java.sql.Timestamp"%>

<%
    String content = request.getParameter("commentBox");
    String commentID = request.getParameter("commentID");
    
    pageContext.setAttribute("content", content);
    pageContext.setAttribute("commentID", commentID);
    
    // cookies go here
    String staffID = "5";
    pageContext.setAttribute("staffID", staffID);
    
    Timestamp timePosted = new Timestamp(System.currentTimeMillis());
    pageContext.setAttribute("timePosted", timePosted);
    
%>

<sql:update sql="INSERT INTO Replies (Content, Author, TimeOfReply, CommentID) VALUES (?,?,?,?)"
            dataSource = "${connection}" var = "result">
    <sql:param value="${content}"/>
    <sql:param value="${staffID}"/>        
    <sql:param value="${timePosted}"/>
    <sql:param value="${commentID}" />
 </sql:update>
<c:if test="${result == 1}" >
    <p>Your data was inserted correctly!</p>
</c:if>
