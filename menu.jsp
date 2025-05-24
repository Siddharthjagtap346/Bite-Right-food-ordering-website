<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" ng-app="menuApp">
<head>
    <meta charset="UTF-8">
    <title>Menu - BiteRight</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.min.js"></script>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body ng-controller="MenuController">

<%@ include file="navbar.jsp" %>

<div class="container mt-4">
    <h3 class="text-center mb-4">📋 Our Menu</h3>

    <!-- Show error if no menu items loaded -->
    <c:if test="${not empty error}">
        <div class="alert alert-danger text-center">${error}</div>
    </c:if>

    <div class="row">
        <c:forEach var="item" items="${menuItems}">
            <div class="col-md-4 mb-4">
                <div class="card shadow-sm h-100">
                    <!-- Image using ID-based logic -->
                    <img src="images/${item.id}.jpg" class="card-img-top" alt="${item.name}" style="height: 200px; object-fit: cover;">
                    <div class="card-body d-flex flex-column">
                        <h5 class="card-title">${item.name}</h5>
                        <p class="card-text">${item.description}</p>
                        <p class="card-text text-success fw-bold">$${item.price}</p>

                        <form action="cart" method="post" class="mt-auto">
                            <input type="hidden" name="menuId" value="${item.id}">
                            <input type="hidden" name="name" value="${item.name}">
                            <input type="hidden" name="price" value="${item.price}">
                            <input type="hidden" name="image" value="${item.id}.jpg">
                            <input type="hidden" name="description" value="${item.description}">
                            <input type="number" name="quantity" value="1" min="1" class="form-control mb-2">
                            <button type="submit" class="btn btn-primary w-100">Add to Cart</button>
                        </form>                                              
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<%@ include file="footer.jsp" %>

<script>
    angular.module('menuApp', []).controller('MenuController', function ($scope) {
        // Reserved for any Angular-based interaction if needed in future
    });
</script>
<!-- Bootstrap JS + Popper -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"></script>

</body>
</html>
