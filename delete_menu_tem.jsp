<%@ page import="java.sql.*" %>
<%@ page errorPage="error.jsp" %>
<%@ page isErrorPage="true" %>

<%
    int id = Integer.parseInt(request.getParameter("id"));

    try (Connection conn = DBConnection.getConnection()) {
        String query = "DELETE FROM menu WHERE id = ?";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setInt(1, id);

        int rows = ps.executeUpdate();
        if (rows > 0) {
            response.sendRedirect("admin_menu.jsp");
        } else {
            out.println("<div class='alert alert-danger'>Failed to delete item.</div>");
        }
    } catch (SQLException e) {
        e.printStackTrace();
        out.println("<div class='alert alert-danger'>Error deleting item.</div>");
    }
%>
