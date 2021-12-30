<%@page import="java.sql.ResultSet"%>
<%@page import="extras.DatabaseManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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

.carousel1 .item1 h4 {
	font-size: 18px;
	margin: 10px 0;
}

.carousel1 .item1 .btn1 {
	color: #333;
	border-radius: 0;
	font-size: 11px;
	text-transform: uppercase;
	font-weight: bold;
	background: none;
	border: 1px solid #ccc;
	padding: 5px 10px;
	margin-top: 5px;
	line-height: 16px;
}



.carousel1 .thumb-wrapper {
	text-align: center;
}

.carousel1 .thumb-content {
	padding: 15px;
}

.carousel1 .carousel-control1 {
	height: 100px;
	width: 40px;
	background: none;
	margin: auto 0;
	background: rgba(0, 0, 0, 0.2);
}

.carousel1 .carousel-control1 i {
	font-size: 30px;
	position: absolute;
	top: 50%;
	display: inline-block;
	margin: -16px 0 0 0;
	z-index: 5;
	left: 0;
	right: 0;
	color: rgba(0, 0, 0, 0.8);
	text-shadow: none;
	font-weight: bold;
}

.carousel1 .item-price {
	font-size: 13px;
	padding: 2px 0;
}

.carousel1 .item-price strike {
	color: #999;
	margin-right: 5px;
}

.carousel1 .item-price span {
	color: #86bd57;
	font-size: 110%;
}

.carousel1 .carousel-control1.left i {
	margin-left: -3px;
}

.carousel1 .carousel-control1.left i {
	margin-right: -3px;
}

.carousel1 .carousel-indicators1 {
	bottom: -50px;
}

.carousel-indicators1 li, .carousel-indicators1 li.active {
	width: 10px;
	height: 10px;
	margin: 4px;
	border-radius: 50%;
	border-color: transparent;
}

.carousel-indicators1 li {
	background: rgba(0, 0, 0, 0.2);
}

.carousel-indicators1 li.active {
	background: rgba(0, 0, 0, 0.6);
}


</style>
</head>
<body>
	<%
		String category = request.getParameter("category");
		DatabaseManager databaseManager = new DatabaseManager();
		ResultSet rs = databaseManager.executeQuery("select * from book where type='" + category + "' limit 12");
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div id="myCarousel" class="carousel slide carousel1"
					data-ride="carousel" data-interval="0">
					<!-- Wrapper for carousel items -->
					<div class="carousel-inner">
						<%
							boolean check = rs.next();
							int i = 0;
							boolean a = true;

							if (check) {

								do {

									if (i == 0 && a == true) {
										a = false;
						%>
						<div class="item item1 carousel-item active">
							<div class="row">
								<%
									} else {
								%>
								<div class="item item1 carousel-item">
									<div class="row">
										<%
											}
										%>




										<div class="col-sm-3">
											<div class="thumb-wrapper">
												<div class="img-box">
													<img src="/Image/<%=rs.getString("image")%>"
														class="img-responsive img-fluid" alt="">
												</div>
												<div class="thumb-content">
													<h4><%=rs.getString("book_name")%></h4>
													<p class="item-price"><%=rs.getInt("price")%>
														Rs.
													</p>

													<a href="AddToCart?id=<%=rs.getString("book_id")%>"
														class="btn btn-primary">Add to Cart</a>
												</div>
											</div>
										</div>






									</div>
								</div>
								<%
									if (i == 3) {
												i = 0;
												out.println("</div></div>");
											} else {
												i++;
											}
								%>
								<%
									} while (rs.next());
									} else {
								%><h4>NO ITEMS AVAILABLE</h4>
								<%
									}
								%>



							</div>
							<!-- Carousel controls -->
							<a class="carousel-control carousel-control1 left carousel-control-prev"
								href="#myCarousel" data-slide="prev"> <i
								class="fa fa-angle-left"></i>
							</a> <a class="carousel-control carousel-control1 right carousel-control-next"
								href="#myCarousel" data-slide="next"> <i
								class="fa fa-angle-right"></i>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	
	
	
	
	
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
