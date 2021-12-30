<%@page import="java.sql.ResultSet"%>
<%@page import="extras.DatabaseManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ReadEasy</title>
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
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">
<!-- Navbar Styles Starter -->
<link rel="stylesheet" href="styles/navbar.css">
 <!-- Search bar validation -->
  <script type="text/javascript">
  function valsearch(){
	 var x = document.forms.searchform.search.value;
	 if(x=="" || x==null){
		 alert("Cannot Seach Empty");
		 return false;
	 }
	 return true;
  }
  
  </script>

</head>
<style type="text/css">
 
 /* Style For Product Page */
 
.sticky{
margin-top: 100px;
background: #ffffff;
font-family: 'Varela Round', sans-serif;
font-weight: bold;
}

#sh
{
font-family: 'Varela Round', sans-serif;
color: black;
font-weight: bold;
margin-left: 50px;
}
#h{
font-family: 'Varela Round', sans-serif;
color: grey;
}

#des { 
font-family: 'Varela Round', sans-serif;
color: grey;
margin-left: 50px;
}

.pro{
background: #ffffff;
font-family: 'Varela Round', sans-serif;

}

</style>
<body>

<%
		boolean login = false;
		session = request.getSession(false);
		String email = "";
		if (session.getAttribute("email") != null) {
			email = session.getAttribute("email").toString();
			login = true;
		}
	%>
	<!-- Navigation Bar  -->
	<nav class="navbar navbar-expand-sm navbar-light fixed-top">
		<div class="navbar-header">
			<b><a class="navbar-brand" href="index.jsp">ReadEasy</a></b>
		</div>
		<ul class="nav navbar-nav">
			<li>
				<form action="search.jsp" class="form-inline form-search" method="get" name="searchform" onsubmit="valsearch()">
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




<%
String book_id = request.getParameter("id");
DatabaseManager databaseManager = new DatabaseManager();
databaseManager.createConnection();
ResultSet rs=databaseManager.executeQuery("select * from book where book_id='"+book_id+"'");
rs.next();

%>

 <!-- Sticky content -->
 <hr>
<div class="sticky">
    <img class="img-fluid " src="<%=rs.getString("image")%>"  alt=" " height="70px" width="70px" style="padding: 0 10px; float: left; ">
    <br><h7 id="sh"><%=rs.getString("book_name")%></h7>
    <h7 id="sh"><%=rs.getInt("price") %>/-</h7>
  </div>
    <!-- Sticky content over -->


  <hr>
    <!-- Product Image + SIde Descripton -->
    <div class="container product row">

  
            <div class="col-sm-5" style="margin-top: 100px;">
                <img class="img-fluid " src="<%=rs.getString("image")%>" alt=" " height="450px" width="450px" style="padding: 0 100px; float: left; border-radius:20px;">
            </div>
            <div class="pro col-sm-7"  style="margin-top: 100px;">
                <h7 id="h"> Name : <%=rs.getString("book_name")%> <br> Price : <%=rs.getInt("price") %>/- </h7>
               <br> <h7 id="h">Project Description</h7>
               <br> <p id="h"><%=rs.getString("description")%> </p>
              <h7 id="h">Publisher: <%=rs.getString("author") %></h7>
                <br> <h7 id="h">Sell Type: <%=rs.getString("sell_type") %></h7>
                <%
                ResultSet rs2 = databaseManager.executeQuery("select user_name from user where email='"+rs.getString("email")+"'");
                rs2.next();
                 %>
              <br>  <h7 id="h"> Seller : <%=rs2.getString("user_name") %></h7>
               <%if(rs.getInt("quantity")>0) {%>
              <br>  <h7 id="h" style="color:green;">In Stock</h7>
              <br>
                <% 
                if(email==null || email.equals("")){
                out.println("<a href=\"login.jsp\" class=\"btn btn-dark\">Add To Cart</a>");
                }else{%>
		<a href="AddToCart?id=<%=rs.getString("book_id") %>" class="btn btn-dark">Add To Cart</a>	
		<%}}else{ %><br>
		<h7 id="h" style="color:red;">Not In Stock</h7>
		<%} %>	
		<br>
	
		
               </div>
    </div>
    <!-- Product Image + SIde Descripton over -->
    
    <br>
<br>
<br>
<br>
<hr>
<h7 id="h" style="margin-left: 50px; color: black; font-weight: bold;"> Book Details </h7>
<br>
<p id="des"> Name : Advance Java <br> Price : 150/- <br> Paperback: 312 pages<br> Publisher: Amazing Reads; 2011 edition (1 December 2015)<br> Language: English<br> ISBN-10: 8192910962<br> ISBN-13: 978-8192910963<br> Product Dimensions: 20 x 13 x 1.5 cm<br></p>
<hr>
<br>
<h7 id="h" style="margin-left: 50px; color: black; font-weight: bold;"> More About The Author </h7>
<p id="des">
Steven Paul Jobs (/dʒɒbz/; February 24, 1955 – October 5, 2011) was an American business magnate, industrial designer, investor, and media proprietor. He was the chairman, chief executive officer (CEO), and co-founder of Apple Inc., the chairman and majority shareholder of Pixar, a member of The Walt Disney Company's board of directors following its acquisition of Pixar, and the founder, chairman, and CEO of NeXT. Jobs is widely recognized as a pioneer of the personal computer revolution of the 1970s and 1980s, along with Apple co-founder Steve Wozniak.

Jobs was born in San Francisco, California, and put up for adoption. He was raised in the San Francisco Bay Area. He attended Reed College in 1972 before dropping out that same year, and traveled through India in 1974 seeking enlightenment and studying Zen Buddhism. His declassified FBI report states that he used marijuana and LSD while he was in college, and once told a reporter that taking LSD was "one of the two or three most important things" he had done in his life.
</p>
<br>
<hr>
<!-- Review -->

<h7 id="sh"> Review This Book</h7>
<br><form action="WriteReview" method="post">
<input type="hidden" value="<%=rs.getString("book_name")%>" name="book_name">
<input type="hidden" value="<%=book_id%>" name="book_id">
<p id="sh"><textarea rows="5" cols="50" placeholder="Type Something" name="review"></textarea>
<br><input type="submit" /></p>
</form>
<hr>
<h7 id="sh" >Customer Reviews </h7>
<hr><br>
<%ResultSet rs3 = databaseManager.executeQuery("select * from review where book_name='"+rs.getString("book_name")+"'");%>
<%while(rs3.next()){ %>
<p id="sh"><%=rs3.getString("email") %></p>
<p id="des"><%=rs3.getString("review") %></p>
<hr style="width:70%;">
<%} %>





<%databaseManager.closeConnection(); %>
<hr width="100%">
 <%@ include file="footer.jsp" %>
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