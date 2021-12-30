package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import entities.Book;
import extras.DBConnection;

/**
 * Servlet implementation class SellBook
 */
public class SellBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SellBook() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		DBConnection dbConnection = new DBConnection();
		PrintWriter out = response.getWriter();
		Book b = new Book();
		try {
			dbConnection.create();
			b.setAuthor(request.getParameter("author"));
			b.setBook_id( UUID.randomUUID().toString().replaceAll("-", ""));
			b.setBook_name(request.getParameter("book_name"));
			b.setDescription(request.getParameter("description"));
			b.setEmail((String)request.getSession().getAttribute("email"));
			b.setImage(request.getParameter("image"));
			b.setPrice(Integer.parseInt(request.getParameter("price")));
			b.setQuantity(Integer.parseInt(request.getParameter("quantity")));
			b.setSell_type(request.getParameter("sell_type"));
			b.setType(request.getParameter("type"));
			dbConnection.addBook(b);
			dbConnection.close();
			out.println("<html>"
					+ "<body>"
					+ "<script>"
					+ "alert('Book Added Successfully');"
					+ "location.href='index.jsp';"
					+ "</script>"
					+ "</body>"
					+ "</html>");			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			
			e.printStackTrace();
		}
	}

}
