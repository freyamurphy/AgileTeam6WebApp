<%-- 
    Document   : listfile
    Created on : 2019年1月23日, 下午6:27:15
    Author     : ASUS
--%>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
    <head>
        <title>the display page of the downloaded files</title>
    </head>
    <body>
    <!-- 遍历Map集合 -->
        <c:forEach var="me" items="${fileNameMap}">
        <c:url value="/DownLoadServlet" var="downurl">
        <c:param name="filename" value="${me.key}"></c:param>
        </c:url>
        ${me.value}<a href="${downurl}">download</a>
        <br/>
        </c:forEach>
    </body>
</html>