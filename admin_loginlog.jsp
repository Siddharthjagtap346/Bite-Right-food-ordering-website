<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="navbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login History - BiteRight Admin</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

</head>
<body>
<div class="container mt-5">
    <h2>🕒 Login History</h2>

    <% 
        ResultSet rs = (ResultSet) request.getAttribute("loginLogs");
        if (rs == null) {
    %>
        <div class="alert alert-danger">No login logs found or an error occurred.</div>
    <%
        } else {
    %>
    <table class="table table-striped mt-3">
        <thead>
            <tr>
                <th>Login ID</th>
                <th>User</th>
                <th>Login Time</th>
            </tr>
        </thead>
        <tbody>
            <%
                while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("username") %></td>  <!-- Displaying the username -->
                <td><%= rs.getTimestamp("login_time") %></td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>    
    <%
        }
    %>
</div>
<!-- Bootstrap JS + Popper -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"></script>

<%@ include file="footer.jsp" %>
</body>
</html>
