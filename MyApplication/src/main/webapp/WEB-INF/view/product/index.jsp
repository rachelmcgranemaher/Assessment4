<!DOCTYPE html >
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
  <title>Products</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta http-equiv="Pragma" content="no-cache">
	<meta http-equiv="Cache-Control" content="no-cache">
	<meta http-equiv="Expires" content="sat, 01 Dec 2001 00:00:00 GMT">
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
			<div class= "jumbotron text-center"style="background-color:#78B0D8;">
			
			
			
		  		<h1>Welcome to Electronics online</h1>
				
		 	</div>
		 </div>
  		<ul class="nav nav-tabs">
    			<li class="active"><a href="/welcome">Home</a></li>
				<li><a href="/products">Add Product</a></li>
  		</ul>
  	<br>
 
</div>




	<h2>Shop</h2>
<head>
<style>
table, th, td {
  border: 1px solid #78B0D8;
  border-collapse: collapse;
}


tr:nth-child(even){background-color: #78B0D8;}"
tr:hover {background-color: #ddd;} 


th, td {
  padding: 8px;
}
th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #78B0D8;
  color: white;
}


.button {
  display: inline-block;
  padding: 15px 25px;
  font-size: 24px;
  cursor: pointer;
  text-align: center;
  text-decoration: none;
  outline: none;
  color: #fff;
  background-color: #4CAF50;
  border: none;
  border-radius: 15px;
  box-shadow: 0 9px #999;
}

.button:hover {background-color: #3e8e41}

.button:active {
  background-color: #78B0D8;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}


</style>
</head>
<body>
	



	
<table style="width:100%;
	tr:background-color: #78B0D8;}"
	tr:hover {background-color: #78B0D8;}>
	
	

	
		<tr>
			<th>Product Code</th>
			<th>Description</th>
			<th>Photo</th>
			<th>Price(Euro)</th>
			<th>Buy</th>
		</tr>
		<c:forEach var="product" items="${products }">
			<tr>
				<td height="100">${product.id }</td>
				<td>${product.name }</td>
				
				
				
				<td><img src="${pageContext.request.contextPath }/static/img/${product.photo }" width="300" height="300"></td>
				
				
				
				<td>${product.price }</td>
				<td align="left">
					<a href="${pageContext.request.contextPath }/cart/buy/${product.id}"><button class="button">Buy now</button></a>
				</td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>