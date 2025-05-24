<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Your Cart - BiteRight</title>
    <!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

</head>
<body>
<%@ include file="navbar.jsp" %>
<div class="container mt-5">
    <h2>Your Shopping Cart</h2>

    <%
        List<Map<String, Object>> cart = (List<Map<String, Object>>) session.getAttribute("cart");
        if (cart == null || cart.isEmpty()) {
    %>
        <div class="alert alert-info">Your cart is empty.</div>
    <%
        } else {
            double total = 0;
    %>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Item</th>
                    <th>Image</th>
                    <th>Price</th>
                    <th>Qty</th>
                    <th>Subtotal</th>
                </tr>
            </thead>
            <tbody>
            <%
                for (Map<String, Object> item : cart) {
                    int quantity = (int) item.get("quantity");
                    double price = (double) item.get("price");
                    double subtotal = quantity * price;
                    total += subtotal;
            %>
                <tr>
                    <td><%= item.get("name") %></td>
                    <td><img src="images/<%= item.get("image") %>" width="60"></td>
                    <td>$<%= price %></td>
                    <td><%= quantity %></td>
                    <td>$<%= String.format("%.2f", subtotal) %></td>
                </tr>
            <%
                }
            %>
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="4" class="text-end"><strong>Total:</strong></td>
                    <td><strong>$<%= String.format("%.2f", total) %></strong></td>
                </tr>
            </tfoot>
        </table>

        <!-- 🟢 Place Order Button -->
        <form action="order" method="post" class="container mt-4 p-4 rounded shadow" style="max-width: 600px; background-color: #f8f9fa;">
            <h3 class="mb-4 text-center">Confirm Your Order</h3>
        
            <div class="mb-3">
                <label for="fullname" class="form-label">Full Name</label>
                <input type="text" class="form-control" id="fullname" name="fullname" placeholder="Enter your full name" required>
            </div>
        
            <div class="mb-3">
                <label for="address" class="form-label">Address</label>
                <textarea class="form-control" id="address" name="address" rows="3" placeholder="Enter your delivery address" required></textarea>
            </div>
        
            <div class="mb-3">
                <label for="phone" class="form-label">Phone Number</label>
                <input type="tel" class="form-control" id="phone" name="phone" placeholder="Enter your phone number" pattern="[0-9]{10}" required>
                <div class="form-text">We'll only use this to contact you about your order.</div>
            </div>
        
            <div class="text-center">
                <button type="submit" class="btn btn-primary px-4">Place Order</button>
            </div>
        </form>             

    <%
        }
    %>
</div>
<!-- Bootstrap JS + Popper -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"></script>

</body>
</html>
