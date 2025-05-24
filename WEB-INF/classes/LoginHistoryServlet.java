import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;

@WebServlet("/loginHistory")
public class LoginHistoryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Fetch login logs for a specific user or all users
            ResultSet loginLogs = DBConnection.getLoginLogs();  // You can replace this with getLoginHistoryForUser(userId) for user-specific logs
            request.setAttribute("loginLogs", loginLogs);
            request.getRequestDispatcher("admin_loginlog.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Failed to fetch login logs.");
            request.getRequestDispatcher("admin_loginlog.jsp").forward(request, response);
        }
    }
}
