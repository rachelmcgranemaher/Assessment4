<!DOCTYPE html >
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Electronics online</title>
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
    <div class="container" id="homediv">
        <div class="jumbotron text-center" style="background-color:#78B0D8;">
            <h1>Electronics online</h1>
            
        </div>
    </div>
    <ul class="nav nav-tabs">
        <li class="active"><a href="/welcome">Home</a></li>
        <li><a href="/login">Login</a></li>
        <li><a href="/register">Register</a></li>
        <li><a href="/show-users">Users</a></li>
        <li><a href="/shop">Shop</a></li>
       
    </ul>
    <br>

</div>

<div class="container text-center" id="tasksDiv">
    <h3>Products</h3>
    <hr>
    <div class="table-responsive">
        <table class="table table-striped table-bordered">
            <thead>
            <tr>
                <th>name</th>
                <th>photo</th>
                <th>price</th>
                <td></td>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="product" items="${products }">
                <tr>
                    <td>${product.id}</td>
                    <td>${product.photo}</td>
                    <td>${product.price}</td>
                    <td><a href="/cart/add/${product.id}"><input type="submit" class="btn btn-primary"
                                                                        value="Add to Cart"/></a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="static/js/jquery-1.11.1.min.js"></script>
<script src="static/js/bootstrap.min.js"></script>

</body>
</html>