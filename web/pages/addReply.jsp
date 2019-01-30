<%-- 
    Document   : addReply
    Created on : 29 Jan 2019, 16:10:44
    Author     : freyamurphy
--%>
<%@include file="../dbConnection.jsp"%>
<%@page import="java.sql.Timestamp"%>

<%
    //var from front end form
    String content = request.getParameter("commentBox");
    String commentID = request.getParameter("commentID");
    //var for cookies
    String username = "";
    String role = "";
    
    //Fetch username and role values from cookies
    Cookie cookie = null;
    Cookie[] cookies = null;
    //Get cookies array
    cookies = request.getCookies();
    //check if cookies exist
    if( cookies != null ) {
        //loop through cookie array
        for (int i = 0; i < cookies.length; i++) {
            cookie = cookies[i];
            //check if cookie is the username cookie
            if (cookie.getName().equals("username")) {
                //Store username cookie's value as JSP variable
                username = cookie.getValue();
            }
            else if (cookie.getName().equals("role")) {
                //Store role cookie's value as JSP variable
                role = cookie.getValue();
            }
        }
    }
    else {
        //browser didn't store cookies, usually means not logged in
        out.println("<h2>No cookies found</h2>");
    }
    
    pageContext.setAttribute("content", content);
    pageContext.setAttribute("commentID", commentID);
    pageContext.setAttribute("username", username);
    pageContext.setAttribute("role", role);
    
    Timestamp timePosted = new Timestamp(System.currentTimeMillis());
    pageContext.setAttribute("timePosted", timePosted);
    
%>

<!-- SQL query for staffID -->
<sql:query dataSource = "${connection}" var = "IDlist">
            SELECT ID FROM Staff WHERE Role = ? AND Username = ?
            <sql:param value="${role}"/>
            <sql:param value="${username}"/>
        </sql:query>
        
        <!-- Take results and store in ID var -->
        <c:forEach var="IDRow" items="${IDlist.rows}">
            <c:set var="staffID" value="${IDRow.ID}" scope="session"/>
        </c:forEach>

<!-- SQL Insert of Reply-->
<sql:update sql="INSERT INTO Replies (Content, TimeOfReply, Author, CommentID) VALUES (?,?,?,?)"
            dataSource = "${connection}" var = "result">
    <sql:param value="${content}"/>
    <sql:param value="${timePosted}"/>        
    <sql:param value="${staffID}"/>
    <sql:param value="${commentID}" />
</sql:update>
<c:if test="${result == 1}" >
    <p>Your data was inserted correctly!</p>
</c:if>
