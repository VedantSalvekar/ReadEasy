package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import extras.DatabaseManager;

/**
 * Servlet implementation class EditPersonalInfo
 */
public class EditPersonalInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditPersonalInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		String email = session.getAttribute("email").toString();
		if(email==null || email.equals("")) {
			return;
		}
		
		DatabaseManager databaseManager = new DatabaseManager();
		try {
			databaseManager.createConnection();
			databaseManager.executeUpdate("update user set user_name='"+request.getParameter("user_name")+"',email='"+request.getParameter("email")+"',gender='"+request.getParameter("gender")+"',address='"+request.getParameter("address")+"',zipcode='"+request.getParameter("zipcode")+"',mobile_no='"+request.getParameter("mobile_no")+"' where email='"+email+"';");
			databaseManager.closeConnection();
			out.println("<html>"
					+ "<body>"
					+ "<script>"
					+ "alert('Profile Updated Successfully');"
					+ "location.href='profile.jsp';"
					+ "</script>"
					+ "</body>"
					+ "</html>");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e);
			e.printStackTrace();
		}
		
	}

}
