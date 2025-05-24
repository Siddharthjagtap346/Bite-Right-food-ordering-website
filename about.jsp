<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - BiteRight</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f4f4f9;
            color: #333;
        }

        .about-container {
            margin-top: 60px;
            padding: 50px;
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
        }

        .about-header {
            text-align: center;
            margin-bottom: 40px;
        }

        .about-header h1 {
            font-size: 3rem;
            color: #d60000;
            font-weight: 700;
        }

        .about-header p {
            font-size: 1.2rem;
            color: #555;
        }

        .team-section {
            margin-top: 40px;
            display: flex;
            justify-content: center;
            gap: 30px;
            flex-wrap: wrap;
        }

        .team-member {
            text-align: center;
            padding: 20px;
            max-width: 250px;
        }

        .team-member img {
            width: 130px;
            height: 130px;
            object-fit: cover;
            border-radius: 50%;
            border: 3px solid #d60000;
            margin-bottom: 15px;
        }

        .team-member h5 {
            font-size: 1.2rem;
            font-weight: 600;
            color: #222;
        }

        .team-member p {
            font-size: 1rem;
            color: #777;
        }

        .contact-info {
            text-align: center;
            margin-top: 60px;
            background-color: #071502;
            color: white;
            padding: 30px;
            border-radius: 8px;
        }

        .contact-info h3 {
            font-size: 2rem;
            margin-bottom: 20px;
        }

        .contact-info p {
            font-size: 1.2rem;
        }

        .contact-info i {
            margin-right: 10px;
        }

        .google-map-container {
            margin-top: 40px;
            position: relative;
            overflow: hidden;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        }

        iframe {
            width: 100%;
            height: 450px;
            border: 0;
            border-radius: 12px;
        }
    </style>
</head>
<body>

<%@ include file="navbar.jsp" %>

<div class="container about-container">
    <!-- About Us Section -->
    <div class="about-header">
        <h1>Welcome to BiteRight</h1>
        <p>Your go-to destination for delicious meals delivered right to your doorstep!</p>
    </div>

    <!-- Our Team Section -->
    <div class="team-section">
        <div class="team-member">
            
            <h5>Siddharth Jagtap</h5>
            <p>Founder & CEO</p>
        </div>
        <div class="team-member">
            
            <h5>Aditya Verma</h5>
            <p>Operations Manager</p>
        </div>
        <div class="team-member">
            
            <h5>Sudha Murthy</h5>
            <p>Head Chef</p>
        </div>
    </div>

    <!-- Google Map Section -->
<div class="google-map-container">
    <h3 class="text-center mb-4">Our Location</h3> <!-- Title for the map -->
    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3801.9838083044867!2d77.6125265!3d12.9767655!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bae1b5e2a5f5c1d%3A0xb232fad0c25e61b8!2sFood%20Plaza%20Building%2C%20MG%20Road%2C%20Bengaluru%2C%20Karnataka%20560001!5e0!3m2!1sen!2sin!4v1677245095744!5m2!1sen!2sin" allowfullscreen="" loading="lazy"></iframe>
</div>


    <!-- Contact Info Section -->
    <div class="contact-info mt-5">
        <h3>Contact Us</h3>
        <p><i class="bi bi-telephone-fill"></i> +1 234 567 890</p>
        <p><i class="bi bi-envelope-fill"></i> support@biteright.com</p>
        <p><i class="bi bi-geo-alt-fill me-2"></i>
            <strong>Address:</strong> BiteRight HQ, 5th Floor, Food Plaza Building, MG Road, Bengaluru, Karnataka - 560001, India
        </p>
    </div>

</div>

<%@ include file="footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
