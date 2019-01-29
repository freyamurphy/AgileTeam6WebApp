<%-- 
    Document   : addComment
    Created on : 23 Jan 2019, 16:19:46
    Author     : freyamurphy
--%>

<%@ include file="dbConnection.jsp"%>
<%@page import="java.sql.Timestamp"%>

<%
    //get user input from HTML form
    String content = request.getParameter("commentBox");
    String examNo = request.getParameter("examNo");
    
    //String staffID = "5";
    String username ="";
    String role ="";
    
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
        //browser didn't store cookies
        out.println("<h2>No cookies found</h2>");
    }
    
    //turn JSP var into JSTL attributes
    pageContext.setAttribute("content", content);
    pageContext.setAttribute("examNo", examNo);
    pageContext.setAttribute("username", username);  
    pageContext.setAttribute("role", role);
    
    
    //create a timestamp attribute
    Timestamp timePosted = new Timestamp(System.currentTimeMillis());
    pageContext.setAttribute("timePosted", timePosted);
    
%>
    
<html>
    <head>
        <title>Insert comment</title>
    </head>
    <body>
        <!-- SQL Query to get staffID -->
        <sql:query dataSource = "${connection}" var = "IDlist">
            SELECT ID FROM Staff WHERE Role = ? AND Username = ?
            <sql:param value="${role}"/>
            <sql:param value="${username}"/>
        </sql:query>
        
        <!-- Take results and store in ID var -->
        <c:forEach var="IDRow" items="${IDlist.rows}">
            <c:set var="staffID" value="${IDRow.ID}" scope="session"/>
            
        </c:forEach>
                              
        <sql:update sql="INSERT INTO Comments (Content, Author, TimeOfComment, ExamNo) VALUES (?,?,?,?)"
                    dataSource = "${connection}" var = "result">
            <sql:param value="${content}"/>
            <sql:param value="${staffID}"/>        
            <sql:param value="${timePosted}"/>
            <sql:param value="${examNo}" />
     </sql:update>
     <c:if test="${result == 1}" >
         <c:out value = "Thanks, ${username}!"/>
         <br/>Your data was inserted correctly!
     </c:if>
    </body>
</html>

