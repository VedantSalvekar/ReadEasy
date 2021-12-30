package servlets;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;

/**
 * Servlet implementation class BookImageUpload
 */
public class BookImageUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private boolean isMultipart;

	   private int maxFileSize = 5000 * 1024;
	   private int maxMemSize = 4 * 1024;
	   private File file ;
	   String id = "Test";
	   Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
			   "cloud_name", "denidrffq",
			   "api_key", "437955479352179",
			   "api_secret", "AdfmsUBJrtikJkq4y6JYrQ2B_PU"));
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookImageUpload() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		isMultipart = ServletFileUpload.isMultipartContent(request);
	      response.setContentType("text/html");
	      java.io.PrintWriter out = response.getWriter( );
	   
	      if( !isMultipart ) {
	    	  out.println("form is not multipart");
	         return;
	      }
	  
	      DiskFileItemFactory factory = new DiskFileItemFactory();
	   
	      // maximum size that will be stored in memory
	      factory.setSizeThreshold(maxMemSize);
	      
	      // Location to save data that is larger than maxMemSize.
	

	      // Create a new file upload handler
	      ServletFileUpload upload = new ServletFileUpload(factory);
	   
	      // maximum file size to be uploaded.
	      upload.setSizeMax( maxFileSize );

	      try { 
	         // Parse the request to get file items.
	         List fileItems = upload.parseRequest(request);
		
	         // Process the uploaded file items
	         Iterator i = fileItems.iterator();
	   
	         while ( i.hasNext () ) {
	            FileItem fi = (FileItem)i.next();
	            if ( !fi.isFormField () ) {
	               // Get the uploaded file parameters
	               String fieldName = fi.getFieldName();
	               String fileName = fi.getName();
	               String contentType = fi.getContentType();
	               boolean isInMemory = fi.isInMemory();
	               long sizeInBytes = fi.getSize();
	            
	               // Write the file
	                id = UUID.randomUUID().toString().replaceAll("-", "")+fileName.substring(fileName.lastIndexOf("."));
	                  file = new File(id);
	               }
	               fi.write( file ) ;
	               Map uploadResult = cloudinary.uploader().upload(file, ObjectUtils.emptyMap());
	               out.println(uploadResult.get("url").toString());
	            }
	         
	         } catch(Exception ex) {
	            System.out.println(ex);
	         }
	}

}
