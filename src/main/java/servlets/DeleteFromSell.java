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
 * Servlet implementation class DeleteFromSell
 */
public class DeleteFromSell extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteFromSell() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String email = session.getAttribute("email").toString();
		PrintWriter out = response.getWriter();
		if(email == null) {
			response.sendRedirect("login.jsp");
			return;
		}
		String id = request.getParameter("id");
		DatabaseManager databaseManager = new DatabaseManager();
		try {
			databaseManager.createConnection();
			databaseManager.executeUpdate("delete from book where book_id='"+id+"'");
			databaseManager.closeConnection();
			out.println("<html>"
					+ "<body>"
					+ "<script>"
					+ "alert('Book Deleted Successfully');"
					+ "location.href='profile_sellbooks.jsp';"
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
