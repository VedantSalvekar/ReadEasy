package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import extras.DatabaseManager;

/**
 * Servlet implementation class ResetPassword
 */
public class ResetPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResetPassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String email = session.getAttribute("email").toString();
		if(email==null)return;
		PrintWriter out = response.getWriter();
		DatabaseManager databaseManager = new DatabaseManager();
		try {
			databaseManager.createConnection();
			ResultSet rs =databaseManager.executeQuery("select * from user where email='"+email+"'");
			rs.next();
			if(rs.getString("password").equals(request.getParameter("oldpass"))) {
				databaseManager.executeUpdate("update user set password='"+request.getParameter("newpass")+"' where email='"+email+"'");
				out.println("<html>"
						+ "<body>"
						+ "<script>"
						+ "alert('Password Changed Successfully');"
						+ "location.href='index.jsp';"
						+ "</script>"
						+ "</body>"
						+ "</html>");
			}else {
				out.println("<html>"
						+ "<body>"
						+ "<script>"
						+ "alert('Wrong Old Password');"
						+ "location.href='profile_resetpassword.jsp';"
						+ "</script>"
						+ "</body>"
						+ "</html>");
			}
			databaseManager.closeConnection();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
