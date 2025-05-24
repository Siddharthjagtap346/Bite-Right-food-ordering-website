import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.*;

public class MenuServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Map<String, Object>> menuItems = new ArrayList<>();

        try (Connection conn = DBConnection.getConnection()) {
            String query = "SELECT id, name, description, price FROM menu";
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Map<String, Object> item = new HashMap<>();
                int id = rs.getInt("id");
                item.put("id", id);
                item.put("name", rs.getString("name"));
                item.put("description", rs.getString("description"));
                item.put("price", rs.getDouble("price"));

                // Image name based on ID (e.g., 1.jpg, 2.jpg)
                item.put("image", id + ".jpg");

                menuItems.add(item);
            }

            request.setAttribute("menuItems", menuItems);  // Correct key for JSTL loop
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Failed to load menu items.");
        }

        // Forward to JSP to display the menu
        request.getRequestDispatcher("menu.jsp").forward(request, response);
    }
}
