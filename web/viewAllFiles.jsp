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
          
            String code = "AC31012";
            String path = "Z:/uploaded_files/"+code;//This is the path of the folder you want to get access
          
            JspWriter mout = pageContext.getOut();//get the print from java
            ListAllFiles laf = new ListAllFiles();
            laf.listFilesAndFolders(path,mout);//put the path in the java to find folders and files
        %>

    </body>
</html>
