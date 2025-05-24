import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.*;

@WebServlet("/manageMenu")
public class AdminMenuServlet extends HttpServlet {

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

                // Image name based on ID (e.g., 1.jpg, 2.jpg), even if no image column
                item.put("image", id + ".jpg");

                menuItems.add(item);
            }

            request.setAttribute("menuItems", menuItems); // Set the menu items to request scope
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Failed to load menu items.");
        }

        // Forward to admin_menu.jsp to display the menu
        request.getRequestDispatcher("admin_menu.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String menuIdStr = request.getParameter("menuId");

        try {
            if (menuIdStr != null) {
                // Handle DELETE menu item
                int menuId = Integer.parseInt(menuIdStr);
                boolean success = DBConnection.deleteMenuItem(menuId); // Assuming deleteMenuItem exists
                if (success) {
                    response.sendRedirect("manageMenu?msg=Item+deleted+successfully&type=success");
                } else {
                    response.sendRedirect("manageMenu?msg=Failed+to+delete+item&type=danger");
                }
            } else {
                // Handle ADD menu item
                String name = request.getParameter("name");
                String description = request.getParameter("description");
                String priceStr = request.getParameter("price");

                if (name != null && description != null && priceStr != null) {
                    double price = Double.parseDouble(priceStr);
                    boolean success = DBConnection.addMenuItem(name, description, price); // Assuming addMenuItem exists
                    if (success) {
                        response.sendRedirect("manageMenu?msg=Item+added+successfully&type=success");
                    } else {
                        response.sendRedirect("manageMenu?msg=Failed+to+add+item&type=danger");
                    }
                } else {
                    response.sendRedirect("manageMenu?msg=Missing+form+data&type=warning");
                }
            }
        } catch (SQLException | NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("manageMenu?msg=Server+error+occurred&type=danger");
        }
    }
}
