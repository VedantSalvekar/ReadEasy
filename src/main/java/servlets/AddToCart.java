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
 * Servlet implementation class AddToCart
 */
public class AddToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddToCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		DatabaseManager databaseManager = new DatabaseManager();
		String email="";
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		if(session!=null) {
			try {
		email = session.getAttribute("email").toString();
			}catch (Exception e) {
				// TODO: handle exception
				response.sendRedirect("login.jsp");
				return;
			}
		if(email == "" || email==null) {
			response.sendRedirect("login.jsp");
		}
		}else {
			response.sendRedirect("login.jsp");

		}
		try {
			databaseManager.createConnection();
			databaseManager.executeUpdate("insert into cart values('"+email+"','"+id+"','"+"1')");
			databaseManager.closeConnection();
			out.println("<html>"
					+ "<body>"
					+ "<script>"
					+ "alert('Book Added To Cart Successfully');"
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
