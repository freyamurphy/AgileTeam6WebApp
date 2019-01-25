<%-- 
    Document   : AssignExam
    Created on : 24 Jan 2019, 12:13:11
    Author     : lucymurphy
--%>

<%@page import="staff.*"%>
<%@page import="classes.*"%>
<%@ include file="dbConnection.jsp"%>

   <sql:query sql="SELECT ModuleCode, ModuleName FROM Exams" 
           var="result" dataSource="${connection}">
</sql:query>
   
   <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Assign Exam Setter</title>
    </head>
    <body>
        <div style="margin: auto; width: 50%;">
            <h1> Assign an Exam to an Exam Setter</h1>
            <p> Select an exam from the options available then select a member of Teaching Staff to assign 
            an exam to them.</p>
               <form action= "AssignExamSetter.jsp" method="post">
        
               <h3>Exams available</h3>
               <select name = "Exams">
                <c:forEach var="Exams" items="${result.rows}">
                    <option value="${row.ExamNo}">
                        <c:out value="${row.ModuleCode} ${row.ModuleName} ${row.AcademicYear}"/>
                    </option>
                </c:forEach>
            </select>
         <%
   //get setter from hashmap
   request.setAttribute("availableSetters", eSList);
    %>
   <h3>Teaching Staff</h3>
        <select name="Teaching Staff">
            <c:forEach items="${availableSetters}" var="setter" >
                <option value="${availableSetters.key}" </option>
            </c:forEach>
        </select>
  <% //get input from select and send selected exam to selected setter
   String Exam = request.getParameter("Exams");
   String Setter = request.getParameter("Setter");
   //make sure the exam has sent (use counter?)
%>

<input type="submit" value="Assign"/>
        
        </form>
        </div>      
    </body>
</html>