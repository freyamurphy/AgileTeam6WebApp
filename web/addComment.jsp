<%-- 
    Document   : addComment
    Created on : 23 Jan 2019, 16:19:46
    Author     : freyamurphy
--%>

<%@ include file="dbConnection.jsp"%>
<%@page import="staff.*"%>
<%@page import="classes.Comment"%>

<%
    
    String content = request.getParameter("commentBox");
    String user = request.getParameter("userRole");
    String examNo = request.getParameter("examNo");
    
    // need some cookies
    String username = "Bob";
    
    StaffHandler sh = new StaffHandler();
    Commenting commenter = new InternalModerator("", "");
    
    if(user.equals("IM"))
    {
        commenter = sh.getIM(username);
        
    }
    
    Comment userComment = commenter.addComment(content);
    String commentContent = userComment.getContent();
    String author = userComment.getAuthorUsername();
    String role = userComment.getAuthorRole();
    
    String time = userComment.getTimePosted();
    time = time.substring(0, 19);
    
    pageContext.setAttribute("content", commentContent);
    pageContext.setAttribute("author", author);
    pageContext.setAttribute("time", time);
    pageContext.setAttribute("role", role);
    pageContext.setAttribute("examNo", examNo);
            
%>
    
<html>
    <head>
        <title>Insert comment</title>
    </head>
    <body>
        <sql:update sql="INSERT INTO Comments (Content, Author, TimeOfComment, AuthorRole, ExamID) VALUES (?,?,?,?)"
                    dataSource = "${connection}" var = "result">
            <sql:param value="${content}"/>
            <sql:param value="${author}"/>        
            <sql:param value="${time}"/>
            <sql:param value="${role}"/>
            <sql:param value="${examNo}" />
     </sql:update>
     <c:if test="${result == 1}" >
            Your data was inserted correctly!
     </c:if>
    </body>
</html>

