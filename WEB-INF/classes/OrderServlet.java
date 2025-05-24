import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.*;
import java.util.*;

public class OrderServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        List<Map<String, Object>> cart = (List<Map<String, Object>>) session.getAttribute("cart");
        Integer userId = (Integer) session.getAttribute("userId");

        System.out.println("[OrderServlet#doPost] userId: " + userId);
        System.out.println("Cart size: " + (cart != null ? cart.size() : "null"));

        if (cart != null && !cart.isEmpty() && userId != null) {
            double total = 0.0;

            for (Map<String, Object> item : cart) {
                double price = (Double) item.get("price");
                int quantity = (Integer) item.get("quantity");
                total += price * quantity;
            }

            try (Connection conn = DBConnection.getConnection()) {
                conn.setAutoCommit(false);

                String insertOrder = "INSERT INTO orders (user_id, total_price) VALUES (?, ?)";
                PreparedStatement psOrder = conn.prepareStatement(insertOrder, Statement.RETURN_GENERATED_KEYS);
                psOrder.setInt(1, userId);
                psOrder.setDouble(2, total);
                psOrder.executeUpdate();

                ResultSet rs = psOrder.getGeneratedKeys();
                rs.next();
                int orderId = rs.getInt(1);
                System.out.println("Order created with ID: " + orderId);

                String insertItem = "INSERT INTO order_items (order_id, menu_id, quantity, price) VALUES (?, ?, ?, ?)";
                PreparedStatement psItem = conn.prepareStatement(insertItem);

                for (Map<String, Object> item : cart) {
                    psItem.setInt(1, orderId);
                    psItem.setInt(2, (Integer) item.get("menuId"));
                    psItem.setInt(3, (Integer) item.get("quantity"));
                    psItem.setDouble(4, (Double) item.get("price"));
                    psItem.addBatch();
                }

                psItem.executeBatch();
                conn.commit();

                session.removeAttribute("cart");
                session.setAttribute("success", "Order placed successfully!");
            } catch (Exception e) {
                e.printStackTrace();
                session.setAttribute("error", "Something went wrong while placing your order.");
            }

            response.sendRedirect("order");
        } else {
            response.sendRedirect("menu.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        Integer userId = (session != null) ? (Integer) session.getAttribute("userId") : null;

        System.out.println("[OrderServlet#doGet] userId: " + userId);

        if (userId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        List<Map<String, Object>> ordersList = new ArrayList<>();

        try (Connection conn = DBConnection.getConnection()) {
            String query = "SELECT o.id AS order_id, o.total_price, o.status, o.order_time, " +
                    "m.name, m.description, m.price, m.id AS menu_id, oi.quantity " +
                    "FROM orders o " +
                    "JOIN order_items oi ON o.id = oi.order_id " +
                    "JOIN menu m ON oi.menu_id = m.id " +
                    "WHERE o.user_id = ? ORDER BY o.order_time DESC";

            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            Map<Integer, Map<String, Object>> ordersMap = new LinkedHashMap<>();
            int rowCount = 0;

            while (rs.next()) {
                rowCount++;
                int orderId = rs.getInt("order_id");

                Map<String, Object> order = ordersMap.get(orderId);
                if (order == null) {
                    order = new HashMap<>();
                    order.put("orderId", orderId);
                    order.put("totalPrice", rs.getDouble("total_price"));
                    order.put("status", rs.getString("status"));
                    order.put("orderTime", rs.getTimestamp("order_time"));
                    order.put("items", new ArrayList<Map<String, Object>>());
                    ordersMap.put(orderId, order);
                }

                Map<String, Object> item = new HashMap<>();
                item.put("name", rs.getString("name"));
                item.put("description", rs.getString("description"));
                item.put("price", rs.getDouble("price"));
                item.put("quantity", rs.getInt("quantity"));
                item.put("menuId", rs.getInt("menu_id"));

                ((List<Map<String, Object>>) order.get("items")).add(item);
            }

            System.out.println("Orders fetched: " + rowCount);
            ordersList.addAll(ordersMap.values());
            request.setAttribute("orders", ordersList);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", " Failed to load past orders.");
        }

        request.getRequestDispatcher("orders.jsp").forward(request, response);
    }
}
