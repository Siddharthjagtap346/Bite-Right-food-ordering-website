import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/deleteMenuItem")
public class DeleteMenuItemServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("menuId");

        try {
            int menuId = Integer.parseInt(idStr);

            Connection conn = DBConnection.getConnection();
            String sql = "DELETE FROM menu WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, menuId);

            int result = ps.executeUpdate();

            if (result > 0) {
                response.sendRedirect("admin_menu.jsp?msg=Menu+item+deleted+successfully&type=success");
            } else {
                response.sendRedirect("admin_menu.jsp?msg=Failed+to+delete+menu+item&type=danger");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("admin_menu.jsp?msg=Error+occurred+while+deleting&type=danger");
        }
    }
}
