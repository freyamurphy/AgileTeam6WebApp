<%-- 
    Document   : dbConnection
    Created on : 23 Jan 2019, 12:26:25
    Author     : Lucy Taylor
--%>

<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<html>
<head>
<title>Database Connection</title>
</head>

<body>

<sql:setDataSource 
    var = "connection" driver = "com.mysql.jdbc.Driver"
    url = "jdbc:mysql://silva.computing.dundee.ac.uk:3306/18agileteam6db"
    user = "18agileteam6"  password = "1243.at6.3421"
/>

</body>
</html>