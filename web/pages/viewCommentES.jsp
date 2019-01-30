<%-- 
    Document   : viewCommentES
    Created on : 29 Jan 2019, 14:40:38
    Author     : freyamurphy
--%>

<%@include file="../dbConnection.jsp"%>
<% 
    String examNo = request.getParameter("examNo");
    // Make variable accessible to JSTL
    pageContext.setAttribute("examNo", examNo);
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>View Comments</title>

        <!-- Bootstrap Core CSS -->
        <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- MetisMenu CSS -->
        <link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="../dist/css/sb-admin-2.css" rel="stylesheet">

        <!-- Morris Charts CSS -->
        <link href="../vendor/morrisjs/morris.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>
        <%--
            Get comments from database
        --%>
        <sql:query sql="SELECT CommentID, Content, Author, TimeOfComment FROM Comments WHERE ExamNo = ${examNo}" 
                   var="commentResult" dataSource="${connection}">
        </sql:query>

        <%--
            Display each comment
        --%>
        <c:forEach var="comment" items="${commentResult.rows}">

            <%--
                Get author details from database
            --%>
            <sql:query sql="SELECT FirstName, LastName, Role FROM Staff WHERE ID = ${comment.Author}" 
                       var="staffResult" dataSource="${connection}">
            </sql:query>

            <c:forEach var="staff" items="${staffResult.rows}">
                <div>
                    <p>Comment</p>
                    <p class="content">
                        <c:out value="${comment.Content}"/>
                    </p>
                    <p class="author">
                        <c:out value="${staff.Firstname} ${staff.LastName}"/>
                    </p>
                    <p class="time">
                        <c:out value="${comment.TimeOfComment}"/>
                    </p>
                    <p>
                        <c:out value="${staff.role}" />
                    </p>
                </div>
                <form action="addReplyForm.jsp">
                    <input type="hidden" value="${comment.CommentID}" name="commentID"/>
                    <input type="submit" value="Reply" />
                </form>
                <br>
            </c:forEach>

            <%--
                Get replies to this comment from database
            --%>
            <sql:query sql="SELECT Content, Author, TimeOfReply FROM Replies WHERE CommentID = ${comment.CommentID}" 
                       var="replyResult" dataSource="${connection}">
            </sql:query>

            <%--
                Display each reply
            --%>
            <c:forEach var="reply" items="${replyResult.rows}">
                <sql:query sql="SELECT FirstName, LastName FROM Staff WHERE ID = ${reply.Author}" 
                           var="staffResult2" dataSource="${connection}">
                </sql:query>

                <c:forEach var="staff" items="${staffResult2.rows}">
                    <div>
                        <p>Reply</p>
                        <p class="content">
                            <c:out value="${reply.Content}"/>
                        </p>
                        <p class="author">
                            <c:out value="${staff.Firstname} ${staff.LastName}"/>
                        </p>
                        <p class="time">
                            <c:out value="${reply.TimeOfReply}"/>
                        </p>
                        <br>
                        <br>
                    </div>
                </c:forEach>

            </c:forEach>

        </c:forEach>
    </body>
</html>
