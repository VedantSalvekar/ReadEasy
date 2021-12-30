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

position:fixed;
background: #fff;
box-shadow: 0px 0px 0px rgba(0, 0, 0, 0.3);
font-family: 'Varela Round', sans-serif;
font-size: 12px;
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




/* Personal Information */
.personal-information{
width: 1000px;
padding-top:30px;
margin-left: 300px;
margin-top: 70px;
}
.personal-information-div{
box-shadow: 0px 0px 0px rgba(0, 0, 0, 0.3);
margin:15px;
font-family: 'Varela Round', sans-serif;
font-weight: bold;

}

}
.title{
color: #fff;
background-color: #33b5e5;
padding: 15px;
margin-bottom: 20px;
font-weight: bold;
}
.divs{
display: inline;
}
.div1{
width: 485px;
padding: 15px;
}
.div2{
width: 485px;
padding: 15px;
}
.label{
padding: 10px 0px;
}
#btn {
            padding: 0.5em 2em;
            border-radius: 8px;
            color: white;
            background: #0099CC;
            font-size: 1em;
            font-weight: bold;
            font-family: 'Varela Round', sans-serif;
            cursor: pointer;
            margin: 2em;
        }
.titlex
{
color: grey;
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
	<h5><b><center> My Account</center></b></h5>
	<ul>
	<li class="active" onclick="location.href='profile.jsp'"><i class="fa fa-user"></i> Personal Information</a></li>
	<li onclick="location.href='profile_sellbooks.jsp'"><i class="fa fa-book"></i> Sell Books</li>
	<li onclick="location.href='profile_myorders.jsp'"><i class="fa fa-shopping-cart"></i> My Orders</li>
	<li onclick="location.href='profile_resetpassword.jsp'"><i class="fa fa-key"></i> Reset Password</li>
	<li onclick="location.href='LogOut'"><i class="fa fa-sign-out"></i> Log Out</li>
	</ul>
	</div>
	
	
	
	<!-- Personal Information -->
	<%
	DatabaseManager databaseManager = new DatabaseManager();
	databaseManager.createConnection();
	ResultSet rs = databaseManager.executeQuery("select * from user where email='"+email+"'");
	rs.next();
	%>

	<div class="personal-information">
	<div class="personal-information-div">
	<h4 class="title"><center><b>Personal Information </b></center></h4>
		<br>
		<center><img alt="" src="images/acc.png" height="150px" width="200px"></center>
	<br>
		<br>
	<center><h6 class="titlex">To edit the info that you use on ReadEasy services, like your name and photo, 
		sign in to your account.
	<br> You can also choose what personal info to show when you
	 interact with others on ReadEasy e-commerce platfom.</h6></center>
	
	<form action="EditPersonalInfo" name="personalinfo" method="post">
	<div class="divs">
	<div class="div1">
		<br>
	<br>

	<h5>Profile</h5>
	<hr width="200%">
	
	<label for="user_name">Full Name : </label> 
	 <input class="form-control" type="text" name="user_name" placeholder="Enter Your Name" value="<%=rs.getString("user_name")%>">
	<br>
	<label for="gender">Gender :</label>
	<%if(rs.getString("gender").equals("male")){ %>
	<input  type="radio" name="gender" checked="checked" value="male">Male
	<input  type="radio" name="gender" value="female">Female<br>
	<%} %>
	<%if(rs.getString("gender").equals("female")){ %>
	<input  type="radio" name="gender" value="male">Male<br>
	<input  type="radio" name="gender"checked="checked" value="female">Female<br>
	<%} %>  
	<br><label for="email">Email :</label>
	<input class="form-control" type="email" name="email" value="<%=email%>">
	<br><label for="mobile_no">Mobile No :</label>
	<input class="form-control" type="tel" name="mobile_no" value="<%=rs.getLong("mobile_no")%>">
	</div>
	<div class="div2">
	
	<label for="address">Address :</label>
	<textarea class="form-control" rows="5" name="address"><%=rs.getString("address") %></textarea>
	<br><label for="zipcode">Zipcode :</label>
	<input class="form-control" type="number" name="zipcode" placeholder="Enter your zipcode" value="<%=rs.getString("zipcode")%>">
	</div>
	</div>
	<br>
	<center><h6 class="titlex">Choose what others see
You decide what personal info you make visible to others across ReadEasy services</h6></center>
<br>
<br>
	<center>
		<a class="btn btn-primary" onclick="editPersonalInfo()">Edit Information</a>
	<input type="submit" class="btn btn-primary" value="Save Changes" name="savechanges"/>
		
	</center>
	</form>

	
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
		
		
	<script type="text/javascript">
	document.forms.personalinfo.user_name.disabled=true;
	document.forms.personalinfo.email.disabled=true;
	document.forms.personalinfo.address.disabled=true;
	document.forms.personalinfo.zipcode.disabled=true;
	document.forms.personalinfo.savechanges.disabled=true;
	document.forms.personalinfo.mobile_no.disabled=true;
	
	var radios = document.personalinfo.gender;

	for (var i=0, iLen=radios.length; i<iLen; i++) {
	  radios[i].disabled = true;
	} 
	
	function editPersonalInfo(){
		document.forms.personalinfo.user_name.disabled=false;
		document.forms.personalinfo.email.disabled=false;
		document.forms.personalinfo.address.disabled=false;
		document.forms.personalinfo.zipcode.disabled=false;
		document.forms.personalinfo.savechanges.disabled=false;
		document.forms.personalinfo.mobile_no.disabled=false;
		var radios = document.personalinfo.gender;

		for (var i=0, iLen=radios.length; i<iLen; i++) {
		  radios[i].disabled = false;
		} 
		
		
	}



	</script>
	
</body>
</html>