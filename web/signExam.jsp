<%-- 
    Document   : signExam
    Created on : 24.01.2019, 13:18:12
    Author     : Lucy Taylor
--%>

<%@page import="staff.*"%>
<%@include file="dbConnection.jsp"%>

<%
    
    String role = "internalMod";
    String username = "Bobby";
    String imSig;
    String evSig;
    String emSig;
    int examID;
    
    //Fetch Input From HTML Form
    //int examID = Integer.parseInt(request.getParameter("examID"));
    
    //Use StaffCookie To Detect Logged In User And Role
    //As Cookie Isn't Implemented, Temporarily Just Use Hard Coded Internal Moderator    
    pageContext.setAttribute("username","Bobb");
    pageContext.setAttribute("role", "externalMod");
    
    //Fill Columns Based On Role
    if (role.equals("internalMod"))
    {
        pageContext.setAttribute("imSig", username);
        pageContext.setAttribute("evSig", null);
        pageContext.setAttribute("emSig", null);
    }
    else if (role.equals("examVettingCom"))
    {
        pageContext.setAttribute("evSig", null);
        pageContext.setAttribute("evSig", username);
        pageContext.setAttribute("emSig", null);
    }
    else if (role.equals("externalMod"))
    {
        pageContext.setAttribute("evSig", null);
        pageContext.setAttribute("evSig", null);
        pageContext.setAttribute("emSig", username);
    }
    
    pageContext.setAttribute("examID", 1);
    
%>

<!--
    Connecting to SQL database to store info on new exam
-->
<html>
    <head>
        <title>Sign Exam</title>
    </head>
    <body>
        
        <c:if test="${imSig != null}">
            <sql:update sql="INSERT INTO Signatures (InternalModeratorSignatures, ExamVettingCommitteeSignatures, ExternalModeratorSignatures, ExamID) VALUES (?,?,?,?) ON DUPLICATE KEY UPDATE InternalModeratorSignatures=values(InternalModeratorSignatures)" dataSource = "${connection}" var = "result">
                <sql:param value="${imSig}"/>
                <sql:param value="${evSig}"/>
                <sql:param value="${emSig}"/>
                <sql:param value="${examID}"/>
            </sql:update>
        </c:if>
        <c:if test="${evSig != null}">
            <sql:update sql="INSERT INTO Signatures (InternalModeratorSignatures, ExamVettingCommitteeSignatures, ExternalModeratorSignatures, ExamID) VALUES (?,?,?,?) ON DUPLICATE KEY UPDATE ExamVettingCommitteeSignatures=values(ExamVettingCommitteeSignatures)" dataSource = "${connection}" var = "result">
                <sql:param value="${imSig}"/>
                <sql:param value="${evSig}"/>
                <sql:param value="${emSig}"/>
                <sql:param value="${examID}"/>
            </sql:update>
        </c:if>
        <c:if test="${emSig != null}">
            <sql:update sql="INSERT INTO Signatures (InternalModeratorSignatures, ExamVettingCommitteeSignatures, ExternalModeratorSignatures, ExamID) VALUES (?,?,?,?) ON DUPLICATE KEY UPDATE ExternalModeratorSignatures=values(ExternalModeratorSignatures)" dataSource = "${connection}" var = "result">
                <sql:param value="${imSig}"/>
                <sql:param value="${evSig}"/>
                <sql:param value="${emSig}"/>
                <sql:param value="${examID}"/>
            </sql:update>
        </c:if>
        
    </body>
</html>
    