<!DOCTYPE html >
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<html>
<head>
  <title>Cart Page</title>
  	<meta charset="utf-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta http-equiv="Pragma" content="no-cache">
	<meta http-equiv="Cache-Control" content="no-cache">
	<meta http-equiv="Expires" content="sat, 01 Dec 2001 00:00:00 GMT">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	
	
	<title>Electronics online</title>
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
		  		<h1>Welcome</h1>
				
		 	</div>
		 </div>
  <ul class="nav nav-tabs">
    <li class="active"><a href="/welcome">Home</a></li>
        <li><a href="/login">Login</a></li>
    	<li><a href="/register">Register</a></li>
    	<li><a href="/product">Shop</a></li>
  </ul>
  <br>
 
</div>
	<h3>Cart Page</h3>
	
	<head>
		<style>
			table, th, td {
 			 border: 0px;
  				border-collapse: collapse;
			}
			th, td {
  			padding: 5px;
			}
th {
  text-align: left;
}


</style>
</head>
<body>
	<table style="width:100%;
	background-color: #978D8B">
	

		<tr>
			<th>Option</th>
			<th>Product Code</th>
			<th>Description</th>
			<th>Photo</th>
			<th>Price</th>
			<th>Quantity</th>
			<th>Sub Total</th>
		</tr>
		<c:set var="total" value="0"></c:set>
		<c:forEach var="item" items="${sessionScope.cart }">
			<c:set var="total"
				value="${total + item.product.price * item.quantity }"></c:set>
			<tr>
				<td height="100" align="center"><a
					href="${pageContext.request.contextPath }/cart/remove/${item.product.id }"
					onclick="return confirm('Are you sure?')">Remove</a></td>
				<td>${item.product.id }</td>
				<td>${item.product.name }</td>
			
				
				<td><img src="${pageContext.request.contextPath }/static/img/${item.product.photo }" width="100" height="100"></td>
				<td>${item.product.price }</td>
				<td>${item.quantity }</td>
				<td>${item.product.price * item.quantity }</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="6" align="right">Sum</td>
			<td>${total }</td>
		</tr>
	</table>
	<br>
	<a href="${pageContext.request.contextPath }/product">Continue
		Shopping</a>


</body>
</html>