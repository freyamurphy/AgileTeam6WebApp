<%-- 
    Document   : signExamForm
    Created on : 29.01.2019, 12:18:02
    Author     : Lucy Taylor
--%>

<%@page import="staff.*"%>
<%@include file="dbConnection.jsp"%>

<html>
    <head>
        <title>Sign Exam</title>
    </head>
    <body>
        <h1>Sign Exam</h1>
         <sql:query dataSource = "${connection}" var = "exams">
            SELECT ExamNo, ModuleCode, ModuleName, AcademicYear FROM Exams;
         </sql:query>
        <h2>Select Exam:</h2>
        <form role="form" action="signExam.jsp" method="post">
        <select name = "examList">
        <c:forEach var="i" items="${exams.rows}">
            <option value="${i.ExamNo}">
                <c:out value="${i.ModuleCode} ${i.ModuleName} ${i.AcademicYear}"/>
            </option>
        </c:forEach>
        </select>
        <input type="submit" value="Sign Exam"/>
        </form>
    </body>
</html>