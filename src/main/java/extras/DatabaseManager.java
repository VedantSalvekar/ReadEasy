package extras;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DatabaseManager {
	Connection con;
	 
	public void createConnection() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		 con = DriverManager.getConnection("jdbc:mysql://db4free.net:3306/readeasy", "readeasy","Karmalkar@123");
		    

	}
	public ResultSet executeQuery(String query) throws ClassNotFoundException, SQLException {
		
		 Statement stmt = con.createStatement();
	ResultSet rs;
     rs = stmt.executeQuery(query);
     
	
    return rs;
}
	public boolean executeUpdate(String query) throws ClassNotFoundException, SQLException {
		 Statement stmt = con.createStatement();
		
		return stmt.execute(query);
		
	}
	public void closeConnection() throws SQLException {
		con.close();
	}
}
