package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import extras.DatabaseManager;

/**
 * Servlet implementation class WriteReview
 */
public class WriteReview extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public WriteReview() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		DatabaseManager databaseManager = new DatabaseManager();
		PrintWriter out = response.getWriter();
		String email = request.getSession().getAttribute("email").toString();
		String book_name = request.getParameter("book_name");
		String review = request.getParameter("review");
		String book_id = request.getParameter("book_id");
		if (email == "") {
			response.sendRedirect("login.jsp");
		} else {
			try {
				databaseManager.createConnection();
				databaseManager.executeUpdate(
						"insert into review values('" + email + "','" + book_name + "','" + review + "')");
				databaseManager.closeConnection();
				out.println("<html>" + "<body>" + "<script>" + "alert('Review Added Successfully');"
						+ "location.href='product.jsp?id=" + book_id + "';" + "</script>" + "</body>" + "</html>");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
