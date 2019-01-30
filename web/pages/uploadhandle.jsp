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
    //String filePath = context.getInitParameter("file-upload");
    String filePath = request.getSession().getServletContext().getRealPath("");
    //String filePath = request.getContextPath(); 
    String Code = request.getParameter("code");
    String addfold = request.getParameter("folder");
    String fold = "WEB-INF/upload/";
    filePath = filePath + fold + addfold + "/";
    System.out.println("filePath => " + filePath);
    // Verify the content type
    java.io.File dir;
    dir = new java.io.File(filePath); 
    if (!dir.exists() && !dir.isDirectory()) {
    dir.mkdirs();
    System.out.println("create folder");
    }
    
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
                   %><br/><%
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
                      else if(Code.equals("ES"))   %><meta http-equiv="refresh" content="3;url=examSetterUploadExam.jsp"><%
                      %>

