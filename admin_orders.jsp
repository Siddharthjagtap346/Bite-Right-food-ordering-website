<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="navbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Orders - BiteRight Admin</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

</head>
<body>
<div class="container mt-5">
    <h2>📦 Manage Orders</h2>
    <table class="table table-striped mt-3">
        <thead>
            <tr>
                <th>ID</th>
                <th>User</th>
                <th>Total Price</th>
                <th>Status</th>
                <th>Update Status</th>
            </tr>
        </thead>
        <tbody>
            <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection conn = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/biteright_db?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true",
                        "root", "password"
                    );
    
                    String query = "SELECT o.id, u.username, o.total_price, o.status FROM orders o " +
                                   "JOIN users u ON o.user_id = u.id";
                    PreparedStatement ps = conn.prepareStatement(query);
                    ResultSet rs = ps.executeQuery();
    
                    while (rs.next()) {
                        int id = rs.getInt("id");
                        String username = rs.getString("username");
                        double totalPrice = rs.getDouble("total_price");
                        String status = rs.getString("status");
            %>
            <tr>
                <td><%= id %></td>
                <td><%= username %></td>  <!-- Displaying the username -->
                <td><%= totalPrice %></td>
                <td><%= status %></td>
                <td>
                    <form action="updateOrderStatus" method="POST">
                        <input type="hidden" name="orderId" value="<%= id %>">
                        <select name="status" class="form-select" style="width:150px;">
                            <option value="Pending" <%= "Pending".equals(status) ? "selected" : "" %>>Pending</option>
                            <option value="Completed" <%= "Completed".equals(status) ? "selected" : "" %>>Completed</option>
                            <option value="Cancelled" <%= "Cancelled".equals(status) ? "selected" : "" %>>Cancelled</option>
                        </select>
                        <button type="submit" class="btn btn-primary mt-2">Update</button>
                    </form>
                </td>
            </tr>
            <%
                    }
    
                    rs.close();
                    ps.close();
                    conn.close();
                } catch (Exception e) {
                    out.println("<tr><td colspan='5'>Error loading orders: " + e.getMessage() + "</td></tr>");
                    e.printStackTrace();
                }
            %>
        </tbody>
    </table>    
</div>
<!-- Bootstrap JS + Popper -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"></script>

<%@ include file="footer.jsp" %>
</body>
</html>
