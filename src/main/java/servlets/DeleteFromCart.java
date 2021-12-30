package servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import extras.DatabaseManager;

/**
 * Servlet implementation class DeleteFromCart
 */
public class DeleteFromCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteFromCart() {
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
		if(email == "" || email == null)return;
		String book_id = request.getParameter("book_id");
		DatabaseManager databaseManager = new DatabaseManager();
		try {
			databaseManager.createConnection();
			databaseManager.executeUpdate("delete from cart where book_id='"+book_id+"' and email='"+email+"'");
			databaseManager.closeConnection();
			response.sendRedirect("cart.jsp");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
