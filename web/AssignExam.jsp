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
            <h3>Exams available</h3>
               <form action= "AssignExamSetter.jsp" method="post" id="AssignExam">
         <select name = "Exams">
                <c:forEach var="row" items="${result.rows}">
                    <option value="${row.ExamNo}">
                        <c:out value="${row.ModuleCode} ${row.ModuleName} ${row.AcademicYear}"/>
                    </option>
                </c:forEach>
         </select>
    
    
         <%
   //get setter from hashmap
   //request.setAttribute("availableSetters", eSList);
    %>
   <h3>Teaching Staff</h3>
        <select name="Teaching Staff">
            <option
                value="craig">Craig</option> 
            <option
                value="Iain">Iain</option>
            <option
                value="Rachel">Rachel</option>
            
        </select>
  <% //get input from select and send selected exam to selected setter
   //make sure the exam has sent (use counter?)
%>

<input type="submit" value="Assign"/>
        
        </form>
        </div>      
    </body>
</html>