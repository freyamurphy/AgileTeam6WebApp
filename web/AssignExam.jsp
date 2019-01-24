<%-- 
    Document   : AssignExam
    Created on : 24 Jan 2019, 12:13:11
    Author     : lucymurphy
--%>

<%@page import="staff.*"%>
<%@page import="classes.*"%>
        
<%
   //get exams from db, Results array php??
   
   
   //get setter from hashmap
   request.setAttribute("availableSetters", eSList);
@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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