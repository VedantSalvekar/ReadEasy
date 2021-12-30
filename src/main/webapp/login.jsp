<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ReadEasy: Login</title>


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
	.main-div{
	margin: 70px auto;
	padding: 35px;
	text-align: center;
	width: 30%;
	background-color: #fff;
	border: 1px solid #d6d6d6;
	box-shadow: 0 0 4px rgba(0, 0, 0, .1);
	}
	.in{
	margin-bottom: 20px;
	border: none;
	border-radius: 0px;
	border-bottom: 2px solid gray;
	}
	input[type="email"]{
	margin-top: 50px;
	}
	.login-btn{
	margin-top: 50px;
	border-radius: 3rem;
	background: #ff00cc;  /* fallback for old browsers */
	background: -webkit-linear-gradient(to right, #333399, #ff00cc);  /* Chrome 10-25, Safari 5.1-6 */
	background: linear-gradient(to right, #333399, #ff00cc); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
	color: #fff;
	}
	p{
	margin-top: 90px;
	}
</style>

</head>
<body>
<div class="main-div">
	<h2><b>ReadEasy</b></h2>
	<h4>Welcome</h4>
	<div id="errorlogin"></div>
	<form class="form-group"name="signinform" method="post">
		<input type="email" class="form-control in" placeholder="Email" name="email"/>
		<input type="password" class="form-control in" placeholder="Password" name="password">
		<input type="button"  class="form-control login-btn" onclick="sendInfo()" value="LOGIN"/> 
	</form>
	<p>Don't have an account? <b><a>Sign Up</a></b></p>
</div>

<script type="text/javascript">
var request;  
function sendInfo()  
{  
	
var v=document.signinform.email.value;
var b=document.signinform.password.value;
var url="\LogIn";  
  
if(window.XMLHttpRequest){  
request=new XMLHttpRequest();  
}  
else if(window.ActiveXObject){  
request=new ActiveXObject("Microsoft.XMLHTTP");  
}  
  
try{  
	
request.onreadystatechange=getInfo;  
request.open("POST",url,true);  
request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
request.send("email="+v+"&"+"password="+b);  
}catch(e){alert("Unable to connect to server");}  
}  
  
function getInfo(){  
if(request.readyState==4){  
var val=request.responseText;  
if(val==""){
	window.location.href = "index.jsp";

}else{
	document.getElementById('errorlogin').innerHTML=val; 

}
}  
}  


</script>



</body>
</html>