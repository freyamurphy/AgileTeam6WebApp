<%-- 
    Document   : addComment
    Created on : 23 Jan 2019, 16:19:46
    Author     : freyamurphy
--%>

<%@ include file="dbConnection.jsp"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="staff.*"%>
<%@page import="classes.Comment"%>

<%
    
    String content = request.getParameter("commentBox");
    String examNo = request.getParameter("examNo");
    
    pageContext.setAttribute("content", content);
    pageContext.setAttribute("examNo", examNo);
    
    // need some cookies
    String staffID = "5";
    
    pageContext.setAttribute("staffID", staffID);  

    Timestamp timePosted = new Timestamp(System.currentTimeMillis());
    pageContext.setAttribute("timePosted", timePosted);
%>
    
<html>
    <head>
        <title>Insert comment</title>
    </head>
    <body>
        <sql:update sql="INSERT INTO Comments (Content, Author, TimeOfComment, ExamNo) VALUES (?,?,?,?)"
                    dataSource = "${connection}" var = "result">
            <sql:param value="${content}"/>
            <sql:param value="${staffID}"/>        
            <sql:param value="${timePosted}"/>
            <sql:param value="${examNo}" />
     </sql:update>
     <c:if test="${result == 1}" >
            Your data was inserted correctly!
     </c:if>
    </body>
</html>

