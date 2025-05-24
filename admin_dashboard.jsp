<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page language="java" session="true" %>
<%@ include file="navbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard - BiteRight</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

</head>
<body>
<div class="container mt-5">
    <h2 class="mb-4">👨‍💼 Admin Dashboard</h2>
    <div class="row">
        <div class="col-md-3">
            <a href="updateOrderStatus" class="btn btn-outline-primary w-100 mb-3">📦 Manage Orders</a>
        </div>
        <div class="col-md-3">
            <a href="manageMenu" class="btn btn-outline-success w-100 mb-3">🍔 Manage Menu</a>
        </div>
        <div class="col-md-3">
            <a href="viewUsers" class="btn btn-outline-info w-100 mb-3">👥 View Users</a>
        </div>
        <div class="col-md-3">
            <a href="loginHistory" class="btn btn-outline-warning w-100 mb-3">🕒 Login History</a>
        </div>
    </div>
</div>
<%@ include file="footer.jsp" %>
<!-- Bootstrap JS + Popper -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"></script>

</body>
</html>
