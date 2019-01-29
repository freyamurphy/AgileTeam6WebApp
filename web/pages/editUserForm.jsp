<%-- 
    Document   : editUserForm
    Created on : 29 Jan 2019, 10:23:18
    Author     : freyamurphy
--%>

<%@ include file="../dbConnection.jsp"%>

<%
    // Get username from form submission
    String username = request.getParameter("username");
    
    // Convert username variable to a JSTL attribute
    pageContext.setAttribute("username", username);
%>

<script>
    function check(id) {
        document.getElementById(id).checked = true;
    }
</script>

<%--
    The password, first name and last name should be the same for every occurrence
    of the same username. This is thanks to my dodgy database design (sorry).
    A different role will be returned for each row.
--%>
<sql:query sql="SELECT Password, FirstName, LastName, Role FROM Staff WHERE Username='${username}'"
           dataSource="${connection}" var="result">
</sql:query>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit user</title>
    </head>
    <body>
        <div>
            <form action="editUser.jsp">
                <%-- 
                    This loop will only execute once. I cannot figure out a better
                    way to access only the first row of the results.
                --%>
                <c:forEach begin="0" end="0" var="row" items="${result.rows}">
                    <label>First name: </label>
                    <input type="text" name="firstName" placeholder="${row.FirstName}"/>

                    <label>Last name: </label>
                    <input type="text" name="lastName" placeholder="${row.LastName}" />

                    <label>Username: </label>
                    <input type="text" name="username" placeholder="${username}"/>

                    <label>Password: </label>
                    <input type="text" name="password" placeholder="${row.Password}"/>
                </c:forEach>
                
                <label>Admin:</label>
                <input id="adminCheckbox" type="checkbox" name="role" value="admin"/>
                
                <label>Exam setter:</label>
                <input id="ESCheckbox" type="checkbox" name="role" value="examSetter"/>
                
                <label>Internal moderator:</label>
                <input id="IMCheckbox" type="checkbox" name="role" value="internalModerator"/>
                
                <label>Exam vetting committee:</label>
                <input id="EVCCheckbox" type="checkbox" name="role" value="examVettingCommittee"/>
                
                <label>External examiner</label>
                <input id="EECheckbox" type="checkbox" name="role" value="externalExaminer"/>
                
                <label>School office</label>
                <input id="SOCheckbox" type="checkbox" name="role" value="schoolOffice"/>
                    
                <%--
                    Must redo query since you can only iterate through results once
                --%>
                <sql:query sql="SELECT Password, FirstName, LastName, Role FROM Staff WHERE Username='${username}'"
                    dataSource="${connection}" var="roles">
                </sql:query>
                
                <c:forEach var="row" items="${roles.rows}">
                    
                    
                    <c:choose>
                        
                        <c:when test="${row.Role == 'admin'}">
                            <script>
                                check("adminCheckbox");
                            </script>
                        </c:when>

                    </c:choose>
                </c:forEach>
                
                           
                <sql:query sql="SELECT Password, FirstName, LastName, Role FROM Staff WHERE Username='${username}'"
                    dataSource="${connection}" var="roles">
                </sql:query>    
                            
                <c:forEach var="row" items="${roles.rows}">
                    
                    <c:choose>
                        <c:when test="${row.Role == 'examSetter'}">
                            <script>
                                check("ESCheckbox");
                            </script>
                        </c:when>

                    </c:choose>
                </c:forEach>
                    
                            
                 <sql:query sql="SELECT Password, FirstName, LastName, Role FROM Staff WHERE Username='${username}'"
                    dataSource="${connection}" var="roles">
                </sql:query>    
                            
                <c:forEach var="row" items="${roles.rows}">
                            
                    
                    <c:choose>
                        <c:when test="${row.Role == 'internalModerator'}">
                            <script>
                                check("IMCheckbox");
                            </script>
                        </c:when>

                    </c:choose>
                </c:forEach>

                            
                <sql:query sql="SELECT Password, FirstName, LastName, Role FROM Staff WHERE Username='${username}'"
                    dataSource="${connection}" var="roles">
                </sql:query>    
                   
                            
                <c:forEach var="row" items="${roles.rows}">
                    
                    <c:choose>
                        <c:when test="${row.Role == 'examVettingCommittee'}">
                            <script>
                                check("EVCCheckbox");
                            </script>
                        </c:when>

                    </c:choose>
                </c:forEach>

                            
                <sql:query sql="SELECT Password, FirstName, LastName, Role FROM Staff WHERE Username='${username}'"
                    dataSource="${connection}" var="roles">
                </sql:query>    
                            
                <c:forEach var="row" items="${roles.rows}">
                    
                    <c:choose>
                        <c:when test="${row.Role == 'externalExaminer'}">
                            <script>
                                check("EECheckbox");
                            </script>
                        </c:when>

                    </c:choose>
                </c:forEach>
                           
                            
                <sql:query sql="SELECT Password, FirstName, LastName, Role FROM Staff WHERE Username='${username}'"
                    dataSource="${connection}" var="roles">
                </sql:query>    
                            
                <c:forEach var="row" items="${roles.rows}">
                    
                    <c:choose>
                        <c:when test="${row.Role == 'schoolOffice'}">
                            <script>
                                check("SOCheckbox");
                            </script>
                        </c:when>

                    </c:choose>
                </c:forEach>
            
                
                
                <input type="submit" value="Update user" />
            </form>
        </div>
    </body>
</html>
