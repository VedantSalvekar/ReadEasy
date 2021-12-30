<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ReadEasy : SignUp</title>

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

<script type="text/javascript" src="js/validate.js"></script>

<style type="text/css">
body {
	background: #ffffff;
	font-family: 'Varela Round', sans-serif;
	font-weight: bold;
}

.form-control {
	border-color: #eee;
	min-height: 41px;
	box-shadow: none !important;
}

.form-control:focus {
	border-color: #5cd3b4;
}

.form-control, .btn {
	border-radius: 3px;
}

.signup-form {
	width: 500px;
	margin: 0 auto;
	padding: 50px 0;
}

.signup-form h2 {
	color: #333;
	margin: 0 0 30px 0;
	display: inline-block;
	padding: 0 30px 10px 0;
	border-bottom: 3px solid #5cd3b4;
}

.signup-form form {
	color: #999;
	border-radius: 3px;
	margin-bottom: 15px;
	background: #fff;
	box-shadow: 0px 20px 20px rgba(0, 0, 0, 0.3);
	padding: 30px;
}

.signup-form .form-group {
	margin-bottom: 20px;
}

.signup-form label {
	font-weight: bold;;
	font-size: 15px;
	font-family: 'Varela Round', sans-serif;
	color: black;
}

.signup-form input[type="checkbox"] {
	margin-top: 2px;
}

.signup-form .btn {
	font-size: 16px;
	font-weight: bold;
	background: #5cd3b4;
	border: none;
	margin-top: 20px;
	min-width: 140px;
}

.signup-form .btn:hover, .signup-form .btn:focus {
	background: #41cba9;
	outline: none !important;
}

.signup-form a {
	color: #5cd3b4;
	text-decoration: underline;
}

.signup-form a:hover {
	text-decoration: none;
}

.signup-form form a {
	color: #5cd3b4;
	text-decoration: none;
}

.signup-form form a:hover {
	text-decoration: underline;
}
</style>

</head>
<body>
	<div class="signup-form">
		<form action="SignUp" method="post" class="form-horizontal" name="signupform" onsubmit="val()">
			<div class="col-xs-8 col-xs-offset-4">
			<h2>Sign Up</h2>
			</div>
			<div class="text-center">
			Already have an account? <a href="#">Login here</a><br> 
		</div>
		<br>
			<div class="form-group">
				<label class="control-label col-xs-4">Full Name</label>
				<div class="col-xs-8">
					<input type="text" class="form-control" name="name"
						required="required">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-xs-4">Email Address</label>
				<div class="col-xs-8">
					<input type="email" class="form-control" name="email"
						required="required">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-xs-4">Mobile No</label>
				<div class="col-xs-8">
					<input type="tel" class="form-control" name="mobile_no"
						required="required">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-xs-4">Gender</label>
				<div class="col-xs-8">
					<select class="form-control" name="gender" required="required">
						<option class="form-control">Select Gender</option>
						<option class="form-control" value="male">Male</option>
						<option class="form-control" value="female">Female</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-xs-4">Address </label>
				<div class="col-xs-8">
					<textarea class="form-control" name="address"
						placeholder="Enter Address" rows="3" required="required"></textarea>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-xs-4">Zipcode </label>
				<div class="col-xs-8">
					<input type="text" class="form-control" name="zipcode" id="zipcode"
						placeholder="Enter zipcode" required="required" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-xs-4" >Password </label>
				<div class="col-xs-8">
					<input type="password" class="form-control" name="password"
						id="re_password" placeholder="Enter your password" required="required"/>
				</div>
			</div>



			<div class="form-group">
				<div class="col-xs-8 col-xs-offset-4">
					<p>
						<label class="checkbox-inline"><input type="checkbox"
							required="required"> I accept the <a href="#">Terms
								of Use</a> &amp; <a href="#">Privacy Policy</a>.</label>
					</p>
					<button type="submit" class="btn btn-primary btn-lg">Sign
						Up</button>
				</div>
			</div>
		</form>
		<br>
		
	</div>

</html>