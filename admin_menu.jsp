<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="navbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Menu - BiteRight Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

</head>
<body>
<div class="container mt-5">
    <h2>🍔 Manage Menu</h2>

    <!-- Add Menu Item Form -->
    <form action="manageMenu" method="POST">
        <div class="mb-3">
            <label for="name" class="form-label">Item Name</label>
            <input type="text" name="name" class="form-control" required>
        </div>
        <div class="mb-3">
            <label for="description" class="form-label">Description</label>
            <textarea name="description" class="form-control" required></textarea>
        </div>
        <div class="mb-3">
            <label for="price" class="form-label">Price</label>
            <input type="number" name="price" step="0.01" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-success">Add Menu Item</button>
    </form>

    <h3 class="mt-5">Existing Menu Items</h3>
    <table class="table table-striped mt-3">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Description</th>
                <th>Price</th>
                <th>Image</th>
                <th>Actions</th>
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

                    String query = "SELECT id, name, description, price FROM menu";
                    PreparedStatement ps = conn.prepareStatement(query);
                    ResultSet rs = ps.executeQuery();

                    while (rs.next()) {
                        int id = rs.getInt("id");
                        String name = rs.getString("name");
                        String description = rs.getString("description");
                        double price = rs.getDouble("price");
                        String image = id + ".jpg";
            %>
            <tr>
                <td><%= id %></td>
                <td><%= name %></td>
                <td><%= description %></td>
                <td><%= price %></td>
                <td><img src="images/<%= image %>" alt="<%= name %>" width="50" height="50"></td>
                <td>
                    <form action="manageMenu" method="POST" onsubmit="return confirmDelete();" style="display:inline;">
                        <input type="hidden" name="menuId" value="<%= id %>">
                        <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                    </form>
                </td>
            </tr>
            <%
                    }

                    rs.close();
                    ps.close();
                    conn.close();
                } catch (Exception e) {
                    out.println("<tr><td colspan='6'>Error loading menu items: " + e.getMessage() + "</td></tr>");
                }
            %>
        </tbody>
    </table>
</div>

<!-- Bootstrap JS & Confirmation Script -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function confirmDelete() {
        return confirm("Are you sure you want to delete this menu item?");
    }
</script>
<!-- Bootstrap JS + Popper -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"></script>

<%@ include file="footer.jsp" %>
</body>
</html>
