<%-- 
    Document   : addComment
    Created on : 23 Jan 2019, 16:19:46
    Author     : freyamurphy
--%>
<%
    String content = request.getParameter("commentBox");
    String user = request.getParameter("userRole");
    // need some cookies
    String username = "Bob";
    
    StaffHandler sh = new StaffHandler();
    Commenting comment;
    
    if(user.Equals("IM"))
    {
        comment = sh.getIM(username);
        
    }
    Comment userComment = comment.addComment(content);
    
%>
