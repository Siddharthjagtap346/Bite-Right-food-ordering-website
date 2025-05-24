import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.*;

public class CartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Show cart.jsp when user visits /cart directly
        request.getRequestDispatcher("cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int menuId = Integer.parseInt(request.getParameter("menuId"));
        String name = request.getParameter("name");
        String image = request.getParameter("image");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));

        String qtyStr = request.getParameter("quantity");
        int quantity = (qtyStr == null || qtyStr.isEmpty()) ? 1 : Integer.parseInt(qtyStr);

        HttpSession session = request.getSession();
        List<Map<String, Object>> cart = (List<Map<String, Object>>) session.getAttribute("cart");

        if (cart == null) {
            cart = new ArrayList<>();
        }

        boolean found = false;
        for (Map<String, Object> item : cart) {
            if ((int) item.get("menuId") == menuId) {
                int currentQty = (int) item.get("quantity");
                item.put("quantity", currentQty + quantity);
                found = true;
                break;
            }
        }

        if (!found) {
            Map<String, Object> item = new HashMap<>();
            item.put("menuId", menuId);
            item.put("name", name);
            item.put("image", image);
            item.put("description", description);
            item.put("price", price);
            item.put("quantity", quantity);
            cart.add(item);
        }

        session.setAttribute("cart", cart);
        response.sendRedirect("cart"); // redirect to cart page using GET
    }
}
