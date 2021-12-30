<%@page import="java.sql.ResultSet"%>
<%@page import="extras.DatabaseManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ReadEasy : Profile</title>
<link
	href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round|Raleway"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!-- For Google Icons  -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
<!-- Navbar Styles Starter -->
<link rel="stylesheet" href="styles/navbar.css">




<style type="text/css">
.sidebar-profile{
height:100%;
width: 250px;
font-size: 12px;
position:fixed;
background: #fff;
box-shadow: 0px 0px 0px rgba(0, 0, 0, 0.3);
font-family: 'Varela Round', sans-serif;

}
.sidebar-profile h5{
margin-top: 30px;
padding: 20px;
}
.sidebar-profile li{
list-style: none;
padding: 10px;

}
.sidebar-profile li:hover {
	background:#33b5e5;
	color:#fff;
}
.active{
background: #0099CC;
color: #fff;
}


/* My Orders */

.my-orders{
width: 1000px;
padding-top:30px;
margin-left: 300px;
margin-top: 70px;

}
.my-orders-div{
background: #fff;
box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
margin:15px;


}
.title{
color: #fff;
background-color: #33b5e5;
padding: 15px;
margin-bottom: 20px;

}


</style>
</head>
<body>
<%
		boolean login = false;
		session = request.getSession(false);
		String email = "hello";
		if (session.getAttribute("email") != null) {
			email = session.getAttribute("email").toString();
			login = true;
		}else{
			response.sendRedirect("login.jsp");
		}
		
	%>
	
	
	<!-- Navigation Bar  -->
	<nav class="navbar navbar-expand-sm navbar-light fixed-top">
		<div class="navbar-header">
			<b><a class="navbar-brand" href="index.jsp">ReadEasy</a></b>
		</div>
		<ul class="nav navbar-nav">
			<li>
				<form action="search.jsp" class="form-inline form-search" method="get">
					<a> <input type="text" class="form-control form-rounded"
						placeholder="Search A Book" name="search" />
						<button type="submit" class="form-control search-btn">
							<i class="fa fa-search" aria-hidden="true"></i>
						</button>
					</a>
				</form>
			</li>
		</ul>
		<ul class="navbar-nav ml-auto">
			<%
				if (login) {
			%>
			<li class="navbar-right-item"><a href="cart.jsp" class="right-item"><i
					class="fas fa-cart-arrow-down"></i> Cart</a></li>
			<li class="navbar-right-item dropdown"><a href="#"
				class="right-item  dropdown-toggle" id="navbardrop"
				data-toggle="dropdown"><i class="fa fa-user"></i> <%=email.substring(0, 8)%>...</a>
				<div class="dropdown-menu">

					<a class="dropdown-item " href="profile.jsp">Profile</a> <a
						class="dropdown-item" href="sellbook.jsp">Sell a book</a> <a
						class="dropdown-item" href="LogOut">Log Out</a>
				</div></li>

			<%
				} else {
			%>
			<li class="navbar-right-item"><a href="signup.jsp"
				class="right-item"><i class="fas fa-user-plus"></i> Sign Up</a></li>
			<li class="navbar-right-item"><a href="login.jsp"
				class="right-item"><i class="fas fa-sign-in-alt"></i> Log In</a></li>

			<%
				}
			%>
		</ul>
	</nav>

	<!-- Sidebar Of Profile -->
	<div class="sidebar-profile">
	<h5><b>ReadEasy: My Account</b></h5>
	<ul>
	<li onclick="location.href='profile.jsp'"><i class="fa fa-user"></i> Personal Information</li>
	<li onclick="location.href='profile_sellbooks.jsp'"><i class="fa fa-book"></i> Sell Books</li>
	<li onclick="location.href='profile_myorders.jsp'" class="active"><i class="fa fa-shopping-cart"></i> My Orders</li>
	<li onclick="location.href='profile_resetpassword.jsp'"><i class="fa fa-key"></i> Reset Password</li>
	<li onclick="location.href='LogOut'"><i class="fa fa-sign-out"></i> Log Out</li>
	</ul>
	</div>
	
	
	
	
	<!-- My Orders -->
	<div class="my-orders">
	<div class="my-orders-div">
	<h4 class="title">My Orders</h4>
	<%
	DatabaseManager databaseManager = new DatabaseManager();
	databaseManager.createConnection();
	ResultSet rs =  databaseManager.executeQuery("select * from orders where email='"+email+"'");
	boolean hasNext = rs.next();
	if(hasNext){
	do{
	%>
	<div class="order row">
	<div class="col-sm-5">
	Items : 
	<br>
	<% String book_names = rs.getString("book_names");
	String rss[]=book_names.split("&");
	for(String str : rss){
	%><%=str %><br>	
	<% 
	}%>
	</div>
	<div class="col-sm-3">
Total Price : <br>
<%=rs.getInt("total_price")%> Rs.
	</div>
	<div class="col-sm-4">
	Status :<br>
	<%=rs.getString("status") %>
	</div>
	</div>
	<hr>
	<%}while(rs.next());}
	else{
	%>	<h3>No Orders </h3><%} %>
	</div>
	
	</div>
	
	
	
	
	
	
	<%databaseManager.closeConnection(); %>
	<!-- jQuery library -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

	<!-- Popper JS -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

	<!-- Latest compiled JavaScript -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	
</body>
</html>