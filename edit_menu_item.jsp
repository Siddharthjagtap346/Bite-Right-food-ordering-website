<%@ page import="java.sql.*, java.util.*" %>
<%@ page errorPage="error.jsp" %>
<%@ page isErrorPage="true" %>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    String name = request.getParameter("name");
    String description = request.getParameter("description");
    double price = Double.parseDouble(request.getParameter("price"));

    try (Connection conn = DBConnection.getConnection()) {
        String query = "UPDATE menu SET name = ?, description = ?, price = ? WHERE id = ?";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setString(1, name);
        ps.setString(2, description);
        ps.setDouble(3, price);
        ps.setInt(4, id);

        int rows = ps.executeUpdate();
        if (rows > 0) {
            response.sendRedirect("admin_menu.jsp");
        } else {
            out.println("<div class='alert alert-danger'>Failed to update item.</div>");
        }
    } catch (SQLException e) {
        e.printStackTrace();
        out.println("<div class='alert alert-danger'>Error updating item.</div>");
    }
%>
