import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.*;
import java.sql.*;

@WebServlet("/viewUsers")
public class ViewUsersServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Fetch users from the database
            ResultSet users = DBConnection.getAllUsers();
            request.setAttribute("users", users);
            // Forward the result to the JSP
            request.getRequestDispatcher("view_users.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Failed to fetch users.");
            request.getRequestDispatcher("view_users.jsp").forward(request, response);
        }
    }
}
