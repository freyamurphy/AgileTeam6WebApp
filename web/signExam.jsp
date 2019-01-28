<%-- 
    Document   : signExam
    Created on : 24.01.2019, 13:18:12
    Author     : Lucy Taylor
--%>

<%@page import="staff.*"%>
<%@include file="dbConnection.jsp"%>

<%
    String esSig;
    String imSig;
    String evSig;
    String emSig;
    String username = "";
    String role = "";
    int examID;
    
    //Fetch username and role values from cookies
    Cookie cookie = null;
    Cookie[] cookies = null;
    //Get cookies array
    cookies = request.getCookies();
    //check if cookies exist
    if( cookies != null ) {
        //
        for (int i = 0; i < cookies.length; i++) {
            cookie = cookies[i];
            //check if cookie is the username cookie
            if (cookie.getName().equals("username")) {
                //Store username cookie's value as JSP variable
                username = cookie.getValue();
            }
            else if (cookie.getName().equals("role")) {
                //Store role cookie's value as JSP variable
                role = cookie.getValue();
            }
                       
        }
        
    }
    else {
        //browser didn't store cookies
        out.println("<h2>No cookies found</h2>");
        }    
    
    //Fetch Input From HTML Form (currently no exist) 
    //int examID = Integer.parseInt(request.getParameter("examID"));
    
    
    /*Convert JSP variables to JSTL attributes
     *Not needed at the moment since username and role variable not used outside of JSP tags
    */
    //pageContext.setAttribute("username",username);
    //pageContext.setAttribute("role",role);
    
    
    //This is hardcoded in atm, needs to be changed later
    pageContext.setAttribute("examID", 1);
    
    
    
    //Fill Columns Based On Role
    if (role.equals("internalMod"))
    {
        pageContext.setAttribute("esSig", null);
        pageContext.setAttribute("imSig", username);
        pageContext.setAttribute("evSig", null);
        pageContext.setAttribute("emSig", null);
    }
    else if (role.equals("examVettingCom"))
    {
        pageContext.setAttribute("esSig", null);
        pageContext.setAttribute("imSig", null);
        pageContext.setAttribute("evSig", username);
        pageContext.setAttribute("emSig", null);
    }
    else if (role.equals("externalMod"))
    {
        pageContext.setAttribute("esSig", null);
        pageContext.setAttribute("imSig", null);
        pageContext.setAttribute("evSig", null);
        pageContext.setAttribute("emSig", username);
    }
    else if (role.equals("examSetter"))
    {
        pageContext.setAttribute("esSig", username);
        pageContext.setAttribute("imSig", null);
        pageContext.setAttribute("evSig", null);
        pageContext.setAttribute("emSig", null);
    }
    
    
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
            <sql:update sql="INSERT INTO Signatures (ExamSetterSignatures, InternalModeratorSignatures, ExamVettingCommitteeSignatures, ExternalModeratorSignatures, ExamID) VALUES (?,?,?,?,?) ON DUPLICATE KEY UPDATE InternalModeratorSignatures=values(InternalModeratorSignatures)" dataSource = "${connection}" var = "result">
                <sql:param value="${esSig}"/>
                <sql:param value="${imSig}"/>
                <sql:param value="${evSig}"/>
                <sql:param value="${emSig}"/>
                <sql:param value="${examID}"/>
            </sql:update>
        </c:if>
        <c:if test="${evSig != null}">
            <sql:update sql="INSERT INTO Signatures (ExamSetterSignatures, InternalModeratorSignatures, ExamVettingCommitteeSignatures, ExternalModeratorSignatures, ExamID) VALUES (?,?,?,?,?) ON DUPLICATE KEY UPDATE ExamVettingCommitteeSignatures=values(ExamVettingCommitteeSignatures)" dataSource = "${connection}" var = "result">
                <sql:param value="${esSig}"/>
                <sql:param value="${imSig}"/>
                <sql:param value="${evSig}"/>
                <sql:param value="${emSig}"/>
                <sql:param value="${examID}"/>
            </sql:update>
        </c:if>
        <c:if test="${emSig != null}">
            <sql:update sql="INSERT INTO Signatures (ExamSetterSignatures, InternalModeratorSignatures, ExamVettingCommitteeSignatures, ExternalModeratorSignatures, ExamID) VALUES (?,?,?,?,?) ON DUPLICATE KEY UPDATE ExternalModeratorSignatures=values(ExternalModeratorSignatures)" dataSource = "${connection}" var = "result">
                <sql:param value="${esSig}"/>
                <sql:param value="${imSig}"/>
                <sql:param value="${evSig}"/>
                <sql:param value="${emSig}"/>
                <sql:param value="${examID}"/>
            </sql:update>
        </c:if>
        <c:if test="${esSig != null}">
            <sql:update sql="INSERT INTO Signatures (ExamSetterSignatures, InternalModeratorSignatures, ExamVettingCommitteeSignatures, ExternalModeratorSignatures, ExamID) VALUES (?,?,?,?,?) ON DUPLICATE KEY UPDATE ExamSetterSignatures=values(ExamSetterSignatures)" dataSource = "${connection}" var = "result">
                <sql:param value="${esSig}"/>
                <sql:param value="${imSig}"/>
                <sql:param value="${evSig}"/>
                <sql:param value="${emSig}"/>
                <sql:param value="${examID}"/>
            </sql:update>
        </c:if>
        
    </body>
</html>
    