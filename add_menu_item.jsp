<%@ page import="java.sql.*" %>
<%@ page errorPage="error.jsp" %>
<%@ page isErrorPage="true" %>

<%
    String name = request.getParameter("name");
    String description = request.getParameter("description");
    double price = Double.parseDouble(request.getParameter("price"));

    try (Connection conn = DBConnection.getConnection()) {
        String query = "INSERT INTO menu (name, description, price) VALUES (?, ?, ?)";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setString(1, name);
        ps.setString(2, description);
        ps.setDouble(3, price);

        int rows = ps.executeUpdate();
        if (rows > 0) {
            response.sendRedirect("admin_menu.jsp");
        } else {
            out.println("<div class='alert alert-danger'>Failed to add item.</div>");
        }
    } catch (SQLException e) {
        e.printStackTrace();
        out.println("<div class='alert alert-danger'>Error adding item.</div>");
    }
%>
