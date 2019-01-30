<%-- 
    Document   : AssignExam
    Created on : 24 Jan 2019, 12:13:11
    Author     : lucymurphy
--%>
<%@ include file="dbConnection.jsp"%>

<sql:query sql="SELECT ExamNo, ModuleCode, ModuleName, AcademicYear FROM Exams"
           var="Exam" dataSource="${connection}">
</sql:query>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Assign Exam Setter</title>
    </head>
    <body>
        <div style="margin: auto; width: 50%;">
            <h1> Assign an Exam to a member of teaching staff</h1>
            <p> Select an exam from the options available then select a member of Teaching Staff to assign 
                an exam to them.</p>
            <h3>Exams available</h3>

            <%
            //get setter from hashmap
            //request.setAttribute("availableSetters", eSList);
            %>

            <% //get input from select and send selected exam to selected setter
             //make sure the exam has sent (use counter?)
            %>

            <form action= "AssignExamStaff.jsp" method="post" id="AssignExam">
                <select name = "Exam">
                    <c:forEach var="row" items="${Exam.rows}">
                        <option value="${row.ExamNo}">
                            <c:out value="${row.ModuleCode} ${row.ModuleName} ${row.AcademicYear}"/>
                        </option>
                    </c:forEach>
                </select> 
                <c:out value="${row.ExamNo}"/>
                <h3>Teaching Staff Available</h3>
                <sql:query sql="SELECT ID, FirstName, LastName FROM Staff
                           WHERE Role = 'examSetter'"
                           var="TeachStaff" dataSource="${connection}">
                </sql:query>      
                <select name = "TeachStaff">
                    <c:forEach var="row" items="${TeachStaff.rows}">
                        <option value="${row.ID}">
                            <c:out value="${row.FirstName} ${row.LastName}"/>
                        </option>
                    </c:forEach>
                </select> 

                <h3>Internal Moderators Available</h3>
                <sql:query sql="SELECT ID, FirstName, LastName FROM Staff
                           WHERE Role = 'internalModerator'"
                           var="IM" dataSource="${connection}">
                </sql:query>
                <select name = "IM">
                    <c:forEach var="row" items="${IM.rows}">
                        <option value="${row.ID}">
                            <c:out value="${row.FirstName} ${row.LastName}"/>
                        </option>
                    </c:forEach>
                </select> 


                <h3>External Examiners Available</h3>
                <sql:query sql="SELECT ID, FirstName, LastName FROM Staff
                           WHERE Role = 'externalExaminer'"
                           var="EE" dataSource="${connection}">
                </sql:query>
                <select name = "EE">
                    <c:forEach var="row" items="${EE.rows}">
                        <option value="${row.ID}">
                            <c:out value="${row.FirstName} ${row.LastName}"/>
                        </option>
                    </c:forEach>
                </select> 

                <h1> </h1>
                <input type="submit" value="Assign"/>

            </form>
        </div>      
    </body>
</html>