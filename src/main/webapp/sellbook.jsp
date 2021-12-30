<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ReadEasy : Sell Book</title>
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
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<style type="text/css">
body {
	background: #ffffff;
	font-family: 'Varela Round', sans-serif;
	font-weight: bold;
}

.frame {
	position: absolute;
	top: -9999px;
	left: -9999px;
}

.progress-bar {
	height: 20px;
	width: 100px;
	display: none;
	border: 2px solid green;
}

.progress {
	background-color: blue;
	height: 100%;
	width: 0px;
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
	padding: 30px 0;
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
	box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.3);
	padding: 30px;
}

.signup-form .form-group {
	margin-bottom: 20px;
}

.signup-form label {
	font-weight: normal;
	font-size: 15px;
	font-family: 'Varela Round', sans-serif;
	font-weight: bold;
	color: black;
}

.signup-form input[type="checkbox"] {
	margin-top: 2px;
}

.signup-form .btn {
	padding: 0.5em 2em;
            border-radius: 8px;
            color: white;
            background-color: grey;
            font-size: 1em;
            font-weight: bold;
            font-family: 'Varela Round', sans-serif;
            cursor: pointer;
            margin: 2em;
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
	<%
		String email = (String) session.getAttribute("email");
		if (email == null) {
			out.println("<script> alert(\"Login First\"); </script>");
			response.sendRedirect("login.jsp");
		}
	%>
	<div class="signup-form">
		<form action="SellBook" method="post" class="form-horizontal">
			<div class="col-xs-8 col-xs-offset-4">
			<center><h1><b>ReadEasy</b></h1> <br></center>
				<h2>Sell A Book</h2>
			</div>
			<div class="form-group">
				<label class="control-label col-xs-4">Book Name</label>
				<div class="col-xs-8">
					<input type="text" class="form-control" id="book_name"
						placeholder="Enter Book Name" name="book_name" required>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-xs-4">Book Author</label>
				<div class="col-xs-8">
					<input type="text" class="form-control" id="author"
						placeholder="Enter Author Name" name="author" required>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-xs-4">Book Selling Type</label>
				<div class="col-xs-8">
					<select class="form-control" name="sell_type" id="sell_type">
						<option class="form-input">New</option>
						<option class="form-input">Used</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-xs-4">Book Price</label>
				<div class="col-xs-8">
					<input type="number" class="form-control" id="price"
						placeholder="Enter Book Price In INR (&#8377)" name="price" min="0.00"
						max="10000.00" step="0.01" required>
					
					</input>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-xs-4">Book Description</label>
				<div class="col-xs-8">
					<textarea class="form-control" id="description"
						placeholder="Enter Book Description" name="description" rows="5"
						required></textarea>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-xs-4">Book Type</label>
				<div class="col-xs-8">
					<select class="form-control" name="type" id="type">
						<option class="form-input">Childrens & Young</option>
						<option class="form-input">Literature & Fiction</option>
						<option class="form-input">Exam Preparation</option>
						<option class="form-input">Comics</option>
						<option class="form-input">Textbooks & Study Guides</option>
						<option class="form-input">Crime, Thriller & Mystery</option>
						<option class="form-input">Biographies, Diaries & True
							Accounts</option>
						<option class="form-input">Business & Economics</option>
						<option class="form-input">Sciences, Technology &
							Medicine</option>
						<option class="form-input">Art, Film & Photography</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-xs-4">Book Quantity</label>
				<div class="col-xs-8">
					<input type="number" class="form-control" name="quantity"
						placeholder="Enter Total No. Of Books">
				</div>
			</div>


			<div class="form-group">
				<div class="col-xs-8 col-xs-offset-4">
					<p>
						<label class="checkbox-inline"><input type="checkbox"
							required="required"> I accept the <a href="#">Terms
								of Use</a> &amp; <a href="#">Privacy Policy</a>.</label>
					</p>
					<center><button type="submit" id="book-info-submit" class="btn btn-primary btn-lg">Sell
						Book</button></center>
							<p>
							<br>
						<label class="checkbox-inline">(Note: Upload an Image Before Posting)</label>
					</p>
				</div>
			</div>
			<input type="hidden" id="image-name" name="image">
		</form>

		<form id="file-form" action="BookImageUpload" method="post" enctype="multipart/form-data">  <br>
			<label>Upload a File : </label><br> <br> <input type="file" id="myfile" name="myfile"> <br> <br>
		<center>	<input type="submit" id="submit" name="submit" class="btn btn-primary btn-lg" value="Upload File "> </center>
		</form>

		<p id="status"></p>
		<script type="text/javascript" src="fileUpload.js"></script>
	</div>




<script type="text/javascript">
document.getElementById("book-info-submit").disabled = true;


</script>

</body>

</html>