<%@page import="java.sql.ResultSet"%>
<%@page import="extras.DBConnection"%>
<html>
<head>
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

<style type="text/css">
#slider {
	margin-top: 73px;
}



/* SideNav CSS */
.sidenav{
width: 250px;
height:100%;
position:fixed;
padding-left:5px;
padding-top: 50px;
background: #fff;
border: 1px solid #d6d6d6;
box-shadow: 0 0 4px rgba(0, 0, 0, .1);
font-weight: bold;
font-family: 'Varela Round', sans-serif;

}
.sidenav a{
padding: 5px 10px;
font-size: 12px;
font-weight: bold;
font-family: 'Varela Round', sans-serif;
}
.sidenav a:hover{
background-color: #eeeeee;
text-decoration: none;

}

/* Main Content */

.main{
margin-left:250px;
margin-top: 70px;
padding: 15px;
}
/* Product Content */
.product{
background: #fff;
border: 1px solid #d6d6d6;
box-shadow: 0 0 4px rgba(0, 0, 0, .1);
box-sizing: border-box;
margin-top: 20px;
}
.product-image{
margin-left: 3px;
margin-right: 10px;
display: inline-block;
vertical-align: top;
}
.product-middle{
display: inline-block;
width: 600px;
margin-top: 5px;
margin-left: 30px;
}
.product-middle p{
padding: 0px;
margin: 0px;
}

.product-right{
display: inline-block;
text-align: center;
width: 30%;
vertical-align:top;
margin-left: 5px;
margin-top: 15px;

}
.price{
font-size: x-large;
color: green;
padding-right: 40px;
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
			<b><a class="navbar-brand" href="index.jsp">ReadEasy</a></b>
		</div>
		<ul class="nav navbar-nav">
			<li>
				<form action="" class="form-inline form-search">
					<a> <input type="text" class="form-control form-rounded"
						placeholder="Search A Book" name="search" id="search"/>
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
		<!-- Side Bar -->
	<div class="sidenav">
	<center><b>Categories<b></b></center>
	<br>
  <a href="category.jsp?category=1">Children's and Young</a><br/><hr>
  <a href="category.jsp?category=2">Literature and Fiction</a><br/><hr>
  <a href="category.jsp?category=3">Exam Preparation</a><br/><hr>
    <a href="category.jsp?category=4">Comics</a><br/><hr> 
  <a href="category.jsp?category=5">Textbooks and Study Guides</a><br/><hr>
  <a href="category.jsp?category=6">Crime Thriller and Mystery</a><br/><hr>
  <a href="category.jsp?category=7">Biographies and Diaries</a><br/><hr>
  <a href="category.jsp?category=8">Business and Economics</a><br/><hr>
  <a href="category.jsp?category=9">Sciences, Technology and Medicine</a><br/><hr>
  <a href="category.jsp?category=10">Arts Film and Photography</a><br/><hr>
</div>

	<!-- Page content -->
	<div class="main">
	<%
	String search = request.getParameter("search");
	String[] sr = search.split(" ");
	String query = "select * from book where book_name like ";
	for (int i = 0; i < sr.length; i++) {
		if (i == sr.length - 1) {
			query = query + "\'%" + sr[i] + "%\'";
		} else {
			query = query + "\'%" + sr[i] + "%\' or";

		}
	}
	DBConnection dbConnection = new DBConnection();
	dbConnection.create();
	try{
	ResultSet search_rs = dbConnection.executeQuery(query);
	
	if (search_rs.next()) {
		do {
%>
		
		<div class="product">
		<div class="product-image">
		<a href="product.jsp?id=<%=search_rs.getString("book_id") %>"><img alt="" src="<%=search_rs.getString("image")%>" width="60px" height="85px"/></a>
		</div>
		<div class="product-middle">
		<a href="product.jsp?id=<%=search_rs.getString("book_id") %>"><h5><b><%=search_rs.getString("book_name")%></b></h5></a>
		<p><i>by</i> <%=search_rs.getString("author") %></p>
		<p style="color:green"><%=search_rs.getString("sell_type")%></p>
		</div>
		<div class="product-right">
		<b class="price"><%=search_rs.getString("price")%> Rs.</b>
		<a href="AddToCart?id=<%=search_rs.getString("book_id") %>" class="btn btn-dark">Add To Cart</a>		
		</div>	
		</div>
		<%
	} while (search_rs.next());
	} else {
%>
<h3>No Result Found</h3>
<%
	}
	}
	catch(Exception e){out.println("Something Went Wrong");System.out.println(e);}
	
%>
		
	
		
		
		
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	<script type="text/javascript">
	function findGetParameter(parameterName) {
	    var result = null,
	        tmp = [];
	    location.search
	        .substr(1)
	        .split("&")
	        .forEach(function (item) {
	          tmp = item.split("=");
	          if (tmp[0] === parameterName) result = decodeURIComponent(tmp[1]);
	        });
	    return result;
	}
	document.getElementById("search").value = findGetParameter("search");	
	</script>

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
