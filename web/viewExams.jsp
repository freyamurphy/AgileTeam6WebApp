<%-- 
    Document   : viewExams
    Created on : 2019年1月23日, 下午5:30:11
    Author     : YHSSSS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="dbConnection.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>View All Exams</h1>

        <c:set var = "order" value = "ModuleName"/>
        <sql:query dataSource="${connection}" var="result">
        SELECT * FROM Exams ORDER BY ${order};     
        </sql:query>
         
<c:forEach var="row" items="${result.rows}">
<tr>
   <th>ModuleName:<c:out value="${row.ModuleName}"/></th></br>
   <th>ModuleCode:<c:out value="${row.ModuleCode}"/></th></br>
   <th>ExamNo:<c:out value="${row.ExamNo}"/></th></br>
   <th>AcademicYear:<c:out value="${row.AcademicYear}"/></th></br>
   <th>ExamType:<c:out value="${row.ExamType}"/></th></br>
   <th>ModuleDegree:<c:out value="${row.ModuleDegree}"/></th></br></br>
   
   
   <%--do we need download link for each module?--%>
</tr>
</c:forEach>
    </body>
</html>
