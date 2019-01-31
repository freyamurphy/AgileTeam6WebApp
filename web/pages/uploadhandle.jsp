<%@include file="../dbConnection.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.fileupload.disk.*"%>
<%@ page import="org.apache.commons.fileupload.servlet.*"%>
<%@ page import="org.apache.commons.io.output.*"%>
<%
    File file;
    int maxFileSize = 5000 * 1024;
    int maxMemSize = 5000 * 1024;
    ServletContext context = pageContext.getServletContext();
    String filePath = request.getSession().getServletContext().getRealPath("");
    String Code = request.getParameter("code");
    String examNo = request.getParameter("ExamNo");

    pageContext.setAttribute("examNo", examNo);
%>
<sql:query dataSource="${connection}" var="result">
    SELECT ModuleCode FROM Exams WHERE ExamNo = ?
    <sql:param value = "${examNo}"/>
</sql:query>  
<c:forEach var="row" items="${result.rows}"> 
    <c:set var="addfold" value="${row.ModuleCode}" />
</c:forEach>
<%
    String folder = pageContext.getAttribute("addfold").toString();
    String fold = "../../web/pages/upload_files/";
    filePath = filePath + fold + folder + "/";
    System.out.println("filePath => " + filePath);
    java.io.File dir;
    dir = new java.io.File(filePath);
    if (!dir.exists() && !dir.isDirectory()) {
        dir.mkdirs();
        System.out.println("create folder");
    }//check whether the folder is exist, if no, create a new one.        
    String contentType = request.getContentType();
    if (contentType == null) {
        System.out.println("contentType => " + contentType);
        contentType = "";
    }
    if ((contentType.indexOf("multipart/form-data") >= 0)) {
        DiskFileItemFactory factory = new DiskFileItemFactory();
        // maximum size that will be stored in memory
        factory.setSizeThreshold(maxMemSize);
        // Location to save data that is larger than maxMemSize.
        factory.setRepository(new File("c:\\temp"));
        // Create a new file upload handler
        ServletFileUpload upload = new ServletFileUpload(factory);
        // maximum file size to be uploaded.
        upload.setSizeMax(maxFileSize);
        try {
            // Parse the request to get file items.
            List fileItems = upload.parseRequest(request);
            // Process the uploaded file items
            Iterator i = fileItems.iterator();
            out.println("<html>");
            out.println("<head>");
            out.println("<title>JSP File upload</title>");
            out.println("</head>");
            out.println("<body>");

            while (i.hasNext()) {
                FileItem fi = (FileItem) i.next();
                if (!fi.isFormField()) {
                    // Get the uploaded file parameters
                    String fieldName = fi.getFieldName();
                    String fileName = fi.getName();
                    boolean isInMemory = fi.isInMemory();
                    long sizeInBytes = fi.getSize();
                    // Write the file
                    if (fileName.lastIndexOf("\\") >= 0) {
                        file = new File(filePath + fileName.substring(fileName.lastIndexOf("\\")));
                    } else {
                        file = new File(filePath + fileName.substring(fileName.lastIndexOf("\\") + 1));
                    }
                    fi.write(file);
                    out.println("Uploaded successfully!");
                    String Path = folder + "/" + fileName;
                    out.println(Path);
                    pageContext.setAttribute("Path", Path);
%><br/>

<sql:update dataSource="${connection}" var="result">
    UPDATE Exams SET FilePath = ? WHERE ExamNo = ?
    <sql:param value = "${Path}"/>
    <sql:param value = "${examNo}"/>
</sql:update>   
<%
                    out.println("Uploaded Filename: " + filePath + fileName + "<br>");
                }
            }
            out.println("</body>");
            out.println("</html>");
        } catch (Exception ex) {
            System.out.println(ex);
        }
    } else {
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Servlet upload</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<p>No file uploaded</p>");
        out.println("</body>");
        out.println("</html>");
    }
%>
   <% if(Code.equals("IM"))  %><meta http-equiv="refresh" content="3;url=internalMouderatorUploadExam.jsp"><%
           else if(Code.equals("EVC"))  %><meta http-equiv="refresh" content="3;url=examVCUploadExam.jsp"><%
                   else if(Code.equals("ES"))   %><meta http-equiv="refresh" content="3;url=examSetterUploadExam.jsp">
