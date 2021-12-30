<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSetMetaData"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="extras.DatabaseManager"%>
<html>
<head>
<meta name="google-site-verification" content="PU8BefjKmUkDjqa500FMdkhs70deFmmJX7UYIuTnbkw" />
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>
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
<style type="text/css">
#slider {
	margin-top: 73px;
}
#h{
font-family: 'Varela Round', sans-serif;
font-weight: bold;

}
 
 #des{
 font-family: 'Varela Round', sans-serif;
 color: grey;
 
 }
 

</style>



<!-- Style For Product Slider -->
<style type="text/css">

.carousel1 {
	margin: 50px auto;
	padding: 0 70px;
}
.carousel1 .item1 {
	min-height: 330px;
    text-align: center;
	overflow: hidden;
}
.carousel1 .item1 .img-box {
	height: 160px;
	width: 100%;
	position: relative;
}
.carousel1 .item1 img {	
	max-width: 100%;
	max-height: 100%;
	display: inline-block;
	position: absolute;
	bottom: 0;
	margin: 0 auto;
	left: 0;
	right: 0;
}
.thumb-content h4{
font-size: 15px;
}
.carousel1 .carousel-control1 {
	height: 100px;
    width: 40px;
    background: none;
    margin: auto 0;
    background: rgba(0, 0, 0, 0.2);
}

.carousel1 .carousel-indicators1 {
	bottom: -50px;
}
.carousel-indicators1 li, .carousel-indicators1 li.active {
	width: 25px;
	height: 10px;
	margin: 4px;
	border-radius: 100%;
	border-color: transparent;
}
.carousel-indicators1 li {	
	background: rgba(0, 0, 0, 0.2);
}
.carousel-indicators1 li.active {	
	background: rgba(0, 0, 0, 0.6);
}
.product{
margin:3px;
padding:3px;

box-shadow: 0 0 4px rgba(0, 0, 0, 0.4);

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
		}
	%>
	<!-- Navigation Bar  -->
	<nav class="navbar navbar-expand-sm navbar-light fixed-top">
		<div class="navbar-header">
			<b><a class="navbar-brand" href="#">ReadEasy</a></b>
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

	<!-- Slider Of Images -->
	<div id="slider" class="carousel slide" data-ride="carousel">

		<!-- Indicators -->
		<ul class="carousel-indicators">
			<li data-target="#slider" data-slide-to="0" class="active"></li>
			<li data-target="#slider" data-slide-to="1"></li>
			<li data-target="#slider" data-slide-to="2"></li>
			<li data-target="#slider" data-slide-to="2"></li>
		</ul>

		<!-- The slideshow -->
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="images/slide1.jpg" alt="Los Angeles" width="100%"
					height="50%">
			</div>
			<div class="carousel-item">
				<img src="images/slide3.jpg" alt="Chicago" width="100%" height="50%">
			</div>
			<div class="carousel-item">
				<img src="images/slide2.png" alt="New York" width="100%"
					height="50%">
			</div>
			<div class="carousel-item">
				<img src="images/slide4.jpg" alt="New York" width="100%"
					height="50%">
			</div>
		</div>

		<!-- Left and right controls -->
		<a class="carousel-control-prev" href="#slider" data-slide="prev">
			<span class="carousel-control-prev-icon"></span>
		</a> <a class="carousel-control-next" href="#slider" data-slide="next">
			<span class="carousel-control-next-icon"></span>
		</a>

	</div>
<br>
<h7 id="h"><center><a href="">ReadEasy Pay</a> &emsp; <a href="">ReadEasy Basics &emsp; <a href="">New Releases and Pre-orders</a>  &emsp; <a href="">Advance Search</a>  &emsp; <a href="">Best Sellers</a>  &emsp; <a href="">Browse Generes</a> &emsp; <a href="">All Indian Langugaes</a></center></h7>
<hr>
		<center><img alt="" src="images/ReadLead.jpg" height="300px" width="500px"></center>
	<br>
<br>
<h1 id="h"><center>Read To Lead </center></h1>
<center><p id="des">In economics, a service is a transaction in which no physical goods are <br>transferred from the seller to the buyer. </p></center><br>
<center><a href="signup.jsp" type="submit" class="btn btn-primary"  name="Subscribe" style="border-radius: 5px;">Sign Up</a></center>
<br>
<br>
<br>
<h1 id="h"><center>Explore The New Dimensions</center></h1>
<center><p id="des">In economics, a service is a transaction in which no physical goods are <br>transferred from the seller to the buyer.  </p></center>
<br>
<br>
<center><img alt="" src="images/lord.png" height="300px" width="100%"></center>
		
<br>
<br>
<br>
<a href="category.jsp?category=6"><h1 id="h" align="right" style="margin-right: 5%;">Crime Mystery and Thriller</h1></a>
<hr width="75%">
<p align="right" class="sm"  id="des" style=" margin-right: 5%;">In economics, a service is a transaction in which no p
										hysical goods are transferred from the seller to the buyer. 
										<br>The benefits of such a service are held to be demonstrated by
										 the buyer's willingness to make the exchange. <br>Public services 
										 are those that society (nation state, fiscal union, region) as 
										 a whole pays for.</p>

		
		
		
		<!-- Product Slider -->
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div id="myCarousel1" class="carousel carousel1 slide" data-ride="carousel" data-interval="0">

			<!-- Wrapper for carousel items -->
			<div class="carousel-inner">
			<%
			Connection con;
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			ResultSet rs;
			 con = DriverManager.getConnection("jdbc:mysql://db4free.net:3306/readeasy", "readeasy","Karmalkar@123");
		    Statement stmt = con.createStatement();
			ResultSet rs1 = stmt.executeQuery("select * from book where type='Crime, Thriller & Mystery' limit 12");
			int x1 = 0;
			rs1.last();
			int size1 = rs1.getRow();
			
			rs1.beforeFirst();
			boolean b1 = true;
			boolean t1 = rs1.next();
			if(t1){
			do{
				
			
			%>
			
				<%
				if(x1==0 && b1==true){	
					b1=false;
				
				%>
				<div class="item item1 carousel-item active">
					<div class="row">
					<%}else if(x1==0){ %>
				<div class="item item1 carousel-item">
					<div class="row">
					<%} %>
					
						<div class="col-sm-3">
							<div class="thumb-wrapper product">
								<div class="img-box">
									<a href="product.jsp?id=<%=rs1.getString("book_id") %>"><img src="<%=rs1.getString("image")%>" class="img-responsive img-fluid" alt=""></a>
								</div>
								<div class="thumb-content">
									<a href="product.jsp?id=<%=rs1.getString("book_id") %>"><h4><%=rs1.getString("book_name") %></h4></a>
									<p class="item-price"><span><%=rs1.getInt("price") %> Rs.</span></p>
									<a href="AddToCart?id=<%=rs1.getString("book_id") %>" class="btn btn-primary">Add to Cart</a>
								</div>						
							</div>
						</div>
						
					<% 
					
					size1--;
					
					if(x1==3){x1=0;
					out.println("</div></div>");
					}else if(size1==0){out.println("</div></div>");}
					else{x1++;}
					
					
					%>
					
					
					<%

			}while(rs1.next());
			}else{
				out.println("<h4>Result Not Found </h4>");
			}
		
					%>	
			</div>
			<!-- Carousel controls -->
			<a class="carousel-control carousel-control1 left carousel-control-prev" href="#myCarousel1" data-slide="prev">
				<i class="fa fa-angle-left"></i>
			</a>
			<a class="carousel-control carousel-control1 right carousel-control-next" href="#myCarousel1" data-slide="next">
				<i class="fa fa-angle-right"></i>
			</a>
		</div>
		</div>
	</div>
</div>

	<center><img alt="" src="images/shiva.jpg" height="350px" width="100%"></center>	
		
    
<br>
<br>
<br>
<a href="category.jsp?category=8"><h1 id="h" style=" margin-left: 5%;">Business and Economics</h1></a>
<hr width="75%">
<p class="sm"  id="des" style=" margin-left: 5%;">In economics, a service is a transaction in which no p
										hysical goods are transferred from the seller to the buyer. 
										<br>The benefits of such a service are held to be demonstrated by
										 the buyer's willingness to make the exchange. <br>Public services 
										 are those that society (nation state, fiscal union, region) as 
										 a whole pays for.</p>



		<!-- Product Slider -->
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div id="myCarousel2" class="carousel carousel1 slide" data-ride="carousel" data-interval="0">

			<!-- Wrapper for carousel items -->
			<div class="carousel-inner">
			<%
			ResultSet rs2 = stmt.executeQuery("select * from book where type='Business & Economics' limit 12");
			int x2 = 0;
			rs2.last();
			int size2 = rs2.getRow();
			rs2.beforeFirst();
			boolean b2 = true;
			boolean t2 = rs2.next();
			if(t2){
			do{
				
			
			%>
			
				<%
				if(x2==0 && b2==true){	
					b2=false;
				
				%>
				<div class="item item1 carousel-item active">
					<div class="row">
					<%}else if(x2==0){ %>
				<div class="item item1 carousel-item">
					<div class="row">
					<%} %>
					
						<div class="col-sm-3">
							<div class="thumb-wrapper product">
								<div class="img-box">
									<a href="product.jsp?id=<%=rs2.getString("book_id") %>"><img src="<%=rs2.getString("image")%>" class="img-responsive img-fluid" alt=""></a>
								</div>
								<div class="thumb-content">
									<a href="product.jsp?id=<%=rs2.getString("book_id") %>"><h4><%=rs2.getString("book_name") %></h4></a>
									<p class="item-price"><span><%=rs2.getInt("price") %> Rs.</span></p>
									<a href="AddToCart?id=<%=rs2.getString("book_id") %>" class="btn btn-primary">Add to Cart</a>
								</div>						
							</div>
						</div>
						
					<% 
					
					size2--;
					
					if(x2==3){x2=0;
					out.println("</div></div>");
					}else if(size2==0){out.println("</div></div>");}
					else{x2++;}
					
					
					%>
					
					
					<%

			}while(rs2.next());
			}else{
				out.println("<h4>Result Not Found </h4>");
			}
		
					%>	
			</div>
			<!-- Carousel controls -->
			<a class="carousel-control carousel-control1 left carousel-control-prev" href="#myCarousel2" data-slide="prev">
				<i class="fa fa-angle-left"></i>
			</a>
			<a class="carousel-control carousel-control1 right carousel-control-next" href="#myCarousel2" data-slide="next">
				<i class="fa fa-angle-right"></i>
			</a>
		</div>
		</div>
	</div>
</div>


<center><img alt="" src="images/hobbit.jpg" height="350px" width="100%"></center>

	
										 
<br>
<br>
<br>
<a href="category.jsp?category=9"><h1 id="h" align="right" style="margin-right: 5%;">Science and Technology</h1></a>
<hr width="75%">
<p align="right" class="sm"  id="des" style=" margin-right: 5%;">In economics, a service is a transaction in which no p
										hysical goods are transferred from the seller to the buyer. 
										<br>The benefits of such a service are held to be demonstrated by
										 the buyer's willingness to make the exchange. <br>Public services 
										 are those that society (nation state, fiscal union, region) as 
										 a whole pays for.</p>
										 

		<!-- Product Slider -->
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div id="myCarousel3" class="carousel carousel1 slide" data-ride="carousel" data-interval="0">

			<!-- Wrapper for carousel items -->
			<div class="carousel-inner">
			<%

			ResultSet rs3 = stmt.executeQuery("select * from book where type='Sciences, Technology & Medicine' limit 12");
			int x3 = 0;
			rs3.last();
			int size3 = rs3.getRow();
			rs3.beforeFirst();
			boolean b3 = true;
			boolean t3 = rs3.next();
			if(t3){
			do{
				
			
			%>
			
				<%
				if(x3==0 && b3==true){	
					b3=false;
				
				%>
				<div class="item item1 carousel-item active">
					<div class="row">
					<%}else if(x3==0){ %>
				<div class="item item1 carousel-item">
					<div class="row">
					<%} %>
					
						<div class="col-sm-3">
							<div class="thumb-wrapper product">
		 						<div class="img-box">
									<a href="product.jsp?id=<%=rs3.getString("book_id") %>"><img src="<%=rs3.getString("image")%>" class="img-responsive img-fluid" alt=""></a>
								</div>
								<div class="thumb-content">
									<a href="product.jsp?id=<%=rs3.getString("book_id") %>"><h4><%=rs3.getString("book_name") %></h4></a>
									<p class="item-price"><span><%=rs3.getInt("price") %> Rs.</span></p>
									<a href="AddToCart?id=<%=rs3.getString("book_id") %>" class="btn btn-primary">Add to Cart</a>
								</div>						
							</div>
						</div>
						
					<% 
					
					size3--;
					
					
					if(x3==3){x3=0;
					out.println("</div></div>");
					}else if(size3==0){out.println("</div></div>");}
					else{x3++;}
					
					
					%>
					
					
					<%

			}while(rs3.next());
			}else{
				out.println("<h4>Result Not Found </h4>");
			}
		
					%>	
			</div>
			<!-- Carousel controls -->
			<a class="carousel-control carousel-control1 left carousel-control-prev" href="#myCarousel3" data-slide="prev">
				<i class="fa fa-angle-left"></i>
			</a>
			<a class="carousel-control carousel-control1 right carousel-control-next" href="#myCarousel3" data-slide="next">
				<i class="fa fa-angle-right"></i>
			</a>
		</div>
		</div>
	</div>
</div>



<center><img alt="" src="images/g.png" height="350px" width="100%"></center>


										 
										 
										 
										 
<br>
<br>
<br>
<br>
<br>
<br>
<!-- Start Services -->
		
		<a href="category.jsp?category=9"><h1 id="h" align="center">Our Services</h1></a>
		<hr>
		<a href="category.jsp?category=9"><h1 id="h" align="left" style="margin-left: 5%;">Easy Delivery</h1></a>
		<p align="left" class="sm"  id="des" style=" margin-left: 5%;">In economics, a service is a transaction in which no p
										hysical goods are transferred from the seller to the buyer. 
										<br>The benefits of such a service are held to be demonstrated by
										 the buyer's willingness to make the exchange. <br>Public services 
										 are those that society (nation state, fiscal union, region) as 
										 a whole pays for.</p>
										 <br>
		<center><img alt="" src="images/mot.jpg" height="300px" width="500px"></center>
		
		<!-- End Services -->
		<br>
		<br>
		<br>
<!-- NewsLeter -->
<a href="category.jsp?category=9"><h1 id="h" align="right" style="margin-right: 5%;">Subscription</h1></a>
<hr width="75%">
<p align="right" class="sm"  id="des" style=" margin-right: 5%;">In economics, a service is a transaction in which no p
										hysical goods are transferred from the seller to the buyer. 
										<br>The benefits of such a service are held to be demonstrated by
										 the buyer's willingness to make the exchange. <br>Public services 
										 are those that society (nation state, fiscal union, region) as 
										 a whole pays for.</p>
	<center>
	<form action="EmailSubscriber" method="get">
	<input type="email" name="email" placeholder="Email Address"/>
	<input type="submit" class="btn btn-primary" value="subscribe" name="Subscribe"/>
	</form>
	</center>
			<br>
		<br>
		<br>							 
  	<br>
<h3 id="h" align="left" style="margin-left: 5%;">About ReadEasy</h3>
<p align="left" class="sm"  id="des" style=" margin-left: 5%;">In economics, a service is a transaction in which no p
										hysical goods are transferred from the seller to the buyer. 
										<br>The benefits of such a service are held to be demonstrated by
										 the buyer's willingness to make the exchange. <br>Public services 
										 are those that society (nation state, fiscal union, region) as 
										 a whole pays for.
										 In economics, a service is a transaction in which no p
										hysical goods are transferred from the seller to the buyer. 
										<br>The benefits of such a service are held to be demonstrated by
										 the buyer's willingness to make the exchange. <br>Public services 
										 are those that society (nation state, fiscal union, region) as 
										 a whole pays for.
										 In economics, a service is a transaction in which no p
										hysical goods are transferred from the seller to the buyer. 
										<br>The benefits of such a service are held to be demonstrated by
										 the buyer's willingness to make the exchange. <br>Public services 
										 are those that society (nation state, fiscal union, region) as 
										 a whole pays for.
										 In economics, a service is a transaction in which no p
										hysical goods are transferred from the seller to the buyer. 
										<br>The benefits of such a service are held to be demonstrated by
										 the buyer's willingness to make the exchange. <br>Public services 
										 are those that society (nation state, fiscal union, region) as 
										 a whole pays for.</p>
  
<br>
		<br>
		<br>
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
		
		<%con.close(); %>

</body>
</html>
