<%-- 
    Document   : createUser
    Created on : 28 Jan 2019, 16:19:01
    Author     : freyamurphy
--%>

<%@ include file="../dbConnection.jsp"%>

<%
    String fName = request.getParameter("firstName");
    String lName = request.getParameter("lastName");
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String[] roles = request.getParameterValues("role");
    
    pageContext.setAttribute("fName", fName);
    pageContext.setAttribute("lName", lName);
    pageContext.setAttribute("username", username);
    pageContext.setAttribute("password", password);
    pageContext.setAttribute("roles", roles);
    
    if (roles != null) {
        for (int i = 0; i < roles.length; i++) {
            out.println ("<b>"+roles[i]+"<b>");
        }
    }
%>

<c:forEach var="row" items="${roles}">
    <sql:update sql="INSERT INTO Staff(FirstName, LastName, Username, Password, Role) VALUES (?, ?, ?, ?, ?)"
                dataSource="${connection}" var="result">
        <sql:param value="${fName}"/>
        <sql:param value="${lName}"/>
        <sql:param value="${username}"/>
        <sql:param value="${password}"/>
        <sql:param value="${row}"/>
    </sql:update>
</c:forEach>
