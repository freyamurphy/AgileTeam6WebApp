<%-- 
    Document   : sqlTest
    Created on : 23 Jan 2019, 14:44:09
    Author     : Lucy
--%>

<%@ include file="dbConnection.jsp" %>

<html>
    <head>
        <title>SQL Test</title>
    </head>
    <body>
        <sql:update dataSource = "${connection}" var = "result">
         INSERT INTO Test VALUES (3,'Cerys', 19);
        </sql:update>
    </body>
</html>
