<%-- 
    Document   : ViewAllFiles
    Created on : 2019年1月22日, 下午12:44:35
    Author     : YHSSSS
--%>

<%@page import="files.ListAllFiles"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View all exams</title>
    </head>
    <body>
        <h1>You can get access all exams here</h1>
        <%
            String path = "D:/CD";
            JspWriter mout = pageContext.getOut();;
            ListAllFiles laf = new ListAllFiles();
            laf.listFilesAndFolders(path,mout);
        %>

    </body>
</html>
