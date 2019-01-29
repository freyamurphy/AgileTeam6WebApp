<%-- 
    Document   : editUser
    Created on : 29 Jan 2019, 09:44:37
    Author     : freyamurphy
--%>

<%@ include file="../dbConnection.jsp"%>

<%
    String fName = request.getParameter("firstName");
    String lName = request.getParameter("lastName");
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String[] roles = request.getParameterValues("role");
    String originalUsername = request.getParamter("origusername");
    
    pageContext.setAttribute("fName", fName);
    pageContext.setAttribute("lName", lName);
    pageContext.setAttribute("username", username);
    pageContext.setAttribute("password", password);
    pageContext.setAttribute("roles", roles);
    pageContext.setAttribute("originalUsername", originalUsername);
%>

<c:forEach var="role" items="${roles}">
    <sql:update sql="UPDATE Staff SET FirstName='${fName}', LastName='${lName}', Username='${username}', Password='${password}' WHERE Username='${originalUsername}' AND Role='${role}'"
                dataSource="${connection}" var="update">
    </sql:update>
    <c:if test="${update != 1}" >
        <sql:update sql="INSERT INTO Staff(FirstName, LastName, Username, Password, Role) VALUES (?, ?, ?, ?, ?)"
                dataSource="${connection}" var="create">
        <sql:param value="${fName}"/>
        <sql:param value="${lName}"/>
        <sql:param value="${username}"/>
        <sql:param value="${password}"/>
        <sql:param value="${role}"/>
    </sql:update>
     </c:if>
</c:forEach>
