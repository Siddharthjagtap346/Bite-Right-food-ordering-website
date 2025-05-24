<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page language="java" session="true" %>
<%@ include file="navbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>BiteRight - Home</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@400;700&display=swap" rel="stylesheet">

    <!-- Custom CSS -->
    <style>
        body {
            font-family: 'Raleway', sans-serif;
            background: url('images/food-bg.jpg') no-repeat center center/cover;
            min-height: 100vh;
            margin: 0;
            color: #333;
        }

        .overlay {
            background-color: rgba(255, 255, 255, 0.85);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 60px 20px;
        }

        .hero-box {
            background: #fff;
            padding: 60px 40px;
            border-radius: 20px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .hero-title {
            font-size: 3.2rem;
            font-weight: 700;
            color: #dc3545;
        }

        .hero-subtitle {
            font-size: 1.25rem;
            margin: 20px 0;
            color: #555;
        }

        .btn-custom {
            min-width: 180px;
            font-size: 1.1rem;
            padding: 12px 24px;
            margin: 10px;
            transition: all 0.3s ease-in-out;
        }

        .btn-custom:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 12px rgba(0,0,0,0.15);
        }
    </style>
</head>
<body>

<div class="overlay">
    <div class="container hero-box">
        <h1 class="hero-title">Welcome to BiteRight</h1>
        <p class="hero-subtitle">Delicious meals delivered fresh and fast to your door. Discover, order, and enjoy!</p>

        <%
            String username = (String) session.getAttribute("username");
            String role = (String) session.getAttribute("role");

            if (username == null) {
        %>
            <a href="register" class="btn btn-outline-danger btn-custom">Register</a>
            <a href="login" class="btn btn-danger btn-custom">Login</a>
        <%
            } else if ("admin".equals(role)) {
        %>
            <h4 class="mt-4">Welcome back, <strong><%= username %></strong> (Admin)!</h4>
            <a href="admin_dashboard.jsp" class="btn btn-warning btn-custom">Admin Panel</a>
        <%
            } else {
        %>
            <h4 class="mt-4">Welcome back, <strong><%= username %></strong>!</h4>
            <a href="menu" class="btn btn-success btn-custom">View Menu</a>
            <a href="order" class="btn btn-outline-dark btn-custom">Your Orders</a>
        <%
            }
        %>
    </div>
</div>

<%@ include file="footer.jsp" %>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
