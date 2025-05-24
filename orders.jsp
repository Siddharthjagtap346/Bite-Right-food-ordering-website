<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    List<Map<String, Object>> orders = (List<Map<String, Object>>) request.getAttribute("orders");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Your Orders - BiteRight</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

</head>
<body>
<%@ include file="navbar.jsp" %>
<div class="container mt-5">
    <h2>📦 Your Past Orders</h2>
    <% if (orders == null || orders.isEmpty()) { %>
        <p>No orders found.</p>
    <% } else { 
        for (Map<String, Object> order : orders) {
    %>
    <div class="card mb-4">
        <div class="card-header d-flex justify-content-between">
            <strong>Order #<%= order.get("orderId") %></strong>
            <span>Status: <%= order.get("status") %></span>
        </div>
        <ul class="list-group list-group-flush">
            <% 
                List<Map<String, Object>> items = (List<Map<String, Object>>) order.get("items");
                for (Map<String, Object> item : items) {
            %>
            <li class="list-group-item d-flex align-items-center">
                <div>
                    <strong><%= item.get("name") %></strong><br>
                    Quantity: <%= item.get("quantity") %> × $<%= item.get("price") %>
                </div>
                <div class="ms-auto">
                    Subtotal: $<%= String.format("%.2f", ((double)item.get("price") * (int)item.get("quantity"))) %>
                </div>
            </li>
            <% } %>
        </ul>
        <div class="card-footer">
            <strong>Total:</strong> $<%= String.format("%.2f", order.get("totalPrice")) %> | 
            <small>Ordered at: <%= order.get("orderTime") %></small>                       
        </div>
    </div>
    <% 
        } 
    } %>
</div>
<%@ include file="footer.jsp" %>
<!-- Bootstrap JS + Popper -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"></script>

</body>
</html>
