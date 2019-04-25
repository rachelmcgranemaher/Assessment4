<!DOCTYPE html >
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
  <title>Online Electronics</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta http-equiv="Pragma" content="no-cache">
	<meta http-equiv="Cache-Control" content="no-cache">
	<meta http-equiv="Expires" content="sat, 01 Dec 2001 00:00:00 GMT">
	<title>Online Electronics</title>
	<link href="static/css/bootstrap.min.css" rel="stylesheet">
	<link href="static/css/style.css" rel="stylesheet">
	<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>
	<div class="container">
    	<div class= "container"id="homediv">
			<div class= "jumbotron text-center"style="background-color:#d17382;">
		  		<h1>Online Electronics</h1>
				
		 	</div>
		 </div>
  		<ul class="nav nav-tabs">
    			<li class="active"><a href="/welcome">Home</a></li>
    			<li><a href="/product">Shop</a></li>
    			
  		</ul>
  	<br>
 
</div>


	<c:choose> 
		<c:when test = "${mode=='MODE_PRODUCT'}">
			<div class= "container"id="homediv">
				<div class= "text-center"style="background-color:#e8e5e6;">
		 	 		<h1>Welcome to our Shop </h1>
					<h3>To access our content please login to our site</h3>
		 		</div>
		 	</div>
		 </c:when>
		 </c:choose>

	
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="static/js/jquery-1.11.1.min.js"></script>
	<script src="static/js/bootstrap.min.js"></script>
</body>
</html>