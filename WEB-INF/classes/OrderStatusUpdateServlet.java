import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;

public class OrderStatusUpdateServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        String status = request.getParameter("status");

        try {
            if (DBConnection.updateOrderStatus(orderId, status)) {
                response.sendRedirect("admin_orders.jsp");
            } else {
                request.setAttribute("error", "Failed to update order status.");
                request.getRequestDispatcher("admin_orders.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred while updating order status.");
            request.getRequestDispatcher("admin_orders.jsp").forward(request, response);
        }
    }

    // 👇 Add this to handle accidental or test GET requests
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("admin_orders.jsp");
    }
}
