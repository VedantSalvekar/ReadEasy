package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.User;
import extras.DBConnection;
import extras.MailChimp;

/**
 * Servlet implementation class SignUp
 */
public class SignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUp() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		User user = new User();
		user.setUser_name(request.getParameter("name"));
		user.setEmail(request.getParameter("email"));
		user.setPassword(request.getParameter("password"));
		user.setGender(request.getParameter("gender"));
		user.setAddress(request.getParameter("address"));
		user.setZipcode(request.getParameter("zipcode"));
		PrintWriter out = response.getWriter();
		String query="insert into user(user_name,email,password,gender,address,zipcode,mobile_no) values('"+user.getUser_name()+"','"+user.getEmail()+"','"+user.getPassword()+"','"+user.getGender()+"','"+user.getAddress()+"','"+user.getZipcode()+"','"+request.getParameter("mobile_no")+"')";
		DBConnection dbconnection = new DBConnection();
		try {
			dbconnection.create();
			dbconnection.executeUpdate(query);
			
			dbconnection.close();
			out.println("<html>"
					+ "<body>"
					+ "<script>"
					+ "alert('Sign Up Successfully');"
					+ "location.href='login.jsp';"
					+ "</script>"
					+ "</body>"
					+ "</html>");
			String url  = "https://us20.api.mailchimp.com/3.0/lists/e99f3b19e9/members/";
			String message = "{\"email_address\":\""+user.getEmail()+"\",\"status\":\"subscribed\",\"merge_fields\":{\"FNAME\":\""+user.getUser_name()+"\",\"LNAME\":\"\",\"ADDRESS\":\""+user.getAddress()+"\"}}";
			System.out.println(MailChimp.postToURL(url, message));
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e);
		}

	}

}
