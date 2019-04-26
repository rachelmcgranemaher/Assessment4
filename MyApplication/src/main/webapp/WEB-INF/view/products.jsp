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
            <h1>Welcome to Electronics online</h1>
          
        </div>
    </div>
    <ul class="nav nav-tabs">
        <li class="active"><a href="/welcome">Home</a></li>
      
      
    </ul>
    <br>

</div>

<c:choose>
    <c:when test="${mode=='MODE_HOME'}">
        <div class="container" id="homediv">
            <div class="text-center" style="background-color:#78B0D8;">
                <h1>Welcome to our Website </h1>
                <h3>To access our content please login to our site</h3>
            </div>
        </div>
    </c:when>


    <c:when test="${mode=='MODE_ADDPRODUCT'}">
        <div class="container text-center">
            <h3>Add product</h3>
            <hr>
            <form class="form-horizontal" method="POST" action="save-product">
                <div class="form-group">
                    <label class="control-label col-md-3">product code </label>
                    <div class="col-md-7">
                        <input type="text" class="form-control" name="productCode"
                               value="${product.productCode}"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3">product name </label>
                    <div class="col-md-7">
                        <input type="text" class="form-control" name="name"
                               value="${product.name}"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3">product photo</label>
                    <div class="col-md-7">
                        <input type="file" class="form-control" name="photo"
                               value="${product.photo}"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3">product price</label>
                    <div class="col-md-7">
                        <input type="number" class="form-control" name="price"
                               value="${product.price}"/>
                    </div>
                </div>

        </div>
        <div class="form-group ">
            <input type="submit" class="btn btn-primary" value="Add product"/>
        </div>
        </form>
        </div>
    </c:when>


    <c:when test="${mode=='MODE_ALLPRODUCTS' }">
        <div class="container text-center" id="tasksDiv">
            <h3>All Products</h3>
            <hr>
            <div class="table-responsive">
                <table class="table table-striped table-bordered">
                    <thead>
                    <tr>
                        <th>Id</th>
                        <th>product code</th>
                        <th>name</th>
                        <th>photo</th>
                        <th>price</th>
                        <th>Delete</th>
                        <th>Edit</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="product" items="${products }">
                        <tr>
                            <td>${product.id}</td>
                            <td>${product.productCode }</td>
                            <td>${product.name}</td>
                            <td>${product.photo}</td>
                            <td>${product.price}</td>
                            <td><a href="/products/delete-product/${product.id}"><input type="submit"
                                                                                               class="btn btn-primary"
                                                                                               value="delete"/></a></td>
                            <td><a href="/products/edit-product/${product.id}"><input type="submit"
                                                                                             class="btn btn-primary"
                                                                                             value="edit"/></a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </c:when>


    <c:when test="${mode=='MODE_UPDATEPRODUCT'}">
        <div class="container text-center">
            <h3>Update product</h3>
            <hr>
            <form class="form-horizontal" method="POST" action="/products/update-product">
                <input type="hidden" name="id" value="${product.id}"/>
                <div class="form-group">
                    <label class="control-label col-md-3">Product code</label>
                    <div class="col-md-7">
                        <input type="text" class="form-control" name="productCode"
                               value="${product.productCode }"/>
                    </div>
                <div class="form-group">
                    <label class="control-label col-md-3">Product name</label>
                    <div class="col-md-7">
                        <input type="text" class="form-control" name="name"
                               value="${product.name }"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3">Product photo</label>
                    <div class="col-md-7">
                        <input type="text" class="form-control" name="photo"
                               value="${product.photo }"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3">Product price</label>
                    <div class="col-md-7">
                        <input type="text" class="form-control" name="price"
                               value="${product.price}"/>
                    </div>
                </div>


                <div class="form-group ">
                    <input type="submit" class="btn btn-primary" value="Update"/>
                </div>
            </form>
        </div>
    </c:when>

</c:choose>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="static/js/jquery-1.11.1.min.js"></script>
<script src="static/js/bootstrap.min.js"></script>

</body>
</html>