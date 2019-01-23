<%-- 
    Document   : dbConnection
    Created on : 23 Jan 2019, 12:26:25
    Author     : Lucy Taylor
--%>

<%@ page import="java.sql.*"%>
<html>

<head>
<title>Database Connection</title>
</head>

<body>
<h1>Connection Status</h1>

<%
  try {
    java.sql.Connection connection;
    Class.forName("com.mysql.jdbc.Driver");
    connection = DriverManager.getConnection("jdbc:mysql://silva.computing.dundee.ac.uk:3306/18agileteam6db", "18agileteam6", "1243.at6.3421");
    out.println ("Successfully Connected To Silva.");
  }
  catch(SQLException e) {
    out.println("Exception: " +e.getMessage());
  }
%>

</body>
</html>