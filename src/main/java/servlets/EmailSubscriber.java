package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import extras.DatabaseManager;
import extras.MailChimp;

/**
 * Servlet implementation class EmailSubscriber
 */
public class EmailSubscriber extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmailSubscriber() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
			
		PrintWriter out = response.getWriter();
		String email = request.getParameter("email");
		DatabaseManager databaseManager = new DatabaseManager();
		try {
			databaseManager.createConnection();
			ResultSet rs =databaseManager.executeQuery("select * from user where email='"+email+"'");
		
		if(rs.next()) {
			out.println("<html>"
					+ "<body>"
					+ "<script>"
					+ "alert('Subscribed Successfully');"
					+ "location.href='index.jsp';"
					+ "</script>"
					+ "</body>"
					+ "</html>");
			databaseManager.closeConnection();
			return;
		}
		databaseManager.closeConnection();
		String url  = "https://us20.api.mailchimp.com/3.0/lists/e99f3b19e9/members/";
		String message = "{\"email_address\":\""+email+"\",\"status\":\"subscribed\",\"merge_fields\":{\"FNAME\":\""+""+"\",\"LNAME\":\"\",\"ADDRESS\":\""+""+"\"}}";
		System.out.println(MailChimp.postToURL(url, message));
		out.println("<html>"
				+ "<body>"
				+ "<script>"
				+ "alert('Subscribed Successfully');"
				+ "location.href='index.jsp';"
				+ "</script>"
				+ "</body>"
				+ "</html>");
		
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
