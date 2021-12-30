<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.security.NoSuchAlgorithmException"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="java.util.Random"%>
<%@page import="extras.DatabaseManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page import="extras.DBConnection"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">



<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ReadEasy : MyCart</title>
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


















<script type="text/javascript">
var RequestData;
var Handler;
</script>

<style type="text/css">

.cart{
margin-left:30px;
background: #fff;
border: 0px solid #d6d6d6;
box-shadow: 0 0 0px rgba(0, 0, 0, .1);
margin-top: 5%;
width: 70%;
display: inline-block;
height: auto;
font-family: 'Varela Round', sans-serif;

}
.cart h5{
padding:5px;
text-align: center;
}
table{
font-size: 15px;
background: #fff;
font-weight: bold;
}
.name{
display: inline-block;
vertical-align: top;
}
.qty{
display: inline-block;

}

.checkout{

display: inline-block;
vertical-align: top;
margin-top: 9.5%;
margin-left: 2%;
background: #fff;
border: 1px solid #d6d6d6;
box-shadow: 0 0 0px rgba(0, 0, 0, .1);
width: 25%;
padding: 10px;
font-family: 'Varela Round', sans-serif;
font-size: 12px;
z-index: 99;
}
.titlex
{
color: grey;
font-family: 'Varela Round', sans-serif;
margin-left: 5%;
}
</style>

</head>

<body>


















	<%
		int cartTotal = 0;
		boolean login = false;
		boolean isEmpty = false;
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

	
		<form action="checkout.jsp" method="post" name="checkout">
		
		
		
		<!-- PayU -->
<h1 id="h1" style="margin-top: 10%; margin-left: 5%; font-family: 'Varela Round', sans-serif;"><b><i
					class="fas fa-cart-arrow-down"></i> Your Shopping Cart </b></h1>
	<hr width="90%">
	
	<h6 class="titlex">Your Shopping Cart lives to serve. Give it purpose--fill it with books, CDs, videos, 
	<br>DVDs, electronics, and more. If you already have an account, Sign In to see your Cart. <br>
Continue shopping on the Amazon.in homepage, learn about today's deals, or visit your Wish List.
<br>
The price and availability of items at Amazon.in are subject to change. The shopping cart is a <br>
temporary place to store a list of your items and reflects each item's most recent price.</h6>
	
	
	<!-- Cart -->
	<div class="cart">
	<h5><b>My Shopping Cart</b></h5>
  			<br>
  			<div class="table-responsive">
            <table class="table">
             <thead>
                <tr>
                  <th scope="col" class="border-1 bg-white">
                    <div >Product</div>
                  </th>
                  <th scope="col" class="border-1 bg-white">
                    <div class="text-uppercase"></div>
                  </th>
                  <th scope="col" class="border-1 bg-white">
                    <div >Price</div>
                  </th>
                  <th scope="col" class="border-1 bg-white">
                    <div class=" text-uppercase">Quantity</div>
                  </th>
                  <th scope="col" class="border-1 bg-white">
                    <div ></div>
                  </th>
                </tr>
              </thead>
              <tbody>
              <%
              DatabaseManager databaseManager = new DatabaseManager();
              databaseManager.createConnection();
              String book_names = "";
              String book_ids = "";
              try{
              ResultSet rs = databaseManager.executeQuery("select * from cart where email='"+email+"'");
              if(!rs.next()){isEmpty = true;
              %>
              <tr><th><h4>No Items to Display</h4></th></tr>
              <% 
              }else{
              do{
            	String book_id = rs.getString("book_id");	  
       			book_ids = book_ids+ book_id+"&";
              ResultSet rs1 = databaseManager.executeQuery("select book_name,image,price from book where book_id='"+book_id+"'");
              rs1.next();
              cartTotal = cartTotal + Integer.parseInt(rs1.getString("price"));    
              book_names= book_names+rs1.getString("book_name")+"&";            
              
              %>
                <tr>
                
                  <th scope="row" class="border-0">
                    <div>
                      <img src="<%=rs1.getString("image") %>" alt="" width="70px" height="100px" class="img-fluid rounded shadow-sm">
           
                    </div>
                  </th>
                  <td>
                        <b> <a href="#"><%=rs1.getString("book_name") %></a></b>
                   		
                   </td>
                  <td class="border-1 align-middle"><strong><%=rs1.getString("price") %></strong></td>
                  <td class="border-1 align-middle"><strong><%=rs.getString("quantity") %></strong></td>
                  <td class="border-1 align-middle"><a href="DeleteFromCart?book_id=<%=book_id %>" class="text-dark"><i class="fa fa-trash"></i></a></td>
                </tr>
                   
              <% rs1.close();}
              while(rs.next());
              }
              System.out.println(book_ids);
              rs.close();
              }catch(Exception e) 
              {System.out.println(e);} %> 
                  
             </tbody>
            </table>
          </div>
  			
  			
  			
  			
  		<div class="cart">
  		<table class="table">
  		<thead class="bg-white">
  		<tr>
  		<th>
  		Cart Subtotal: 
  		</th>
  		<th><%=cartTotal %>Rs.</th>
  		</tr>
  		</thead>
  		<thead class="bg-white">
  		<tr>
  		<th>
  		Shipping :
  		</th>
  		<th>Free Shipping</th>
  		</tr>
  		</thead>
  		<thead class="bg-white">
  		<tr>
  		<th>
  		Order Total 
  		</th>
  		<th><%= cartTotal %> Rs.</th>
  		</tr>
  		</thead>

  		</table>
  		
	</div>
	</div>
	<input type="hidden" value="<%=book_ids%>" name="productinfo">
	<input type="hidden" value="<%=book_names%>" name="book_names">
	<input type="hidden" value="<%=cartTotal%>" name="amount"> 
	<input type="hidden" value="www.google.com" name="surl"> 
	
	
	
	
	<!-- Checkout -->
	<%
	if(!isEmpty){
	try{
	ResultSet rs = databaseManager.executeQuery("select * from user where email='"+email+"'");
	rs.next();
	%>
	<div class="checkout">
	<b><h3 style="text-align: center;"><b>ReadEasy Payment</b></h3></b>
	<br>
	<div class="alert alert-dark shipping" style="font-size: 15px;">
	Shipping Address
	</div>
	<div class="shipping-address">
	<label for="email">Email :</label>
	<input type="email" placeholder="Enter Your Email Address" class="form-control" value="<%=email %>" name="email"/>
	<br><label for="user_name">Full Name :</label>
	<input type="text" placeholder="Enter Your Full Name" class="form-control" value="<%=rs.getString("user_name") %>" name="firstname"/>
	<br><label for="address">Address :</label>
	<textarea  placeholder="Enter Your Address" class="form-control" rows="5" name="address"><%=rs.getString("address") %></textarea>
	<br><label for="zipcode">Zipcode :</label>
	<input type="number" placeholder="Zipcode" class="form-control" name="zipcode" value="<%=rs.getInt("zipcode") %>" />
	<br><label for="phone">Contact No. :</label>
	<input name="phone" placeholder="Enter Phone Number" class="form-control" value="<%=rs.getLong("mobile_no") %>" />
	<input type="hidden" name="productinfo" value="Products" size="64" />
	<input type="hidden" name="surl" value="message.jsp" size="64" />
	<input type="hidden" name="furl" value="cart.jsp" size="64" />
	</div>
	<div class="alert alert-dark payment" style="font-size: 15px;">
	Payment Method
	</div>
	<div class="payment-method">
	<input type="radio" name="payment_method"  value="cash">Cash On Delivery <br><br>
	<input type="radio" name="payment_method" value="online">Pay Online 
	</div>
	<br>	<center><input type="submit" value="Place Order" class="btn btn-primary" ></center>
	</div>
	</form>
	

	<%
	
	}catch(Exception e){System.out.println(e);} } 
	
	databaseManager.closeConnection();
	%>



<br>
<br>

<br>
<br>


<br>
<br>


<br>
<br>

<br>
<br>

<br>
<br>


<br>
<br>


<br>
<br>









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

	<script type="text/javascript">
	$(".shipping").click(function(){
		  $(".shipping-address").slideToggle();
		});
	
	$(".payment").click(function(){
		  $(".payment-method").slideToggle();
		});
	
	$(".order").click(function(){
		  $(".order-summary").slideToggle();
		});
	
	
		
	</script>
	
</body>
</html>
