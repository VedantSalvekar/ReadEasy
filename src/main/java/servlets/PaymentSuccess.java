package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Product;
import extras.DatabaseManager;

/**
 * Servlet implementation class PaymentSuccess
 */
public class PaymentSuccess extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentSuccess() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		PrintWriter out = response.getWriter();
	
		String status = request.getParameter("status");
		String firstname = request.getParameter("firstname");
		String amount = request.getParameter("amount");
		String txnid = request.getParameter("txnid");
		String productinfo = request.getParameter("productinfo");
		ArrayList<Product> product = new ArrayList<Product>();
		String mobile = request.getParameter("mobile");
		String mode = request.getParameter("mode");
		String email = request.getParameter("email");
		DatabaseManager databaseManager = new DatabaseManager();
		try {
			databaseManager.createConnection();
			databaseManager.executeUpdate("update orders set txnid='"+txnid+"' order by order_id desc limit 1");
			databaseManager.executeUpdate("delete from cart where email='"+email+"'");
			String[] product_ids = productinfo.split("&");
			System.out.println(productinfo);
			for(String book_id : product_ids) {
				ResultSet rs = databaseManager.executeQuery("select book_name,price from book where book_id='"+book_id+"'"); 
				System.out.println(book_id);
				databaseManager.executeUpdate("update book set quantity = quantity - 1 where book_id='"+book_id+"'");
				rs.next();
				Product p = new Product(rs.getString("book_name"),rs.getInt("price"));
				
				product.add(p);
			}
			out.println("<html>"
					+ "<body>"
					+ "<center><h3>Payment Success</h3>"
					+ "<h5> Name : "+firstname+"<br><b>Transaction Id : "+txnid+"</b><br>Mobile No : "+mobile+"<br> Email : "+email+"<br>"
					+ "<table border=''> "
					+ "<tr>"
					+ "<th>Product Name</th>"
					+ "<th>Product Price</th><tr>");
			
			for(int i=0;i<product.size();i++) {
				Product p = product.get(i);
				out.println("<tr><th>"+p.getName()+"</th><th>"+p.getPrice()+"</th></tr>");
			}
			out.println("<tr>"
					+ "<th>"
					+ "Total : "
					+ amount
					+ "</table>"
					+ "<a href='index.jsp'>Continue To Shopping</a>");

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
